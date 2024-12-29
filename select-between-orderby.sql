use cadastro;

SELECT id_aluno,idcurso,
	concat_ws(' vive em ',alunos.nome, alunos.nacionalidade) AS aluno, #concat_ws -> concat With Saparator, primeiro parametro é o separador
    concat(id_aluno,'e está cursando ',cursos.nome) AS cursando # concat -> concatena valores em uma string: concat(val1,' ',val2 ), concat(' ',val1)
    FROM alunos JOIN cursos ON id_aluno=idcurso;

# SELECT <colunas> WHERE <condição> -> Comando de consulta de dados com base numa condição. Retorna um Result Set (conjunto resultante) que
# contém apenas os dados consultados. OBS: O WHERE filtra apenas os registros.

# Ordem das cláusulas de consulta

# SELECT -> Consulta campos (colunas) 
# FROM -> Seleciona tabelas
# JOIN -> Junta de tabelas
# WHERE  -> Condição de filtragem de registro
# GROUP BY -> Agrupa com base em valores de campo e HAVING -> Condição de agrupamento
# ORDER BY -> Ordenação do result set
# LIMIT -> Limite de registros do result set

SELECT alunos.nome, cursos.nome 
FROM cadastro.alunos
JOIN cursos ON alunos.id_aluno = cursos.idcurso
WHERE nascimento BETWEEN '1970-01-01' AND '2010-12-31'
GROUP BY nome HAVING sexo = 'm' AND sexo = 'f'
ORDER BY nome ASC
LIMIT 100;

# ORDER BY ordena os registros em ordem alfabetica pela PRIMEIRA letra de A a Z, ou numerica do menor pro menor;
# Pode receber parametros DESC(descendente) ou ASC(ascendente). OBS: ORDER BY vem depois da condição da cláusula WHERE.

# Sintaxe:
# SELECT <campos> FROM <tabela> WHERE <condição> ORDER BY

# ASC -> numeros e tempo do menor pro maior, A a Z.
# DESC -> numeros e tempo do maior pro menor, Z a A. OBS: Não confundir com DESC/DESCRIBE <tabela>

# OBS: ORDER BY ordena em ascendente por padrão, ao não especificar o parametro.

# BETWEEN consulta valores numéricos, de data e tempo que estão entre ou são iguais a 
# <menor valor> e <maior valor>. Sintaxe:

# SELECT <campos> FROM <tabela> WHERE <campo> BETWEEN <menor valor> AND <maior valor> -> 

SELECT * FROM alunos; # Consulta todos os registros de alunos
SELECT * FROM alunos ORDER BY nome; # Consulta todos os alunos por nome em ordem alfabetica crescente (A a Z).
SELECT * FROM alunos ORDER BY nome ASC; # Consulta todos os alunos por nome em ordem alfabetica crescente (A a Z).
SELECT nacionalidade, nome FROM alunos ORDER BY nacionalidade; # Consulta os alunos com os campos nacionalidade e nome,
															   # ordenando por nacionalidade de A a Z.

SELECT * FROM alunos ORDER BY nascimento; # Consulta todos os alunos ordenando por data de nascimento da mais antiga pra mais recente.
SELECT * FROM alunos ORDER BY nascimento DESC; # Consulta todos os alunos por data de nascimento da mais recente pra mais antiga.

SELECT nome, nascimento FROM alunos ORDER BY nascimento DESC; # Consulta todos os alunos com os campos nome e nascimento ordenando
															  # da data de nascimento mais recente pra mais antiga.
                                                             
SELECT nome, nascimento FROM alunos WHERE sexo='F' ORDER BY nascimento; # Consulta todos as alunos com os campos nome e nascimento
																		# cujo sexo for feminino, ordenando da data de nascimento 
																		# mais antiga pra mais recente.

SELECT nome, carga, ano FROM cursos; # Consulta todos os cursos mas apenas com os campos nome, carga e ano.
SELECT ano, carga, nome FROM cursos; # Consulta  todos os campos nome, carga e ano mas com outra posição no RESULT SET.

SELECT nome, ano carga FROM cursos WHERE ano <=2016 ORDER BY ano DESC, nome; # Consulta todos os cursos com os campos nome, ano e carga 
																			 # onde o ano de lançamento é inferior ou igual a 2016, 
                                                                             # ordenando do ano mais recente pro mais antigo, sendo que
                                                                             # os cursos lançados no mesmo ano serão ordenados de A a Z.
                                                                             
SELECT nome, ano carga FROM cursos WHERE ano!= 2016 AND ano <> 2015 ORDER BY ano DESC; # <> = !=


SELECT nome, ano, carga FROM cursos WHERE ano BETWEEN 2010 AND 2020 ORDER BY nome; # Consulta todos os cursos com os campos nome, ano e carga 
																				   # que tiverem sido lançados entre 2010 e 2020, ordenando os
                                                                                   # cursos de A a Z.
                                                                                   
SELECT nome, descricao, ano FROM cursos WHERE ano IN(2013,2014,2015,2016); # Consulta todos os cursos com os campos nome, descrição e ano
																		   # que foram lançados em 2013,2014,2015 ou 2016.
                                                                           # OBS: O IN(v1,v2,v3,...) é usado quando valores especificos devem
                                                                           # ser avaliados na condição WHERE.


SELECT nome, ano, carga FROM cursos ORDER BY ano; # Consulta todos os cursos com os campos nome, ano e carga 
												  # ordenando por ano crescente (do mais antigo/menor pro mais recente/maior).
                                                  
SELECT nome, ano, carga FROM cursos ORDER BY ano DESC; # Consulta todos os cursos com os campos nome, ano e carga
													   # ordenando por ano decrescente (do mais recente/maior pro mais antigo/menor).

SELECT nome, ano carga FROM cursos ORDER BY ano, nome; # Consulta todos os cursos com os campos nome, ano, carga
													   # ordenando por ano crescente, onde os cursos com mesmo ano
                                                       # estão em ordem alfabetica crescente
                                                       
SELECT nome, ano carga FROM cursos ORDER BY ano DESC, nome ASC; # Consulta todos os cursos com os campos nome, ano, carga
																# ordenando por ano decrescente, os cursos com mesmo ano
																# estão em ordem alfabetica crescente
                                                                
															