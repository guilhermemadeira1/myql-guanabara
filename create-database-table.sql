#cria novo database cadastro
create database cadastro;

#cria novo database cadastro (create database cadastro) 
#com colunas de texto com compatibilidade a caracteres utf8 (default character set utf8)
#ignorando diferença entre maiúsculas e minúsculas (default collate utf8_general_ci)

create database cadastro default character set utf8 default collate utf8_general_ci;

#remove database cadastro
drop database cadastro;

#seleciona o database cadastro para executar sql nele
use cadastro; 

#cria tabela pessoas junto com suas colunas (dados)
create table pessoas( 
nome varchar(30) ,
	`idade` tinyint, # nomes de colunas podem ser escritas opcionalmente entre crases 
	sexo char(1),
	peso float,
	altura float,
	nacionalidade varchar(20)
)default charset=utf8; # define compatibilidade para caracteres utf8 na tabela (será redundante se o database já suportar padrão utf8)

# melhorando a tabela pessoas
create table pessoas(
	id tinyint auto_increment, # cria um valor identificador de registro (linha) na tabela com valor inteiro auto incrementado
	nome varchar(30) not null, # constraint(restrição) not null define que a coluna não pode ficar vazia (caso contrário, será null por padrão)
    nascimento date not null,
    sexo enum('M', 'F') not null, # enum('M','F') restringe os valores possíveis 'M' e 'F'
    peso decimal(5,2) not null, # decimal(5,2) define um numero decimal de até 5 dígitos no total 
								# com 2 sendo suas casas decimais (xxx,xx)
    altura decimal(3,2) not null,
    nacionalidade varchar(20) default 'BRASIL', # default define um valor padrão gerado automaticamente na coluna(pode ser atualizado)
	primary key(id) # define a coluna identificadora como chave primária da tabela (útil para evitar duplicação de registros)
    
)default charset=utf8;

show databases; # exibe os databases do servidor

describe pessoas; # exibe os detalhes da tabela (colunas, tipos, restrições, etc)
