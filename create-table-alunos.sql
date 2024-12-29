use cadastro;
SELECT * FROM cadastro.alunos;
DESCRIBE cadastro.alunos;
TRUNCATE TABLE cadastro.alunos;

CREATE TABLE IF NOT EXISTS alunos(
	id_aluno int UNSIGNED NOT NULL AUTO_INCREMENT,
    # `ìd aluno` int UNSIGNED NOT NULL AUTO_INCREMENT - As crases (backticks/graves) permitem inserir espaços, caracteres especiais
														# e palavras reservadas do SQL em nomes de coluna e tabela. OBS: Usar espaços é uma má pratica.
                    									# Alguns usam sempre crase por convenção.
    `nome` VARCHAR(30) NOT NULL,
    `nascimento` DATE NOT NULL,
    `sexo` ENUM('F','M'),
    `peso` DECIMAL(5,2),
    `altura` DECIMAL(3,2),
    `nacionalidade` VARCHAR(30) DEFAULT 'BRASIL',
    PRIMARY KEY(id_aluno)
)default charset=utf8;

ALTER TABLE cadastro.alunos DROP id_aluno;

ALTER TABLE cadastro.alunos 
	ADD id_aluno int UNSIGNED NOT NULL,
		ADD PRIMARY KEY(id_aluno);

ALTER TABLE cadastro.alunos 
	ADD profissao varchar(30) NULL 
		AFTER nascimento;
        
UPDATE cadastro.alunos 
	SET profissao = 'programador'
		WHERE id_aluno IN(1,3,5,7);

UPDATE cadastro.alunos
	SET profissao = 'gestor'
		WHERE nascimento BETWEEN '1970-01-01' AND '1980-12-31';
        
UPDATE cadastro.alunos
	SET profissao = 'professor'
		 WHERE nome LIKE '%SILVA%' AND peso>70;

UPDATE cadastro.alunos SET profissao = 'arquiteto'
	WHERE nacionalidade 
		NOT LIKE 'brasil' AND id_aluno NOT IN(1,3,5,7);
		
        
UPDATE alunos SET profissao= null;

INSERT INTO alunos(nome,nascimento,sexo,peso,altura,nacionalidade) 
	VALUES('GODOFREDO','1984-01-02','M','78.5','1.83',default),
          ('MARIA','1999-12-30','F', 55.2, 1.65,'PORTUGAL'),
          ('JOSÉ','1977-08-16','M', 73.1, 1.72,'ESPANHA'),
          ('JULIA','1957-09-21','F', 68.0, 1.42,default),
          ('JOAO','1970-09-21','M',78.0,1.80,default),
		  ('PEDRO','1999-08-13','M',80.6,1.78,default),
          ('CREUZA','1961-01-04','F','60.1',1.56,'URUGUAI'),
          ('ARNALDO','1985-05-02','M','71.2','1.62','CHILE');
use cadastro;
SELECT * FROM cadastro.alunos;
DESCRIBE cadastro.alunos;
TRUNCATE TABLE cadastro.alunos;

CREATE TABLE IF NOT EXISTS alunos(
	id_aluno int UNSIGNED NOT NULL AUTO_INCREMENT,
    # `ìd aluno` int UNSIGNED NOT NULL AUTO_INCREMENT - As crases (backticks/graves) permitem inserir espaços, caracteres especiais
														# e palavras reservadas do SQL em nomes de coluna e tabela. OBS: Usar espaços é uma má pratica.
                    									# Alguns usam sempre crase por convenção.
    `nome` VARCHAR(30) NOT NULL,
    `nascimento` DATE NOT NULL,
    `sexo` ENUM('F','M'),
    `peso` DECIMAL(5,2),
    `altura` DECIMAL(3,2),
    `nacionalidade` VARCHAR(30) DEFAULT 'BRASIL',
    PRIMARY KEY(id_aluno)
)default charset=utf8;

INSERT INTO alunos(nome,nascimento,sexo,peso,altura,nacionalidade) 
	VALUES('GODOFREDO','1984-01-02','M','78.5','1.83',default),
          ('MARIA','1999-12-30','F', 55.2, 1.65,'PORTUGAL'),
          ('JOSÉ','1977-08-16','M', 73.1, 1.72,'ESPANHA'),
          ('JULIA','1957-09-21','F', 68.0, 1.42,default),
          ('JOAO','1970-09-21','M',78.0,1.80,default),
		  ('PEDRO','1999-08-13','M',80.6,1.78,default),
          ('CREUZA','1961-01-04','F','60.1',1.56,'URUGUAI'),
          ('ARNALDO','1985-05-02','M','71.2','1.62','CHILE');
          
# ALTER TABLE cadastro.alunos DROP id_aluno;

INSERT INTO alunos (nome, nascimento, profissao, sexo, peso, altura, nacionalidade) VALUES
('Ana Silva', '2000-05-14', 'Engenheira', 'F', 55.5, 1.65, 'BRASIL'),
('Bruno Santos', '1998-08-22', 'Médico', 'M', 72.0, 1.75, 'PORTUGAL'),
('Carla Mendes', '1995-11-30', 'Advogada', 'F', 60.0, 1.70, 'ARGENTINA'),
('Daniel Pereira', '2001-02-18', 'Arquiteto', 'M', 80.2, 1.80, 'BRASIL'),
('Eliana Costa', '1997-07-06', 'Professora', 'F', 58.3, 1.62, 'CHILE'),
('Fabio Lima', '1999-09-10', 'Engenheiro', 'M', 90.0, 1.85, 'MÉXICO'),
('Gabriela Rocha', '2002-03-25', 'Médica', 'F', 65.4, 1.68, 'COLÔMBIA'),
('Henrique Alves', '1996-12-15', 'Advogado', 'M', 77.5, 1.78, 'ESPANHA'),
('Isabela Souza', '1994-04-08', 'Nutricionista', 'F', 52.0, 1.60, 'ITÁLIA'),
('Jorge Oliveira', '2000-10-01', 'Professor', 'M', 85.0, 1.82, 'BRASIL');

INSERT INTO alunos (nome, nascimento, profissao, sexo, peso, altura, nacionalidade) VALUES
('Lucas Martins', '2016-01-10', 'Estudante', 'M', 20.5, 1.10, 'BRASIL'),
('Mariana Alves', '2017-05-22', 'Estudante', 'F', 18.3, 1.05, 'PORTUGAL'),
('Pedro Costa', '2018-03-15', 'Estudante', 'M', 22.0, 1.12, 'ESPANHA'),
('Sofia Lima', '2019-08-30', 'Estudante', 'F', 19.0, 1.08, 'ARGENTINA');


# adcionionando chave primaria
ALTER TABLE cadastro.alunos 
	ADD id_aluno int UNSIGNED NOT NULL,
		ADD PRIMARY KEY(id_aluno);

# adicionando o novo campo profissão após o campo nascimento
ALTER TABLE cadastro.alunos 
	ADD profissao varchar(30) NULL 
		AFTER nascimento;

# atualizando o novo campo profissao para os registros existentes
UPDATE cadastro.alunos 
	SET profissao = 'programador'
		WHERE id_aluno IN(1,3,5,7);

UPDATE cadastro.alunos
	SET profissao = 'gestor'
		WHERE nascimento BETWEEN '1970-01-01' AND '1980-12-31';
        
UPDATE cadastro.alunos
	SET profissao = 'professor'
		 WHERE nome LIKE '%SILVA%' AND peso>70;

UPDATE cadastro.alunos SET profissao = 'arquiteto'
	WHERE nacionalidade 
		NOT LIKE 'brasil' ;
        
UPDATE alunos SET profissao= null;