use cadastro;

SELECT * FROM cursos WHERE ano=2016;
SELECT count(*) AS `número de registros de cursos` FROM cadastro.cursos;
SELECT count(*) AS `número de registros de alunos` FROM cadastro.alunos;
SELECT count(nome) FROM cursos;

SELECT nome, max(carga) FROM cursos;
SELECT nome, min(carga) FROM cursos;
SELECT max(ano) FROM cursos;
SELECT min(ano) FROM cursos;

SELECT sum(aulas) FROM cursos;
SELECT avg(aulas) FROM cursos;

UPDATE `cadastro`.`cursos` SET `aulas` = '39' WHERE idcurso=(SELECT `idcurso` FROM `cadastro`.`cursos` WHERE `nome`='Java');


# Exercios select2

# 1 - Lista com todas as alunas
SELECT * FROM alunos 
	WHERE sexo='F';

# 2 - Lista com os dados dos alunos que nasceram entre 31 de janeiro 
# de 2000 e 31 de dezembro de 2015.
SELECT * FROM alunos 
	WHERE nascimento BETWEEN '2000-01-31' AND '2015-12-31'; # BETWEEN <menor valor> AND <maior valor>

# 3 - Lista com todos os alunos homens que são programadores.
SELECT * FROM alunos 
	WHERE sexo='m' 
		AND profissao LIKE '%programador%';

# 4 - Lista com todos os dados das alunas que nasceram no Brasil e tem seu 
# nome iniciado com a letra J.
SELECT * FROM alunos 
	WHERE sexo='f' 
		AND nome LIKE 'J%';

# 5 - Lista com nome e nacionalidade dos alunos homens que tem sobrenome Silva,
# são estrangeiros e pesam menos de 100kg.
SELECT nome, nacionalidade FROM alunos 
	WHERE nome LIKE '% silva%' 
		AND nacionalidade <>'Brasil' 
			AND sexo='m' 
				AND peso<'100';

# 6 - A maior altura entre os alunos homens que são brasileiros.
SELECT max(altura) FROM alunos 
	WHERE  nacionalidade = 'Brasil' 
		AND sexo='m';

