use cadastro;

# DISTINCT -> Usado para consultar valores distintos de uma coluna. 
# Considera apenas uma ocorrência (registro) de cada grupo de valor distinto na coluna.

# GROUP BY -> Usado para consultar os agrupamentos de registos com mesmo valor numa coluna.
# Permite usar funções de agregação para contar o número de registros para cada agrupamento.

# OBS: Considera todas as ocorrências, mas exibe apenas seus agrupamentos (que podem agrupar mais de um registro, 
# sendo estes visíveis com count(*)).

# HAVING -> Cláusula que define uma condição de filtro para os agrupamentos do GROUP BY.

# Ambos consultam a quantidade de registros de cursos por cada agrupamento de número de aulas
SELECT DISTINCT aulas 
FROM cursos 
ORDER BY aulas;

SELECT aulas 
FROM cursos 
GROUP BY aulas 
ORDER BY aulas;

# Ambos consultam os grupos de aulas e as quantidades de registros de cursos para cada um.
SELECT aulas, count(*)          
FROM cursos                     # O count(*) conta a quantidade de registros. Qualquer coluna pode ser
GROUP BY aulas;                 # usada no lugar do * para contar os registros, desde que não seja nula.
							    # OBS: O count() considera apenas os registros com campos não nulos na coluna
						        # especificada, mas com o * considera todos os registros sem excessão.
SELECT aulas, count(nome)
FROM cursos 
GROUP BY aulas;
                                                      
# Consulta a quantidade de registros de curso para cada agrupamento de ano, com os grupos de ano
# em ordem númerica crescente.                                        
SELECT ano, count(*)  
FROM cursos              
GROUP BY ano
ORDER BY ano;

# Consulta a quantidade de registro de cursos para cada agrupamento de ano, considerando apenas os
# grupos de ano mais recentes ou iguais a 2015 e ordenando os grupos em ordem numérica decrescente.
SELECT ano, count(*)
FROM cursos
GROUP BY ano HAVING ano>='2015'
ORDER BY ano DESC;

# Consulta a quantidade de cursos para cada agrupamento de carga horária, considerando apenas os grupos
# de carga que estejam acima da média das cargas de todos os cursos registradados e com os agrupamentos em ordem crescente.
SELECT carga, count(*)
FROM cursos
GROUP BY carga HAVING carga >(
	SELECT avg(carga) FROM cursos
) 
ORDER BY carga;

# Exercicios select3

#1- Uma lista com as profissões dos alunos e seus respectivos quantitativos
SELECT profissao, count(*)
FROM alunos
GROUP BY profissao
ORDER BY profissao;

#2- Quantos alunos homens e quantas mulheres nasceram após 01/Jan/2005?
SELECT sexo, count(*)
FROM alunos 
WHERE nascimento >'2005-01-01'
GROUP BY sexo;

#3- Uma lista com os alunos que nasceram fora do Brasil, mostrando o país de origem 
# e o total de pessoas nascidas lá. Só nos interessam os países que tiverem mais de 3 alunos
# com essa nacionalidade.

SELECT nacionalidade, count(*) AS quantidade_alunos
FROM alunos
WHERE nacionalidade<>'brasil'
GROUP BY nacionalidade HAVING quantidade_alunos>3;

#4- Uma lista agrupada pela altura dos alunos, mostrando quantas pessoas pesam mais de 100kg 
# e que estão acima da média de altura de todos os cadastrados.

SELECT altura, count(*)
FROM alunos
WHERE peso>100
GROUP BY altura HAVING altura>(SELECT avg(altura) FROM alunos);