CREATE DATABASE faculdade_db;
USE faculdade_db;
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    codigo_curso VARCHAR(10) NOT NULL UNIQUE,
    duracao INT NOT NULL,
    tipo VARCHAR(50) NOT NULL
);
CREATE TABLE Professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100),
    departamento VARCHAR(100)
);
CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100),
    matricula VARCHAR(20) NOT NULL UNIQUE,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);
CREATE TABLE Materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nome_materia VARCHAR(100) NOT NULL,
    codigo_materia VARCHAR(10) NOT NULL UNIQUE,
    creditos INT NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);
CREATE TABLE Turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    ano INT NOT NULL,
    semestre INT NOT NULL,
    id_materia INT,
    id_professor INT,
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor)
);
CREATE TABLE Notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_materia INT,
    nota DECIMAL(5,2),
    frequencia INT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia)
);
SHOW TABLES;
DESCRIBE Cursos;