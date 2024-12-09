CREATE DATABASE db_Escola;
USE db_escola;


CREATE TABLE tb_aluno (
pk_id_aluno int auto_increment primary key,
nome varchar (100) not null,
idade int   not null,
sexo char(1),
matricula varchar (20),
turma varchar (20)


);
select*from tb_aluno;
drop table tb_aluno;


CREATE TABLE tb_professor (
pk_id_professor int auto_increment primary key,
nome varchar(50),
cpf char (14),
disciplina varchar (50),
estado_civil varchar (20),
nome_mae varchar(50),
cidade varchar (50)
);

CREATE TABLE tb_aula (
pk_id_aula int auto_increment primary key,
data_aula date,
horario time,
turma varchar (20),
professor_id int,
materia varchar(50)
);

INSERT INTO tb_aluno (nome, idade, sexo, matricula, turma) VALUES
('Ana Silva', 14, 'F', '2021001', '9A'),
('Bruno Oliveira', 15, 'M', '2021002', '9A'),
('Carlos Santos', 13, 'M', '2021003', '8B'),
('Diana Costa', 14, 'F', '2021004', '9A'),
('Eduardo Lima', 15, 'M', '2021005', '9B'),
('Fernanda Sousa', 13, 'F', '2021006', '8A'),
('Gustavo Almeida', 14, 'M', '2021007', '9B'),
('Helena Pereira', 15, 'F', '2021008', '9C'),
('Igor Martins', 13, 'M', '2021009', '8B'),
('Juliana Rocha', 14, 'F', '2021010', '9C');


INSERT INTO tb_professor (nome, cpf, disciplina, estado_civil, nome_mae, cidade) VALUES
('Maria Oliveira', '123.456.789-00', 'Matemática', 'Solteira', 'Ana Oliveira', 'São Paulo'),
('João Silva', '234.567.890-01', 'Física', 'Casado', 'Maria Silva', 'Rio de Janeiro'),
('Paula Santos', '345.678.901-02', 'Química', 'Divorciada', 'Laura Santos', 'Belo Horizonte'),
('Ricardo Almeida', '456.789.012-03', 'História', 'Viúvo', 'Cecília Almeida', 'Curitiba'),
('Tatiane Costa', '567.890.123-04', 'Geografia', 'Solteira', 'Eliane Costa', 'Porto Alegre'),
('Lucas Ferreira', '678.901.234-05', 'Biologia', 'Casado', 'Vanessa Ferreira', 'Fortaleza'),
('Renata Lima', '789.012.345-06', 'Educação Física', 'Solteira', 'Sofia Lima', 'Recife'),
('Felipe Rocha', '890.123.456-07', 'Artes', 'Casado', 'Rita Rocha', 'Salvador'),
('Juliana Martins', '901.234.567-08', 'Inglês', 'Divorciada', 'Vera Martins', 'Brasília'),
('Gabriel Pinto', '012.345.678-09', 'Literatura', 'Viúvo', 'Lúcia Pinto', 'Manaus');


INSERT INTO tb_aula (data_aula, horario, turma, professor_id, materia) VALUES
('2024-10-01', '08:00:00', '9A', 1, 'Matemática'),
('2024-10-01', '10:00:00', '9B', 2, 'Física'),
('2024-10-01', '12:00:00', '9C', 3, 'Química'),
('2024-10-01', '14:00:00', '9A', 4, 'História'),
('2024-10-01', '16:00:00', '9B', 5, 'Geografia'),
('2024-10-01', '18:00:00', '9C', 6, 'Biologia'),
('2024-10-02', '08:00:00', '9A', 7, 'Educação Física'),
('2024-10-02', '10:00:00', '9B', 8, 'Artes'),
('2024-10-02', '12:00:00', '9C', 9, 'Inglês'),
('2024-10-02', '14:00:00', '9A', 10, 'Literatura');

START TRANSACTION;

ALTER TABLE tb_professor DROP COLUMN cidade;

ALTER TABLE tb_professor ADD COLUMN email VARCHAR(100);
UPDATE tb_professor SET email = 'solicitação em andamento';

ALTER TABLE tb_professor MODIFY estado_civil CHAR(10);

ALTER TABLE tb_professor ADD COLUMN formacao_prof VARCHAR(50);

INSERT INTO tb_professor (nome, cpf, disciplina, estado_civil, nome_mae, email, formacao_prof) VALUES
('Clara Mendes', '111.222.333-44', 'Matemática', 'Solteira', 'Nina Mendes', 'solicitação em andamento', 'Matemática'),
('Samuel Costa', '222.333.444-55', 'História', 'Casado', 'Teresa Costa', 'solicitação em andamento', 'História'),
('Lia Rodrigues', '333.444.555-66', 'Geografia', 'Divorciada', 'Gina Rodrigues', 'solicitação em andamento', 'Geografia');

COMMIT;













