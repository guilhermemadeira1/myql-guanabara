use cadastro;
show create table cursos; # exibe o comando sql usando pra criar a estrutura da tabela

# default <valor padrao> -> define um valor padrão pra uma coluna, caso não seja passado nenhum valor.

CREATE TABLE IF NOT EXISTS cursos(
	nome varchar(20) NOT NULL UNIQUE, # UNIQUE define que a coluna não pode 
									  # ter campos com valores repetidos. 
                                      # Vem após o NULL ou NOT NUL.
    descricao text NOT NULL,
    carga int UNSIGNED NOT NULL,    # Restrição UNSIGNED define que a coluna de númmero
									# inteiro não aceitará valores com sinal negativo(ex:-1).
									# OBS: A restrição só vale para tipos inteiros
									#(tinyint, smallint, mediumint, int e bigint).
                                    # USIGNED é definido após a posição do tipo inteiro.
    totaulas int UNSIGNED NOT NULL,
    ano YEAR NOT NULL DEFAULT '2016'
)DEFAULT CHARSET=utf8;

ALTER TABLE cursos CHANGE COLUMN totaulas aulas int UNSIGNED;

ALTER TABLE cursos ADD COLUMN id int UNSIGNED FIRST;
ALTER TABLE cursos CHANGE COLUMN id idcurso int UNSIGNED;
ALTER TABLE cursos CHANGE COLUMN idcurso id_curso int UNSIGNED;

ALTER TABLE cursos ADD COLUMN descricao text ;

ALTER TABLE cursos ADD PRIMARY KEY(id);
DROP TABLE cursos;  

describe cursos; # describe é para exibir detalhes da tabela

SELECT * FROM cursos;

# INSERT INTO <tabela> VALUE(<valores>) -> VALUE adiciona valores a apenas um registro.
# INSERT INTO <tabela> VALUES(<valores>) -> VALUES adciona valores a um ou vários registros.

INSERT INTO cursos(id, nome, carga, aulas, ano) VALUE(default,'Matemática', 80, 30, default);
INSERT INTO cursos(nome, carga, aulas, ano) VALUE('Português', 75, 26, '2017');

INSERT INTO cursos(nome, carga, aulas) VALUES
	('Geometria', 70, 28),
    ('Literatura', 65, 26),
    ('Biologia', 65, 26),
    ('História', 70, 28);
