INSERT INTO cursos VALUES
(1,'HTML4','Curso de HTML5',40 ,37,'2014'),
(2,'Algoritmos','Lógica de programação',20,150,'2014'),
(3,'Photoshop','Dicas de Photoshop CC',10,8,'2014'),
(4,'PGP','Curso de PHP para iniciantes',40,20,'2014'),
(5,'Jarva','Introdução à linguagem Java',10,29,'2000'),
(6,'MySQL','Banco de dados MySQL',30,15,'2016'),
(7,'Word','Curso completo de Word',40,30,'2016'),
(8,'Sapateado','Danças Rítmicas',40,30,'2018'),
(9,'Cozinha Árabe','Aprenda a fazer Kibe',40,30,'2018'),
(10,'Youtuber','Gerar polêmica e ganahar inscritos',5,2,'2014');

SELECT * FROM cursos; 
SELECT * FROM cursos LIMIT 2; # Retorna apenas os 2 primeiros registros 
TRUNCATE TABLE cursos; # Apaga todos os registros

# Atualizando uma linha por vez
UPDATE cursos SET nome='HTML5' WHERE idcurso=1;
UPDATE cursos SET nome="PHP", ano="2015" WHERE idcurso=4;  # LIMIT <numero> limita o numero de linhas atualizadas, removidas ou consultadas.
UPDATE cursos SET nome='JAVA',ano='2015'WHERE idcurso=5;

#Atualizando mais de uma linha por vez
UPDATE cursos SET ano='2050',carga=800 WHERE ano='2014'; # O workbench por padrão restringe atualizações ou remoções em apenas uma linha por vez. 
														# Para desativar essa restrição, basta ir em Edit > Preferences > SQLEditor
														# e desmarcar a opção Safe Updates.
														# OBS: É necessário reconectar com o banco na opção "Reconnect to DBMS" (ícone abaixo da opção Tools).
UPDATE cursos SET ano=2014,carga=0 WHERE ano=2050;
UPDATE cursos SET ano=2050 WHERE idcurso IN(8,9,10); # Atualiza os registros onde o idcurso for 8,9 ou 10.

# Removendo um registro por vez
DELETE FROM cursos WHERE idcurso=8;

# Removendo varios registros por vez. OBS: É necessário desmarcar a opção Safe Update para remover vários registros.
DELETE FROM cursos WHERE ano=2050; # Remove todos os cursos com o ano 2050
DELETE FROM cursos WHERE ano=2050 LIMIT 2; # Remove 2 dos registros onde o ano é 2050  
