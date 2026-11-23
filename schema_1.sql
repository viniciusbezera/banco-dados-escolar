-- Banco de Dados Escolar (MySQL 8.0.16+)

-- 1. ALUNO
CREATE TABLE aluno (
    id_aluno        INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(120) NOT NULL,
    cpf             CHAR(11) NOT NULL UNIQUE,
    email           VARCHAR(150) UNIQUE,
    data_nascimento DATE NOT NULL,
    profissao       VARCHAR(100),
    sexo            CHAR(1) NOT NULL,
    peso_kg         DECIMAL(5,2),
    altura_m        DECIMAL(3,2),
    nacionalidade   VARCHAR(60) NOT NULL,
    criado_em       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
                    ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT ck_aluno_nome     CHECK (CHAR_LENGTH(TRIM(nome)) > 0),
    CONSTRAINT ck_aluno_sexo     CHECK (sexo IN ('M', 'F', 'O')),
    CONSTRAINT ck_aluno_peso     CHECK (peso_kg IS NULL OR peso_kg BETWEEN 1 AND 500),
    CONSTRAINT ck_aluno_altura   CHECK (altura_m IS NULL OR altura_m BETWEEN 0.30 AND 2.50),
    CONSTRAINT ck_aluno_nasc     CHECK (data_nascimento >= '1900-01-01')
);

-- 2. PROFESSOR
CREATE TABLE professor (
    id_professor  INT AUTO_INCREMENT PRIMARY KEY,
    nome          VARCHAR(120) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    email         VARCHAR(150) NOT NULL UNIQUE,
    ativo         BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 3. SECRETARIA
CREATE TABLE secretaria (
    id_secretaria      INT AUTO_INCREMENT PRIMARY KEY,
    nome               VARCHAR(120) NOT NULL,
    registro_funcional VARCHAR(40) NOT NULL UNIQUE,
    email              VARCHAR(150) UNIQUE,
    ativo              BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 4. CURSO
CREATE TABLE curso (
    id_curso      INT AUTO_INCREMENT PRIMARY KEY,
    id_professor  INT NOT NULL,
    nome          VARCHAR(120) NOT NULL,
    total_aulas   INT NOT NULL,
    carga_horaria INT NOT NULL,
    ano           SMALLINT NOT NULL,
    criado_em     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_curso_professor
        FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_curso_aulas   CHECK (total_aulas > 0),
    CONSTRAINT ck_curso_carga   CHECK (carga_horaria >= total_aulas),
    CONSTRAINT ck_curso_ano     CHECK (ano BETWEEN 2000 AND 2100),
    CONSTRAINT uq_curso_nome_ano UNIQUE (nome, ano),
    INDEX idx_curso_professor (id_professor)
);

-- 5. MATRICULA
CREATE TABLE matricula (
    numero_matricula      INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno              INT NOT NULL,
    id_curso              INT NOT NULL,
    id_secretaria         INT NOT NULL,
    data_matricula        DATE NOT NULL DEFAULT (CURRENT_DATE),
    frequencia_percentual DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    status                VARCHAR(20) NOT NULL DEFAULT 'Ativa',
    criado_em             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_matricula_curso
        FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_matricula_secretaria
        FOREIGN KEY (id_secretaria) REFERENCES secretaria(id_secretaria)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT uq_matricula_aluno_curso UNIQUE (id_aluno, id_curso),
    CONSTRAINT ck_matricula_freq   CHECK (frequencia_percentual BETWEEN 0 AND 100),
    CONSTRAINT ck_matricula_status CHECK (status IN ('Ativa','Concluida','Trancada','Cancelada')),
    INDEX idx_matricula_curso (id_curso),
    INDEX idx_matricula_secretaria (id_secretaria)
);

-- Idade calculada na consulta, em vez de armazenada
CREATE VIEW vw_aluno AS
SELECT a.*, TIMESTAMPDIFF(YEAR, a.data_nascimento, CURRENT_DATE) AS idade
FROM aluno a;
