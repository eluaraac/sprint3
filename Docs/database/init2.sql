DROP TABLE IF EXISTS Aluno CASCADE;
DROP TABLE IF EXISTS Livro CASCADE;
DROP TABLE IF EXISTS Emprestimo CASCADE;
DROP TABLE IF EXISTS ItemEmprestimo CASCADE;

CREATE TABLE Aluno (
	id_aluno SERIAL PRIMARY KEY NOT NULL,
	nome VARCHAR(20) NOT NULL UNIQUE, 
	matricula VARCHAR(4) NOT NULL UNIQUE,
	dataNascimento DATE NOT NULL, 
	email VARCHAR(50) NOT NULL,
	telefone VARCHAR(11) NOT NULL
);

SELECT * FROM Aluno;

CREATE TABLE Livro (
	id_livro SERIAL PRIMARY KEY NOT NULL,
	titulo VARCHAR NOT NULL, 
	autor VARCHAR NOT NULL,
	editora VARCHAR NOT NULL, 
	anoPublicacao INT NOT NULL,
	isbn VARCHAR(10) NOT NULL UNIQUE,
	quantidadeTotal INT NOT NULL,
	quantidadeDisponivel INT NOT NULL
);

SELECT * FROM Livro;
	
CREATE TABLE Emprestimo (
	id_emprestimo SERIAL PRIMARY KEY NOT NULL,
	id_aluno INT NOT NULL,
	dataEmprestimo DATE NOT NULL,
	dataPrevistaDevolucao DATE NOT NULL,
	dataDevolucao DATE NOT NULL,
	FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

SELECT * FROM Emprestimo;

CREATE TABLE ItemEmprestimo (
	id_itememprestimo SERIAL PRIMARY KEY NOT NULL,
	id_livro INT NOT NULL,
	id_emprestimo INT NOT NULL,
	FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo),
	FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

SELECT * FROM ItemEmprestimo;

INSERT INTO Aluno (nome, matricula, dataNascimento, email, telefone) VALUES
('José Mateus', '1234', '1984-05-23', 'jose@email.com', '12345678901'),
('Renato Oliveira', '4321', '2000-11-14', 'renato@email.com', '78956425368'),
('Isadora Barbosa', '8765', '2009-05-25', 'isadora@email.com', '78541239854'),
('Mariana Valeria', '3745', '2009-05-20', 'mariana@email.com', '74589632145'),
('Eluara Andrade', '4925', '2009-09-10', 'eluara@email.com', '85214796336'),
('Amanda Pegoraro', '3285', '2009-07-29', 'amanda@email.com', '52147896321'),
('Lavinia Braulio', '2742', '2009-07-25', 'lavinia@email.com', '96321478564'),
('Victor Silva', '7207', '2006-11-04', 'victor@email.com', '32147896575'),
('Jon Snow', '7654', '2008-02-14', 'jon.snow@email.com', '16990000001'),
('Arya Stark', '0987', '2009-04-22', 'arya.stark@email.com', '16990000002'),
('Tyrion Lannister', '0983', '2007-11-18', 'tyrion.lannister@email.com', '16990000003'),
('Daenerys Targaryen', '5293', '2008-07-01', 'daenerys.targaryen@email.com', '16990000004'),
('Arthur Morgan', '8273','2007-03-09', 'arthur.morgan@email.com', '16990000005'), 
('John Marston', '9573', '2008-09-16', 'john.marston@email.com', '16990000006'),
('Sadie Adler', '9367', '2009-01-27', 'sadie.adler@email.com', '16990000007'),
('Dutch van der Linde', '8284', '2007-06-12', 'dutch.vanderlinde@email.com', '16990000008');

INSERT INTO Livro (titulo, autor, editora, anoPublicacao, isbn, quantidadeTotal, quantidadeDisponivel) VALUES
('Vidas Secas', 'Graciliano Ramos', 'Leitura', 1938, '1234567891', '10', '5'),
('O quarto de despejo', 'Carolina Maria de Jesus', 'Leitura', 2000, '7522869236', '15', '7'),
('Capitães de Areia', 'Aluisio de Azevedo', 'Leitura', 1854, '8541398578', '8', '2'),
('O cortiço', 'Aluisio de Azevedo', 'Leitura', 1958, '9632587412', '15', '6'),
('Guerra do Paraguai', 'Robson Alves', 'Leitura', 2000, '9876543212', '18', '12'),
('A hora da estrela', 'Clarice Lispector', 'Leitura', 1999, '9638527415', '14', '8'),
('Nasce uma estrela', 'Pocah', 'Leitura', 1955, '7894561233', '16', '8'),
('Escravidão: 1764', 'Murilo Huff', 'Leitura', 1845, '9517536458', '10', '1'),
( 'Introdução à Orientação a Objetos com C++ e Python', 'Orlando Saraiva Jr.', 'Novatec', 2017, '8745965847', 12, 12),
('Análise e Design Orientados a Objetos', 'Hélio Engholm Jr.', 'Novatec', 2013, '9857522406', 10, 10 ),
('C# - Guia de Consulta Rápida','Joel Saade','Novatec', 2008, '8788575229', 14, 14),
('Requisitos em Projetos de Software e de Sistemas de Informação', 'João M. Fernandes e Ricardo J. Machado', 'Novatec', 2017, '9788752260', 11, 11),
('Engenharia de Software na Prática', 'Hélio Engholm Jr.', 'Novatec', 2010,'9788552221', 13, 13),
('Fundamentos da Engenharia de Software','Nathaniel Schutta e Dan Vega','Novatec',2026, '9788575229', 15, 15);

INSERT INTO Emprestimo (id_aluno, dataEmprestimo, dataPrevistaDevolucao, dataDevolucao) VALUES
(1, '2026-07-31', CURRENT_DATE + 7, '2026-08-08'),
(2, '2026-06-15', CURRENT_DATE + 7, '2026-06-27'),
(3, '2026-09-05', CURRENT_DATE + 7, '2026-09-19'),
(6, '2026-05-01', CURRENT_DATE + 7, '2026-05-14'),
(4, '2026-01-01', CURRENT_DATE + 7, '2026-01-08'),
(5, '2026-10-10', CURRENT_DATE + 7, '2026-10-22'),
(8, '2026-02-05', CURRENT_DATE + 7, '2026-02-19'),
(7, '2026-12-05', CURRENT_DATE + 7, '2026-12-17'),
(9, '2026-11-01', CURRENT_DATE + 7, '2026-11-04'),
(10, '2026-10-31',CURRENT_DATE + 7, '2026-11-08'),
(11, '2026-10-30', CURRENT_DATE + 7, '2026-11-12'),
(12, '2026-10-29', CURRENT_DATE + 7, '2026-11-15'),
(13, '2026-10-28', CURRENT_DATE + 7, '2026-11-22');

INSERT INTO ItemEmprestimo (id_itememprestimo, id_livro, id_emprestimo) VALUES
(1, 2, 3),
(2, 3, 1),
(3, 1, 2),
(4, 5, 6),
(5, 7, 8),
(6, 8, 7),
(7, 6, 4),
(8, 4, 5),
(9, 12, 10);

SELECT * FROM Aluno;
SELECT * FROM Livro;
SELECT * FROM Emprestimo;
SELECT * FROM ItemEmprestimo;