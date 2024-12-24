# >>> ALTER TABLE (Alterar a tabela)
                             
# >>> ADD COLUMN (Adiciona coluna)        OBS: O "COLUMN" após as cláusulas ADD, DROP, MODIFY e CHANGE são opcionais. 
ALTER TABLE pessoas 
	ADD COLUMN profissao varchar(10); # Adciona a coluna profissao na tabela pessoas
    
ALTER TABLE pessoas ADD profissao varchar(10); # Outra sintaxe do comando para adcionar coluna (sem o COLUMN)

ALTER TABLE pessoas
	ADD COLUMN profissao varchar(10)
		AFTER nome;                  # Adiciona a coluna profissao de nome 
									 # OBS: não existe comando pra adcionar coluna antes de outra.
ALTER TABLE pessoas
	ADD COLUMN profissao varchar(10) 
		FIRST;                       # Adiciona a coluna profissao na primeira posição da tabela pessoas                                                                                              	

# >>> DROP COLUMN (Remove coluna)
ALTER TABLE pessoas
	DROP COLUMN profissao; 			# Remove a coluna profissao da tabela pessoas.
    
# MODIFY COLUMN (Modifica coluna)
ALTER TABLE pessoas 
	MODIFY COLUMN profissao varchar(20);  # Modifica o tipo da coluna (acionando mais espaço para texto).
										  # O modify permite alterar o tipo e estrição da coluna, mas 
										  # obriga a redefir todas as restrições e tipos de novo.
ALTER TABLE pessoas
	MODIFY COLUMN profissao varchar(20) NOT NULL DEFAULT ''; # Modifica a coluna profissao adcionando restrição NOT NULL
															 # OBS: Se a coluna já foi criada e todos os campos estão vazios, 
                                                             # haverá conflito ao definir que a coluna como não nula.
                                                             # Uma solução é adcionar valor padrão, como string vazia ou 0.
															 # (nesse caso, o mysql preenche automaticamente um valor padrão).

ALTER TABLE pessoas 
	ADD COLUMN idade int NOT NULL, 
		ADD COLUMN saldo decimal(12,2) NOT NULL;

ALTER TABLE pessoas MODIFY COLUMN idade smallint NOT NULL;       # redefinindo as restrições e o tipo da coluna.
ALTER TABLE pessoas MODIFY saldo decimal(10,2) NOT NULL;  
																 # OBS: Para preservar restrições antigas, é necessário
																 # defini-las novamente pois o modify "redefine tudo"(restrições e tipos).
# >>> CHANGE COLUMN (Modifica e/ou renomea uma COLUNA)

ALTER TABLE pessoas 
	CHANGE COLUMN nascimento nasc DATE NOT NULL;  # Muda o nome da coluna e redefine as restrições e tipos
												  # OBS: O CHANGE COLUMN obriga a redefinir tipos e restrições
                                                  # assim como o MODIFY COLUMN, mas permite renomear colunas.
# RENAME TO (Apenas renomea a TABELA)
ALTER TABLE pessoas RENAME TO usuarios;
ALTER TABLE usuarios RENAME TO alunos;

use cadastro;
desc pessoas; # "desc" é mesmo que "describe" e descreve uma TABELA

SELECT * FROM pessoas;