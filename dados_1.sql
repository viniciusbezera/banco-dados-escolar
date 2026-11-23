-- Dados fictícios (executar depois do schema.sql)

-- 1. ALUNO
INSERT INTO aluno (nome, cpf, email, data_nascimento, profissao, sexo, peso_kg, altura_m, nacionalidade) VALUES
('Mariana Souza Lima',   '11122233344', 'mariana.lima@email.com',   '1998-03-14', 'Designer',            'F', 62.50, 1.68, 'Brasileira'),
('Carlos Eduardo Rocha', '22233344455', 'carlos.rocha@email.com',   '1990-07-22', 'Analista de Sistemas','M', 82.30, 1.80, 'Brasileira'),
('Aline Fernandes',      '33344455566', 'aline.fernandes@email.com','2001-11-05', 'Estudante',           'F', 55.00, 1.62, 'Brasileira'),
('Diego Martínez',       '44455566677', 'diego.martinez@email.com', '1985-01-30', 'Engenheiro Civil',    'M', 90.10, 1.77, 'Argentina'),
('Alex Moreira',         '55566677788', 'alex.moreira@email.com',   '1995-09-18', 'Fotógrafo(a)',        'O', 70.40, 1.73, 'Brasileira');

-- 2. PROFESSOR
INSERT INTO professor (nome, especialidade, email, ativo) VALUES
('Dra. Helena Barros',     'Banco de Dados',         'helena.barros@escola.edu.br',     TRUE),
('Prof. Ricardo Alves',    'Programação Web',        'ricardo.alves@escola.edu.br',     TRUE),
('Profa. Juliana Castro',  'Design de Interfaces',   'juliana.castro@escola.edu.br',    TRUE),
('Prof. Fernando Teixeira','Redes de Computadores',  'fernando.teixeira@escola.edu.br', TRUE),
('Profa. Patrícia Nunes',  'Engenharia de Software', 'patricia.nunes@escola.edu.br',    FALSE);

-- 3. SECRETARIA
INSERT INTO secretaria (nome, registro_funcional, email, ativo) VALUES
('Camila Duarte',    'SEC-0001', 'camila.duarte@escola.edu.br',    TRUE),
('Roberto Pinheiro', 'SEC-0002', 'roberto.pinheiro@escola.edu.br', TRUE),
('Vanessa Lopes',    'SEC-0003', 'vanessa.lopes@escola.edu.br',    TRUE),
('Marcos Vieira',    'SEC-0004', 'marcos.vieira@escola.edu.br',    TRUE),
('Sônia Ribeiro',    'SEC-0005', 'sonia.ribeiro@escola.edu.br',    FALSE);

-- 4. CURSO
INSERT INTO curso (id_professor, nome, total_aulas, carga_horaria, ano) VALUES
(1, 'Modelagem de Banco de Dados', 30, 60, 2026),
(2, 'Desenvolvimento Web com JS',  40, 80, 2026),
(3, 'UX/UI Design',                24, 48, 2026),
(4, 'Fundamentos de Redes',        20, 40, 2025),
(5, 'Engenharia de Requisitos',    16, 32, 2025);

-- 5. MATRICULA
INSERT INTO matricula (id_aluno, id_curso, id_secretaria, data_matricula, frequencia_percentual, status) VALUES
(1, 1, 1, '2026-02-10',  92.50, 'Ativa'),
(1, 3, 1, '2026-02-10',  88.00, 'Ativa'),
(2, 2, 2, '2026-02-12',  75.00, 'Ativa'),
(3, 1, 3, '2026-02-15', 100.00, 'Concluida'),
(4, 4, 2, '2025-03-01',  40.00, 'Trancada');
