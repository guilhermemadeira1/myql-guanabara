use cadastro;

DROP TABLE pessoas; # apaga a tabela junto com todos os seus registros
TRUNCATE TABLE pessoas; # apaga todos os regitros da tabela
SELECT * FROM pessoas; # consulta todos os registros da tabela

#DELETE FROM pessoas WHERE id >1 and id <=6;
CREATE TABLE pessoas(
	id TINYINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE NOT NULL,
    sexo ENUM('F','M') NOT NULL,
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(20) DEFAULT 'BRASIL',
    PRIMARY KEY(id)
)DEFAULT CHARSET=utf8;

# Os valores numéricos inteiros e decimais podem ser passados entre aspas ou sem aspas.
INSERT INTO pessoas(nome, nascimento, sexo, peso, altura)
VALUES ('GODOFREDO','1984-01-02', 'M', '78.5', '1.83');

INSERT INTO pessoas(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES ('MARIA','1999-12-30','F', 55.2, 1.65, 'PORTUGAL');

# DEFAULT representa um valor padrão ou gerado automaticamente.
INSERT INTO pessoas(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES (default,'JOSÉ','1977-08-16','M', 63.1, 1.72, 'ESPANHA');

# Se a quantidade de valores adcionados no novo registro correspondem a 
# mesma quantidade de colunas na tabela, pode ocultar o nome das colunas.
INSERT INTO pessoas VALUES (default, 'JULIA','1957-09-21','F', 68.0, 1.42, default);

#UPDATE pessoas SET nascimento='1957-09-21', sexo='F' WHERE id = '4';

