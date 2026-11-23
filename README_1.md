# 🎓 Banco de Dados Escolar

Modelagem relacional de um sistema de cursos: alunos, professores, secretaria, cursos e matrículas.

## Entidades

| Tabela | Descrição |
|---|---|
| `aluno` | Dados pessoais e antropométricos do aluno |
| `professor` | Docentes e suas especialidades |
| `secretaria` | Funcionários que registram matrículas |
| `curso` | Cursos oferecidos, vinculados a um professor |
| `matricula` | Entidade associativa entre aluno, curso e secretaria |

## Relacionamentos

- Um **professor** ministra vários **cursos** (1:N)
- Um **aluno** pode se matricular em vários **cursos** e vice-versa (N:N, via `matricula`)
- Uma **secretaria** registra várias **matrículas** (1:N)

## Destaques técnicos

- Chaves primárias e estrangeiras nomeadas
- `CHECK` para validar peso, altura, frequência e status
- `UNIQUE (id_aluno, id_curso)` evita matrícula duplicada
- Idade calculada por *view* a partir da data de nascimento
- Colunas de auditoria (`criado_em`, `atualizado_em`) e índices nas FKs

## Como executar

Requer **MySQL 8.0.16+** (para o `CHECK` funcionar).

```bash
mysql -u seu_usuario -p nome_do_banco < schema.sql
mysql -u seu_usuario -p nome_do_banco < dados.sql
```

## Arquivos

- `schema.sql`: criação das tabelas, índices e view
- `dados.sql`: dados fictícios (5 registros por tabela)

## Autor

Vinicius Bezerra · [GitHub](https://github.com/viniciusbezera) · [LinkedIn](https://linkedin.com/in/vinicius-bezerra-73247a164)
