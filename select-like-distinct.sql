use cadastro;

# A cláusula LIKE é uma condição que define uma string que representa um padrão de dados de uma coluna.
# Já NOT LIKE é uma condição que consulta colunas cujos valores NÃO atendam ao padrão de dados.

# % -> Define que a partir dele ou antes, quaisquer caracteres são desconsiderados.
# _ -> Define que qualquer caractere pode ser interpolado no lugar.

# SELECT <colunas> FROM <tabela> WHERE <coluna> LIKE '<padrão de dados>'
# No MySQL, a cláusula LIKE não é case sensitive(não distingue minusculos de maiúsculos).

# DISTINT serve para consultar valores distintos de uma coluna. 
# Considera apenas uma ocorrência de cada valor distinto do campo.

SELECT * FROM alunos WHERE nome LIKE 'maria'; # Consulta todos os alunos com nome 'maria'
SELECT * FROM alunos WHERE nome LIKE 'silva%'; # Consulta todos os alunos cujo nome começa com 'silva'. Ex: 'Silvana'
SELECT * FROM alunos WHERE nome LIKE '%silva%'; # Consulta todos os alunos cujo nome tem 'silva' em qualquer parte. Ex: 'Silvana' e 'José silva'.

SELECT * from alunos WHERE nome NOT LIKE 'A%'; # Consulta todos os alunos cujos nomes começam com A.
SELECT * FROM alunos WHERE nome NOT LIKE '%A'; # Consulta todos os alunos cujos nomes terminam com A.
SELECT * FROM alunos WHERE nome NOT LIKE '%A%O'; # Consulta os alunos cujos nomes não terminam com A ou O.


SELECT * FROM alunos WHERE altura LIKE '1.7%'; # Consulta todos os alunos com a altura a partir de 1.70.
SELECT * FROM alunos WHERE peso LIKE '6%'; # Consulta todos os alunos que pesam a patir de 60 kg.
SELECT * FROM alunos WHERE nascimento LIKE '195_-09-__'; # Consulta todos os alunos que nasceram em setembro da década de 50.

SELECT * FROM cursos WHERE nome LIKE 'PH%P'; # Consulta todos os cursos cujo nome começa com 'P' e termina com 'P'. Ex: 'PHP' e '`Photoshop'.
SELECT * FROM cursos WHERE nome NOT LIKE '%básico%'; # Consulta todos os cursos cujo nome não inclua a palavra 'básico'.
SELECT * FROM cursos WHERE nome LIKE 'J_V_'; # Consulta todos os cursos que tiverem 4 caracteres, com 'J' na primeira posição e 'V' na terceira.

INSERT INTO cadastro.alunos VALUES (default,'JOSÉ SILVA','2010-03-29','M','90.5','1.90',default);

SELECT DISTINCT nacionalidade FROM alunos; # Consulta as nacionalidades distintas registradas.
SELECT DISTINCT ano FROM cursos ORDER BY ano DESC; # Consulta todos anos de lançamento dos cursos ordenando do mais recente pro mais antigo.
SELECT DISTINCT nacionalidade FROM alunos ORDER BY nacionalidade ASC; # Consulta as nacionalidades distintas ordenando as mesmas de A a Z.


