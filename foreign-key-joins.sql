use cadastro;
describe cadastro.alunos;
describe cadastro.cursos;

SELECT * FROM alunos;
SELECT * FROM cursos;

# INNER JOIN/JOIN une registros de duas tabelas por PK e FK, considerando apenas os registros da primeira tabela que possuem vínculo 
# com os registros da segunda tabela. Considera apenas os registros que vinculam ambas as tabelas.

# LEFT OUTER JOIN/LEFT JOIN une registros de duas tabelas por PK e FK, considerando todos os registros da tabela declarada à esquerda do
# LEFT JOIN e apenas os da direita que possuem relação com a da esquerda.

# RIGHT OUTER JOIN/RIGHT JOIN une registros de duas tabelas por PK e FK, considerando todos os registros da tabela declarada à direita do
# RIGHT JOIN e apenas os da esquerda que possuem relação com a da direita.

# MUL = Chave Múltipla/Estrangeira.

#ALTER TABLE cursos DROP COLUMN curso_preferido;
ALTER TABLE alunos ADD COLUMN curso_preferido int;					  		      # adiciona coluna curso_preferido do tipo int
ALTER TABLE alunos MODIFY COLUMN curso_preferido int AFTER profissao;		      # move curso_preferido para depois da coluna profissão.
ALTER TABLE alunos CHANGE COLUMN curso_preferido curso_atual int AFTER profissao; # renomeia curso_preferido para cursando redefinindo as propriedades.

ALTER TABLE alunos CHANGE COLUMN curso_atual curso_atual int(10) UNSIGNED AFTER profissao; # Adcionando tipo e restrição compatíveis com 
																						   # id_curso da tabela cursos.
                                                                                           
ALTER TABLE alunos CHANGE COLUMN curso_atual curso_preferido int unsigned after profissao; # Definindo o nome da coluna pra curso_preferido novamente

# OBS: É necessário espeficar o mesmo nome da coluna,
# caso o nome não precise ser alterado.

# OBS: Chaves estrangeiras não possuem AUTO_INCREMENT.

# OBS: MODIFY e CHANGE obriga a redefinir as propriedades.
# MODIFY altera as propriedades, CHANGE renomeia e redefine as propriedades. 

ALTER TABLE cadastro.alunos
ADD FOREIGN KEY(curso_atual) REFERENCES cadastro.cursos(id_curso); # Adicionando curso_atual da tabela alunos como chave estrangeira que referencia
																	# a coluna curso_id, chave primária da tabela cursos.
UPDATE alunos SET curso_atual = '6' WHERE id_aluno = '1';
UPDATE alunos SET curso_atual = (SELECT id_curso FROM cursos WHERE nome LIKE '%HTML%') WHERE id= '2';

UPDATE `cadastro`.`alunos` SET `curso_atual` = '3' WHERE (`id_aluno` = '2');
UPDATE `cadastro`.`alunos` SET `curso_atual` = '5' WHERE (`id_aluno` = '4');
UPDATE `cadastro`.`alunos` SET `curso_atual` = '7' WHERE (`id_aluno` = '9');
UPDATE `cadastro`.`alunos` SET `curso_atual` = '1' WHERE (`id_aluno` = '10');
UPDATE `cadastro`.`alunos` SET `curso_atual` = '2' WHERE (`id_aluno` = '3');
UPDATE `cadastro`.`alunos` SET `curso_atual` = '6' WHERE (`id_aluno` = '8');

SELECT alunos.nome, cursos.nome FROM alunos INNER JOIN cursos ON curso_atual = id_curso; 
#  Consulta os nomes de alunos que estão matriculados em algum curso com o nome dos cursos.

SELECT alunos.nome AS aluno,
	   timestampdiff(year, alunos.nascimento, curdate()) AS idade, 
	   cursos.nome AS cursando, 
	   cursos.descricao
FROM alunos INNER JOIN cursos ON curso_atual = id_curso;
# Consulta o nome do aluno, a idade atual do aluno, o curso que está cursando e sua descrição.

SELECT a.nome, c.nome, c.descricao 
FROM alunos AS a INNER JOIN cursos AS c ON curso_atual = id_curso;
# Consulta os nomes de alunos, os nomes dos cursos em que estão matriculados e com suas descrições.   

SELECT a.nome, c.nome
FROM alunos a LEFT OUTER JOIN cursos c ON a.curso_atual = c.id_curso;
# Consulta todos os nomes de alunos, incluindo os que não estão matriculados em nenhum curso,
# junto com os nomes dos cursos que estão vinculados aos alunos.

SELECT a.nome, c.nome
FROM alunos a RIGHT OUTER JOIN cursos c ON a.curso_atual = c.id_curso;
# Consulta todos os cursos, incluindo os que não estão vinculados a nenhum aluno,
# junto com os nomes dos alunos que estão vinculados aos cursos.
