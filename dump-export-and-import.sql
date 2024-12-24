DROP DATABASE cadastro;

# DUMP é um backup de recuperção de dados para um database, incluindo: tabelas, registros, colunas, views, triggers, indexes, etc.
# Comumente se cria um dump para cada database criado.

# Criar e Exportar um DUMP no workbench:
 
# Server > Data Export > Selecionar database e tabelas > 
# Selcionar Exportar Eventos, Triggers e ou Stored Procedures and Functions [opcional] > 
# Selecionar Exportar como Dump Project Folder ou como Self Conteined File (Arquivo único) [selecionar um - Preferência arquivo unico] >
# Selcionar Criar Dump com transção única e/ou Incluir Create Schema(database) [selecionar um ou ambos] >
# Start Export > Inserir senha de usuário para acesso ao Servidor

# Importar DUMP workbench:

# Server > Data Import > Selecionar Dump no explorador de arquivos ou copiar Url do arquivo > 
# Start Import > Inserir senha de usuário para acesso ao Servidor

USE cadastro;
SELECT * FROM alunos;
SELECT * FROM cursos;