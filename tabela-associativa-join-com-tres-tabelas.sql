use cadastro;

select * from alunos;
select * from cursos;
select * from rel_aluno_curso;
describe rel_aluno_curso;

# Em um relacionamento de N pra N, cria-se uma tabela para o relacionamento entre as entidades.
# Abaixo, criei uma tabela para o relacionamento de aluno e curso, onde um aluno pode se matricular][
# em até vários cursos e um curso pode estar vinculado a até vários alunos.

# tabela associativa de aluno e curso
CREATE TABLE IF NOT EXISTS cadastro.rel_aluno_curso ( 
	id_aluno_curso int auto_increment primary key,
    aluno int unsigned NOT NULL,
    curso int unsigned NOT NULL,
    data_inicio date NOT NULL,
    data_conclusao date NULL, 
    foreign key(aluno) references cadastro.alunos(id_aluno),
    foreign key(curso) references cadastro.cursos(id_curso)
)default charset = utf8 engine = InnoDB;

alter table rel_aluno_curso change column aluno id_aluno int unsigned not null;
alter table rel_aluno_curso change column curso id_curso int unsigned not null;
 
insert into rel_aluno_curso value(default, '1', '6', '2019-02-11');
insert into rel_aluno_curso value(default, '1', '3', null);
insert into rel_aluno_curso value(default, '2', '3', '2021-02-11');
insert into rel_aluno_curso value(default, '3', '5', null);
insert into rel_aluno_curso value(default, '3', '11', '2022-08-07');

# JOIN com duas tabelas
select a.nome, ac.id_curso from alunos a             # consulta o nome dos alunos junto com o id dos cursos 
join rel_aluno_curso ac on ac.id_aluno = a.id_aluno; # que estão matriculados (juntando com a tabela curso).

# JOIN com 3 tabelas
select a.nome aluno, c.nome curso, ac.data_conclusao                     # consulta o nome do aluno, o nome dos cursos em que está matriculado
from alunos a inner join rel_aluno_curso ac on ac.id_aluno = a.id_aluno  # e a data em que ele concluiu os cursos.
inner join cursos c on c.id_curso = ac.id_curso;                         # OBS: Usando dois Joins, um pra unir alunos a rel_aluno_curso e outro
																		 # para unir rel_aluno_curso a curso, permitindo consulta com 3 tabelas.