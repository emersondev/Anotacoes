/* Modelagem Básica - 
ENTIDADE = TABELA
CAMPOS = ATRIBUTOS */

/* APRESENTA A BASE DE DADOS EXISTENTE */
SHOW DATABASES;

/* MOSTRA A ONDE ESTÁ */
STATUS

CLIENTE

NOME = CARACTER(30)
CPF = NUMERICO(11)
EMAIL = CARACTER(30)
TELEFONE = CARACTER(30)
ENDERECO = CARACTER(100)
SEXO = CARACTER(1)

/* Processsos de Modelagem */

/* FASE 01 E FASE 02 - AD ADM DE DADOS */
MODELAGEM CONCEITUAL = RASCUNHO
MODELAGEM LÓGICA = QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 - DBA / AD */
MODELAGEM FÍSICA = SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO O BANCO DE DADOS */

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);

/* VERIFICANDO AS TABELAS DO BANCO */
SHOW TABLES;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */
DESC CLIENTE;

/* Sintaxe basica de inserção - INSERT INTO TABELA...*/


/* FORMA 01 - OMITINDO AS COLUNAS ----> Tenho que colocar os campos na exata ordem da tabela */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS - posso colocar na ordem que eu quiser e seguir a mesma ordem na inserção do values*/
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
/* Out Of Range, por isso deve se colocar CPF como varchar*/
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);


/*
 O COMANDO SELECT
seleção, projeção e junção
SELECT é pra projetar
*/

/* Mostra data e a hora atual */
SELECT NOW(); 

SELECT 'EMERSON NOVAIS' AS ALUNO;
SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS ------------> o AS projeta a coluna NOME em CLIENTE */

/* Ele projeta (muda) o "NOME" para "CLIENTES" */
SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

/* Projetando a tabela na ordem que eu quiser */
SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;
SELECT EMAIL, ENDERECO, NOME, SEXO FROM CLIENTE;

/* Quero saber a hora que foi feita a query */
SELECT EMAIL, ENDERECO, NOME, SEXO, NOW() AS DATA_HORA FROM CLIENTE;

/* USE SOMENTE PARA FINS ACADÊMICOS */
SELECT * FROM CLIENTE;

/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, TELEFONE FROM CLIENTE;

/* FILTRANDO */
/**
* para projeção usamos o SELECT
* para seleção usamos o WHERE
* Ao filtrar pelo SEXO não necessariamente retorna o SEXO, a menos que esteja explícito na projeção (SELECT)
*/

/* Procura Nome e Sexo da tabela Clientes ONDE Sexo é igual a M */
SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

/* Procura Nome e Sexo da tabela Clientes ONDE Sexo é igual a F */
SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'F';

/* Da falha pois procura exatamente RJ */
SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';

/* UTILIZANDO O LIKE ---> sempre vem no lugar do = (igual) */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QUALQUER COISA, ex: %RJ -> qualquer coisa antes que termine com RJ */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

/*
SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%______CENTRO______%';
seria um exemplo de comando de pesquisa que tem 
6 underscore(alguma coisa) antes a palava CENTRO 6 underscore depois
*/


/* Exercício da aula 26 */


CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS(
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
);

INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78.99,'RJ',2018);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150.98,'RJ',2019);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('Pra sempre amigas','Leda Silva','F',510,'Insignia',78.98,'ES',2011);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130.98,'RS',2018);
INSERT INTO LIVROS(LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO) VALUES
('O poder da mente','Clara Mafra','F',120,'Continental',56.58,'SP',2017);

/* 1 – Trazer todos os dados */
SELECT * FROM LIVROS;
SELECT LIVRO,AUTOR,SEXO,PAGINAS,EDITORA,VALOR,UF,ANO FROM LIVROS;

/* 2 – Trazer o nome do livro e o nome da editora */
SELECT LIVRO, EDITORA
FROM LIVROS;

/* 3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino. */
SELECT LIVRO, UF
FROM LIVROS
WHERE SEXO = 'M';

/* 4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino. */
SELECT LIVRO AS NOME_DO_LIVRO, PAGINAS
FROM LIVROS
WHERE SEXO = 'F';

/* 5 – Trazer os valores dos livros das editoras de São Paulo. */
SELECT LIVRO, VALOR
FROM LIVROS
WHERE UF = 'SP';

/* 6 – Trazer os dados dos autores do sexo masculino que 
tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio). */
SELECT LIVRO, AUTOR, SEXO, PAGINAS, EDITORA, VALOR, UF, ANO 
FROM LIVROS 
WHERE SEXO = 'M' 
AND (UF = 'SP' OR UF = 'RJ');

/* OPERADORES LÓGICOS
OR -> PARA QUE A SAÍDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDIÇÃO SEJA VERDADEIRA
AND -> PARA QUE A SAÍDA SEJA VERDADEIRA, TODAS AS CONDIÇÕES DEVEM SER VERDADEIRAS
*/

USE PROJETO;

SELECT * FROM CLIENTE;

/* OR - OU */
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

/* AND - E */
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES LÓGICOS */

SELECT COUNT(*) AS "Quantidade de registros da tabela Cliente" FROM CLIENTE; 

/* Nesse caso o banco da conflito pois ele pega o primeiro valor de SEXO
 e retorna a quantidade total de todos os sexos */
SELECT SEXO, COUNT(*)
FROM CLIENTE;

/* OPERADOR GROUP BY */

/* aqui ele faz a contagem e usa o group by para agrupar o valor com o sexo */
SELECT SEXO, COUNT(*)
FROM CLIENTE
GROUP BY SEXO;
/* No retorno ele mostra os sexos que tem e quanto de contador tem em cada um deles */

/* 1 MILHAO DE REGISTROS

PARA CONTAR
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

CONDICAO
SEXO = F
CIDADE = RIO DE JANEIRO

SITUACAO - TRATANDO COM OU / OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = 'F'
OR CIDADE = 'RIO DE JANEIRO';

SITUACAO - TRATANDO COM E / AND
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F';
*/ 


/* exercicio */

/* Considerando o que vc aprendeu sobre performance, resolva os exercicios abaixo */

-- Nº de funcionários na tabela

SELECT COUNT(*) AS NUMERO_FUNCIONARIOS FROM FUNCIONARIOS;

-- EXERCÍCIO UM: Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

/* 1º passo, pensando na performance, nesse comando ele vai contar quantos funcionarios
 tem cada departamento, agrupar o resultado por dpto
 e o order by vai colocar em ordem crescente pra saber o maior pro menor*/
 
SELECT COUNT(*) AS NUMERO_FUNCIONARIOS, DEPARTAMENTO
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 1;

 -- funcionários: 21 em Filmes e 53 em Roupas
 
 /* 2º Passo montagem da query, lógica, como sabemos que vamos procurar do  departamento de filmes ou do departamento de roupas , colocamos na primeira condição o que tem mais de ser verdadeiro, pois otmizamos o banco a não chegar a segunda condição, dado que a primeira foi realizada */

SELECT * FROM FUNCIONARIOS
WHERE DEPARTAMENTO = "Roupas" 
OR DEPARTAMENTO = "Filmes";

-- EXERCÍCIO DOIS: O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras desses dois setores.

/* 1º passo verifico a quantidade pessoas por sexos */

SELECT SEXO, COUNT(*) AS NUMERO_FUNCIONARIOS
FROM FUNCIONARIOS
GROUP BY SEXO;

-- 484 | Masculino, 491 | Feminino

/* 2º passo verifico quais departamentos tem mais ou menos mulheres trabalhando */

SELECT COUNT(*) AS NUMERO_FUNCIONARIOS, DEPARTAMENTO
FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO
ORDER BY 1;

-- 21 | Filmes, 52 | Lar

/* 3º passo, na montagem da query dou preferência pra ocorrência que tem menos chance de dar certo
pois como estamos trabalhando com o AND, bastou uma dar errado, não haverá a segunda consulta */

SELECT * FROM FUNCIONARIOS
WHERE
(DEPARTAMENTO = "Lar" AND SEXO = "Feminino")
OR
(DEPARTAMENTO = "Filmes" AND SEXO = "Feminino");

-- Minha resolução

SELECT NOME, SEXO, DEPARTAMENTO, EMAIL
FROM FUNCIONARIOS
WHERE (DEPARTAMENTO = "Lar" OR DEPARTAMENTO = "Filmes")
AND SEXO = "Feminino";



-- EXERCÍCIO 3: Traga os funcionarios do sexo masculino ou os funcionarios que trabalhem no setor Jardim

/* 1º passo verifico a quantidade pessoas por sexos */

SELECT COUNT(*) AS NUMERO_FUNCIONARIOS, SEXO
FROM FUNCIONARIOS
GROUP BY SEXO;

-- 484 | Masculino, 491 | Feminino

/* 2º passo, pensando na performance, nesse comando ele vai contar quantos funcionarios tem cada departamento, agrupar o resultado por dpto
 e o order by vai colocar em ordem crescente pra saber o maior pro menor*/
 
 SELECT COUNT(*) AS NUMERO_FUNCIONARIOS, DEPARTAMENTO
 FROM FUNCIONARIOS
 GROUP BY DEPARTAMENTO
 ORDER BY 1;

-- setor Jardim 47

/* 3º Passo, montagem da query */

SELECT NOME AS NOME_FUNCIONARIO, SEXO, DEPARTAMENTO
FROM FUNCIONARIOS
WHERE (SEXO = "Masculino"
OR
DEPARTAMENTO = "Jardins");


-- OU

SELECT * FROM FUNCIONARIOS
WHERE (SEXO = "Masculino"
OR
DEPARTAMENTO = "Jardins");

/* SCRIPT DB */
CREATE DATABASE EXERCICIO;

USE EXERCICIO;

CREATE TABLE FUNCIONARIOS
  (
      IDFUNCIONARIO INTEGER,
      NOME VARCHAR(100),
      EMAIL VARCHAR(200),
      SEXO VARCHAR(10),
      DEPARTAMENTO VARCHAR(100),
      ADMISSAO VARCHAR(10),
      SALARIO INTEGER,
      CARGO VARCHAR(100),
      IDREGIAO INT
  );

INSERT INTO FUNCIONARIOS VALUES (1,'Kelley','rkelley0@soundcloud.com','Feminino','Computadores','10/2/2009',67470,'Structural Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (2,'Armstrong','sarmstrong1@infoseek.co.jp','Masculino','Esporte','3/31/2008',71869,'Financial Advisor',2);
INSERT INTO FUNCIONARIOS VALUES (3,'Carr','fcarr2@woothemes.com','Masculino','Automotivo','7/12/2009',101768,'Recruiting Manager',3);
INSERT INTO FUNCIONARIOS VALUES (4,'Murray','jmurray3@gov.uk','Feminino','Joalheria','12/25/2014',96897,'Desktop Support Technician',3);
INSERT INTO FUNCIONARIOS VALUES (5,'Ellis','jellis4@sciencedirect.com','Feminino','Alimentícios','9/19/2002',63702,'Software Engineer III',7);
INSERT INTO FUNCIONARIOS VALUES (6,'Phillips','bphillips5@time.com','Masculino','Ferramentas','8/21/2013',118497,'Executive Secretary',1);
INSERT INTO FUNCIONARIOS VALUES (7,'Williamson','rwilliamson6@ted.com','Masculino','Computadores','5/14/2006',65889,'Dental Hygienist',6);
INSERT INTO FUNCIONARIOS VALUES (8,'Harris','aharris7@ucoz.com','Feminino','Brinquedos','8/12/2003',84427,'Safety Technician I',4);
INSERT INTO FUNCIONARIOS VALUES (9,'James','rjames8@prnewswire.com','Masculino','Joalheria','9/7/2005',108657,'Sales Associate',2);

INSERT INTO FUNCIONARIOS VALUES (11,'Jacobs','jjacobsa@sbwire.com','Feminino','Joalheria','11/27/2003',121966,'Community Outreach Specialist',7);
INSERT INTO FUNCIONARIOS VALUES (12,'Black','mblackb@edublogs.org','Masculino','Roupas','2/4/2003',44179,'Data Coordiator',7);
INSERT INTO FUNCIONARIOS VALUES (13,'Schmidt','sschmidtc@state.gov','Masculino','Bebês','10/13/2002',85227,'Compensation Analyst',3);
INSERT INTO FUNCIONARIOS VALUES (14,'Webb','awebbd@baidu.com','Feminino','Computadores','10/22/2006',59763,'Software Test Engineer III',4);
INSERT INTO FUNCIONARIOS VALUES (15,'Jacobs','ajacobse@google.it','Feminino','Games','3/4/2007',141139,'Community Outreach Specialist',7);
INSERT INTO FUNCIONARIOS VALUES (16,'Medina','smedinaf@amazonaws.com','Feminino','Bebês','3/14/2008',106659,'Web Developer III',1);
INSERT INTO FUNCIONARIOS VALUES (17,'Morgan','dmorgang@123-reg.co.uk','Feminino','Crianças','5/4/2011',148952,'Programmer IV',6);
INSERT INTO FUNCIONARIOS VALUES (18,'Nguyen','jnguyenh@google.com','Masculino','Lar','11/3/2014',93804,'Geologist II',5);
INSERT INTO FUNCIONARIOS VALUES (19,'Day','rdayi@chronoengine.com','Masculino','Eletronicos','9/22/2004',109890,'VP Sales',3);

INSERT INTO FUNCIONARIOS VALUES (21,'Bryant','sbryantk@wunderground.com','Feminino','Industrial','8/12/2005',78052,'Software Consultant',3);
INSERT INTO FUNCIONARIOS VALUES (22,'Alexander','kalexanderl@marketwatch.com','Masculino','Automotivo','12/26/2011',144724,'Marketing Assistant',2);
INSERT INTO FUNCIONARIOS VALUES (23,'Chapman','jchapmanm@archive.org','Feminino','Joalheria','4/12/2001',126103,'Senior Developer',4);
INSERT INTO FUNCIONARIOS VALUES (24,'Kelly','ekellyn@weibo.com','Masculino','Jardim','6/29/2006',144965,'Nurse Practicioner',2);
INSERT INTO FUNCIONARIOS VALUES (25,'Stephens','jstephenso@ow.ly','Masculino','Brinquedos','6/4/2004',70613,'Business Systems Development Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (26,'Porter','vporterp@yelp.com','Feminino','Lar','5/30/2011',90746,'Dental Hygienist',2);
INSERT INTO FUNCIONARIOS VALUES (27,'Owens','cowensq@shareasale.com','Feminino','Lar','5/26/2005',78698,'Executive Secretary',2);
INSERT INTO FUNCIONARIOS VALUES (28,'Scott','cscottr@sphinn.com','Feminino','Books','3/2/2008',63336,'Sales Representative',4);
INSERT INTO FUNCIONARIOS VALUES (29,'Price','cprices@Brasil.gov','Feminino','Roupas','7/5/2013',95436,'Quality Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (30,'Weaver','dweavert@shinystat.com','Masculino','Beleza','2/17/2012',83144,'Account Representative III',2);
INSERT INTO FUNCIONARIOS VALUES (31,'Willis','hwillisu@army.mil','Feminino','Ferramentas','10/21/2012',113507,'Accountant I',7);
INSERT INTO FUNCIONARIOS VALUES (32,'Torres','ltorresv@amazon.de','Masculino','Games','4/7/2014',78245,'Nuclear Power Engineer',6);

INSERT INTO FUNCIONARIOS VALUES (35,'Smith','bsmithy@statcounter.com','Feminino','Books','6/13/2013',94884,'Librarian',7);
INSERT INTO FUNCIONARIOS VALUES (36,'Bradley','nbradleyz@goodreads.com','Masculino','Outdoors','12/28/2008',107222,'Payment Adjustment Coordinator',3);
INSERT INTO FUNCIONARIOS VALUES (37,'Cruz','rcruz10@blinklist.com','Feminino','Lar','5/20/2000',61739,'Quality Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (38,'Williamson','dwilliamson11@rediff.com','Feminino','Jardim','1/25/2012',82026,'Nurse',2);
INSERT INTO FUNCIONARIOS VALUES (39,'Kennedy','skennedy12@rediff.com','Masculino','Bebês','7/2/2011',79339,'Civil Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (40,'Hawkins','phawkins13@twitpic.com','Feminino','Roupas','8/20/2011',76809,'Quality Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (41,'Allen','jallen14@ustream.tv','Feminino','Bebês','5/10/2001',89680,'Web Developer III',6);
INSERT INTO FUNCIONARIOS VALUES (42,'Watkins','mwatkins15@wiley.com','Masculino','Computadores','4/1/2008',125668,'Executive Secretary',7);
INSERT INTO FUNCIONARIOS VALUES (43,'Ferguson','mferguson16@qq.com','Masculino','Esporte','5/29/2009',82960,'Account Representative III',6);

INSERT INTO FUNCIONARIOS VALUES (45,'Nguyen','mnguyen18@biblegateway.com','Masculino','Automotivo','1/24/2002',108378,'Electrical Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (46,'Lawrence','jlawrence19@linkedin.com','Masculino','Outdoors','12/11/2011',133424,'Junior Executive',7);
INSERT INTO FUNCIONARIOS VALUES (47,'Oliver','joliver1a@cnbc.com','Feminino','Roupas','8/30/2013',42797,'Software Engineer III',5);
INSERT INTO FUNCIONARIOS VALUES (48,'Johnson','jjohnson1b@usgs.gov','Masculino','Computadores','4/26/2004',134940,'Financial Advisor',4);
INSERT INTO FUNCIONARIOS VALUES (49,'Crawford','hcrawford1c@dell.com','Masculino','Lar','12/21/2008',119471,'Editor',6);
INSERT INTO FUNCIONARIOS VALUES (50,'Armstrong','parmstrong1d@hc360.com','Feminino','Automotivo','3/16/2010',89969,'Senior Editor',4);
INSERT INTO FUNCIONARIOS VALUES (51,'Dixon','jdixon1e@dot.gov','Masculino','Bebês','9/26/2006',106281,'Senior Developer',3);
INSERT INTO FUNCIONARIOS VALUES (52,'Snyder','ssnyder1f@ca.gov','Feminino','Crianças','9/26/2002',141678,'Design Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (53,'Coleman','dcoleman1g@dedecms.com','Masculino','Computadores','6/14/2008',110839,'Automation Specialist I',1);
INSERT INTO FUNCIONARIOS VALUES (54,'Reed','sreed1h@intel.com','Feminino','Brinquedos','4/15/2001',84275,'VP Marketing',5);
INSERT INTO FUNCIONARIOS VALUES (55,'Ross','jross1i@infoseek.co.jp','Masculino','Automotivo','4/21/2004',71363,'Environmental Tech',3);
INSERT INTO FUNCIONARIOS VALUES (56,'Watkins','kwatkins1j@youtu.be','Masculino','Jardim','12/2/2002',93680,'VP Accounting',3);
INSERT INTO FUNCIONARIOS VALUES (57,'Allen','jallen1k@google.cn','Feminino','Outdoors','11/20/2000',73755,'Geologist II',3);
INSERT INTO FUNCIONARIOS VALUES (58,'Baker','jbaker1l@usnews.com','Masculino','Games','3/2/2007',68857,'Information Systems Manager',2);
INSERT INTO FUNCIONARIOS VALUES (59,'Garcia','vgarcia1m@deviantart.com','Feminino','Saúde','3/19/2002',48360,'Registered Nurse',6);
INSERT INTO FUNCIONARIOS VALUES (60,'Lane','elane1n@un.org','Masculino','Outdoors','7/15/2004',104896,'Financial Advisor',5);
INSERT INTO FUNCIONARIOS VALUES (61,'Watson','cwatson1o@paypal.com','Feminino','Ferramentas','8/10/2009',81870,'Occupational Therapist',7);
INSERT INTO FUNCIONARIOS VALUES (62,'Boyd','aboyd1p@artisteer.com','Masculino','Automotivo','5/29/2007',69936,'Senior Editor',7);
INSERT INTO FUNCIONARIOS VALUES (63,'Young','hyoung1q@cisco.com','Feminino','Alimentícios','12/11/2007',138844,'Mechanical Systems Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (64,'Cooper','tcooper1r@umich.edu','Masculino','Jardim','11/12/2011',139796,'Office Assistant IV',1);
INSERT INTO FUNCIONARIOS VALUES (65,'Jordan','jjordan1s@about.me','Feminino','Automotivo','1/27/2000',86939,'Tax Accountant',3);
INSERT INTO FUNCIONARIOS VALUES (66,'Rodriguez','lrodriguez1t@narod.ru','Masculino','Beleza','9/27/2003',141949,'Product Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (67,'Mills','jmills1u@printfriendly.com','Feminino','Alimentícios','8/8/2004',114200,'Senior Sales Associate',7);
INSERT INTO FUNCIONARIOS VALUES (68,'Coleman','kcoleman1v@360.cn','Masculino','Beleza','9/2/2012',121378,'Web Developer I',7);
INSERT INTO FUNCIONARIOS VALUES (69,'Stewart','dstewart1w@usnews.com','Masculino','Brinquedos','8/22/2000',148144,'Data Coordiator',4);
INSERT INTO FUNCIONARIOS VALUES (70,'Jordan','ajordan1x@moonfruit.com','Feminino','Games','11/13/2004',93839,'Database Administrator III',2);
INSERT INTO FUNCIONARIOS VALUES (71,'Vasquez','evasquez1y@behance.net','Masculino','Bebês','10/20/2002',77285,'Operator',6);
INSERT INTO FUNCIONARIOS VALUES (72,'Knight','tknight1z@weibo.com','Feminino','Música','10/13/2002',135688,'Statistician I',4);
INSERT INTO FUNCIONARIOS VALUES (73,'Palmer','ipalmer20@newsvine.com','Masculino','Esporte','4/3/2002',78828,'Director of Sales',2);
INSERT INTO FUNCIONARIOS VALUES (74,'Washington','jwashington21@squidoo.com','Feminino','Lar','7/11/2000',47206,'Programmer III',3);
INSERT INTO FUNCIONARIOS VALUES (75,'Sanchez','dsanchez22@blog.com','Feminino','Outdoors','10/6/2013',78157,'Senior Financial Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (76,'Grant','egrant23@prlog.org','Feminino','Eletronicos','7/23/2000',49296,'Software Test Engineer II',6);
INSERT INTO FUNCIONARIOS VALUES (77,'Daniels','ndaniels24@google.ca','Masculino','Ferramentas','2/7/2013',139061,'Environmental Specialist',3);
INSERT INTO FUNCIONARIOS VALUES (78,'Medina','jmedina25@dot.gov','Feminino','Games','9/16/2005',114989,'Marketing Assistant',3);
INSERT INTO FUNCIONARIOS VALUES (79,'Cunningham','acunningham26@simplemachines.org','Masculino','Roupas','9/15/2002',88345,'Junior Executive',6);
INSERT INTO FUNCIONARIOS VALUES (80,'Little','klittle27@un.org','Masculino','Música','9/12/2001',114647,'Editor',5);
INSERT INTO FUNCIONARIOS VALUES (81,'Welch','jwelch28@1und1.de','Masculino','Outdoors','7/24/2004',118514,'Accounting Assistant III',5);
INSERT INTO FUNCIONARIOS VALUES (82,'Gilbert','hgilbert29@xrea.com','Feminino','Lar','5/11/2003',93712,'Junior Executive',7);
INSERT INTO FUNCIONARIOS VALUES (83,'George','ageorge2a@gmpg.org','Masculino','Industrial','5/2/2009',86373,'Compensation Analyst',7);
INSERT INTO FUNCIONARIOS VALUES (84,'Hughes','mhughes2b@youtube.com','Masculino','Crianças','1/28/2013',122110,'Structural Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (85,'Williams','jwilliams2c@businesswire.com','Feminino','Games','3/26/2006',95542,'Nurse',2);
INSERT INTO FUNCIONARIOS VALUES (86,'Martinez','wmartinez2d@barnesandnoble.com','Feminino','Outdoors','5/25/2013',131392,'Systems Administrator II',2);
INSERT INTO FUNCIONARIOS VALUES (87,'Hamilton','hhamilton2e@google.de','Masculino','Música','10/23/2010',98401,'VP Quality Control',1);
INSERT INTO FUNCIONARIOS VALUES (88,'Gomez','jgomez2f@mtv.com','Feminino','Ferramentas','9/19/2004',103806,'Accounting Assistant I',3);
INSERT INTO FUNCIONARIOS VALUES (89,'Webb','awebb2g@springer.com','Masculino','Saúde','4/10/2014',73686,'Tax Accountant',2);
INSERT INTO FUNCIONARIOS VALUES (90,'Thomas','tthomas2h@webnode.com','Masculino','Games','11/3/2011',55002,'Research Assistant IV',6);
INSERT INTO FUNCIONARIOS VALUES (91,'Wallace','swallace2i@state.tx.us','Masculino','Bebês','3/7/2005',65216,'Registered Nurse',4);
INSERT INTO FUNCIONARIOS VALUES (92,'Ortiz','aortiz2j@jigsy.com','Feminino','Automotivo','6/22/2010',113231,'Senior Editor',7);
INSERT INTO FUNCIONARIOS VALUES (93,'Knight','nknight2k@cafepress.com','Feminino','Eletronicos','4/3/2014',125847,'Chemical Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (94,'Hunt','thunt2l@twitpic.com','Feminino','Música','5/31/2000',140430,'Senior Cost Accountant',2);

INSERT INTO FUNCIONARIOS VALUES (96,'Mason','wmason2n@xrea.com','Masculino','Beleza','2/21/2004',96673,'Accounting Assistant I',1);
INSERT INTO FUNCIONARIOS VALUES (97,'Williams','wwilliams2o@berkeley.edu','Feminino','Games','3/14/2013',79267,'VP Quality Control',7);
INSERT INTO FUNCIONARIOS VALUES (98,'Freeman','lfreeman2p@tiny.cc','Feminino','Crianças','10/11/2007',109154,'Accountant I',4);
INSERT INTO FUNCIONARIOS VALUES (99,'Palmer','ipalmer2q@youku.com','Feminino','Books','4/24/2002',138815,'Physical Therapy Assistant',3);
INSERT INTO FUNCIONARIOS VALUES (100,'Bell','rbell2r@utexas.edu','Masculino','Esporte','8/3/2007',68210,'Registered Nurse',4);
INSERT INTO FUNCIONARIOS VALUES (101,'Rivera','jrivera2s@oakley.com','Masculino','Games','11/16/2002',137281,'VP Sales',3);
INSERT INTO FUNCIONARIOS VALUES (102,'Matthews','kmatthews2t@oaic.gov.au','Masculino','Saúde','8/9/2008',114970,'Statistician IV',2);
INSERT INTO FUNCIONARIOS VALUES (103,'Reed','dreed2u@arstechnica.com','Masculino','Automotivo','7/19/2003',126001,'Structural Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (104,'Adams','eadams2v@yandex.ru','Masculino','Alimentícios','9/16/2003',78736,'Financial Analyst',6);
INSERT INTO FUNCIONARIOS VALUES (105,'Young','syoung2w@cmu.edu','Masculino','Calçados','9/16/2009',80830,'Quality Control Specialist',4);
INSERT INTO FUNCIONARIOS VALUES (106,'Gardner','rgardner2x@theguardian.com','Masculino','Crianças','8/6/2009',47879,'Product Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (107,'Castillo','bcastillo2y@cornell.edu','Feminino','Computadores','3/31/2004',132634,'Civil Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (108,'Perkins','jperkins2z@prlog.org','Masculino','Roupas','7/14/2005',68344,'Senior Cost Accountant',7);
INSERT INTO FUNCIONARIOS VALUES (109,'Freeman','bfreeman30@fda.gov','Feminino','Roupas','10/14/2007',147868,'General Manager',6);
INSERT INTO FUNCIONARIOS VALUES (110,'Howell','whowell31@free.fr','Masculino','Books','4/15/2011',67255,'Geologist III',4);
INSERT INTO FUNCIONARIOS VALUES (111,'Austin','naustin32@discuz.net','Feminino','Computadores','6/13/2012',47494,'Help Desk Operator',6);

INSERT INTO FUNCIONARIOS VALUES (113,'Moore','kmoore34@shareasale.com','Masculino','Bebês','3/1/2000',54413,'Operator',5);
INSERT INTO FUNCIONARIOS VALUES (114,'Sims','msims35@i2i.jp','Masculino','Alimentícios','12/6/2012',136790,'Nuclear Power Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (115,'Nguyen','rnguyen36@bandcamp.com','Feminino','Roupas','6/30/2007',58420,'Graphic Designer',1);
INSERT INTO FUNCIONARIOS VALUES (116,'Wells','awells37@theatlantic.com','Masculino','Industrial','1/17/2002',73813,'Occupational Therapist',3);

INSERT INTO FUNCIONARIOS VALUES (118,'Fox','pfox39@discovery.com','Masculino','Automotivo','9/3/2009',87134,'Assistant Manager',3);
INSERT INTO FUNCIONARIOS VALUES (119,'Washington','wwashington3a@dot.gov','Feminino','Roupas','10/6/2008',148408,'Speech Pathologist',3);
INSERT INTO FUNCIONARIOS VALUES (120,'Evans','wevans3b@scientificamerican.com','Feminino','Brinquedos','1/23/2008',77335,'Chemical Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (121,'Elliott','belliott3c@jiathis.com','Feminino','Esporte','8/5/2007',131409,'Technical Writer',7);
INSERT INTO FUNCIONARIOS VALUES (122,'Wagner','jwagner3d@fotki.com','Masculino','Bebês','2/26/2001',77530,'Librarian',1);
INSERT INTO FUNCIONARIOS VALUES (123,'Griffin','agriffin3e@mtv.com','Feminino','Jardim','4/26/2002',101875,'Business Systems Development Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (124,'Chavez','mchavez3f@sohu.com','Feminino','Alimentícios','12/7/2005',144028,'Executive Secretary',6);

INSERT INTO FUNCIONARIOS VALUES (126,'Burton','bburton3h@360.cn','Masculino','Calçados','7/11/2013',79172,'Associate Professor',7);
INSERT INTO FUNCIONARIOS VALUES (127,'Harper','sharper3i@slideshare.net','Feminino','Outdoors','5/18/2000',144639,'VP Quality Control',7);
INSERT INTO FUNCIONARIOS VALUES (128,'Gibson','tgibson3j@ucoz.com','Masculino','Computadores','3/24/2003',109449,'Engineer II',7);
INSERT INTO FUNCIONARIOS VALUES (129,'Grant','lgrant3k@live.com','Feminino','Computadores','10/15/2006',108441,'Nurse',6);
INSERT INTO FUNCIONARIOS VALUES (130,'Nichols','bnichols3l@dropbox.com','Feminino','Games','7/3/2008',145692,'Recruiting Manager',5);
INSERT INTO FUNCIONARIOS VALUES (131,'Kelley','wkelley3m@domainmarket.com','Masculino','Calçados','2/24/2000',120377,'Research Nurse',4);
INSERT INTO FUNCIONARIOS VALUES (132,'Montgomery','rmontgomery3n@chicagotribune.com','Feminino','Lar','5/14/2003',63929,'Research Assistant IV',5);
INSERT INTO FUNCIONARIOS VALUES (133,'Martinez','dmartinez3o@deviantart.com','Masculino','Games','2/1/2001',124853,'Systems Administrator III',2);
INSERT INTO FUNCIONARIOS VALUES (134,'Harvey','jharvey3p@angelfire.com','Feminino','Outdoors','6/3/2010',99854,'VP Marketing',6);
INSERT INTO FUNCIONARIOS VALUES (135,'Hicks','ahicks3q@pcworld.com','Feminino','Crianças','8/11/2013',58675,'Technical Writer',3);
INSERT INTO FUNCIONARIOS VALUES (136,'Rose','lrose3r@slideshare.net','Feminino','Beleza','5/16/2007',50060,'Accountant IV',1);
INSERT INTO FUNCIONARIOS VALUES (137,'Simmons','jsimmons3s@imageshack.us','Feminino','Esporte','8/9/2014',72748,'Quality Control Specialist',3);
INSERT INTO FUNCIONARIOS VALUES (138,'Montgomery','wmontgomery3t@taobao.com','Masculino','Eletronicos','9/1/2005',71082,'Geologist III',7);
INSERT INTO FUNCIONARIOS VALUES (139,'Hart','rhart3u@wsj.com','Masculino','Joalheria','1/8/2012',119773,'Pharmacist',3);
INSERT INTO FUNCIONARIOS VALUES (140,'Wheeler','bwheeler3v@google.co.uk','Masculino','Computadores','1/22/2001',82358,'Information Systems Manager',4);
INSERT INTO FUNCIONARIOS VALUES (141,'Williamson','rwilliamson3w@amazon.co.jp','Masculino','Games','12/12/2005',145575,'VP Accounting',1);
INSERT INTO FUNCIONARIOS VALUES (142,'Burton','gburton3x@umich.edu','Masculino','Industrial','12/6/2009',105810,'Recruiter',5);
INSERT INTO FUNCIONARIOS VALUES (143,'Gutierrez','jgutierrez3y@tuttocitta.it','Masculino','Ferramentas','5/6/2014',58805,'Database Administrator I',1);
INSERT INTO FUNCIONARIOS VALUES (144,'Barnes','lbarnes3z@indiegogo.com','Feminino','Bebês','12/8/2008',112837,'Clinical Specialist',5);
INSERT INTO FUNCIONARIOS VALUES (145,'Day','lday40@upenn.edu','Feminino','Bebês','4/14/2013',125914,'Junior Executive',6);

INSERT INTO FUNCIONARIOS VALUES (147,'Hernandez','ahernandez42@pagesperso-orange.fr','Feminino','Música','10/6/2012',96169,'Civil Engineer',1);

INSERT INTO FUNCIONARIOS VALUES (149,'Meyer','jmeyer44@facebook.com','Feminino','Brinquedos','5/3/2008',76352,'Human Resources Assistant IV',4);
INSERT INTO FUNCIONARIOS VALUES (150,'Diaz','pdiaz45@who.int','Masculino','Saúde','10/15/2006',128748,'Web Developer III',1);
INSERT INTO FUNCIONARIOS VALUES (151,'Larson','blarson46@newsvine.com','Masculino','Books','8/9/2011',50066,'Operator',1);
INSERT INTO FUNCIONARIOS VALUES (152,'Roberts','droberts47@jimdo.com','Masculino','Música','7/22/2011',105319,'Compensation Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (153,'Carroll','jcarroll48@cisco.com','Masculino','Lar','10/30/2003',110622,'Safety Technician IV',4);
INSERT INTO FUNCIONARIOS VALUES (154,'Russell','mrussell49@exblog.jp','Feminino','Eletronicos','10/16/2009',87422,'Help Desk Operator',7);
INSERT INTO FUNCIONARIOS VALUES (155,'Robinson','trobinson4a@amazon.com','Masculino','Books','9/6/2007',45456,'Chemical Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (156,'Hayes','ahayes4b@guardian.co.uk','Masculino','Industrial','5/21/2004',52298,'Analyst Programmer',7);
INSERT INTO FUNCIONARIOS VALUES (157,'Henry','dhenry4c@yelp.com','Masculino','Calçados','5/14/2007',131252,'Account Representative III',1);
INSERT INTO FUNCIONARIOS VALUES (158,'Chavez','mchavez4d@baidu.com','Masculino','Jardim','2/23/2001',128766,'Desktop Support Technician',2);
INSERT INTO FUNCIONARIOS VALUES (159,'Harvey','eharvey4e@opera.com','Masculino','Ferramentas','9/12/2009',138179,'Analog Circuit Design manager',3);
INSERT INTO FUNCIONARIOS VALUES (160,'Gutierrez','cgutierrez4f@usnews.com','Feminino','Industrial','6/22/2003',85012,'Financial Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (161,'Cruz','mcruz4g@dedecms.com','Masculino','Saúde','8/24/2001',131479,'Senior Cost Accountant',7);
INSERT INTO FUNCIONARIOS VALUES (162,'Sullivan','jsullivan4h@cloudflare.com','Feminino','Saúde','12/28/2005',103182,'Accounting Assistant I',2);
INSERT INTO FUNCIONARIOS VALUES (163,'Robertson','jrobertson4i@live.com','Masculino','Jardim','6/7/2000',96996,'Software Test Engineer I',4);
INSERT INTO FUNCIONARIOS VALUES (164,'Robertson','trobertson4j@youtu.be','Feminino','Computadores','8/30/2008',106607,'Automation Specialist I',2);
INSERT INTO FUNCIONARIOS VALUES (165,'Lawson','jlawson4k@prnewswire.com','Masculino','Automotivo','12/5/2012',130993,'Administrative Officer',2);
INSERT INTO FUNCIONARIOS VALUES (166,'Meyer','kmeyer4l@bloglovin.com','Masculino','Industrial','3/5/2006',87097,'Safety Technician IV',7);
INSERT INTO FUNCIONARIOS VALUES (167,'Lopez','rlopez4m@foxnews.com','Masculino','Outdoors','1/25/2013',131961,'Legal Assistant',4);
INSERT INTO FUNCIONARIOS VALUES (168,'Burns','pburns4n@networksolutions.com','Feminino','Joalheria','6/9/2014',88093,'Editor',7);

INSERT INTO FUNCIONARIOS VALUES (170,'Martinez','cmartinez4p@facebook.com','Masculino','Eletronicos','6/28/2004',52808,'Human Resources Assistant I',2);

INSERT INTO FUNCIONARIOS VALUES (172,'Fields','rfields4r@amazon.co.uk','Masculino','Books','9/5/2009',101520,'Project Manager',1);
INSERT INTO FUNCIONARIOS VALUES (173,'Fox','ffox4s@geocities.com','Feminino','Books','11/21/2005',55633,'Systems Administrator IV',1);
INSERT INTO FUNCIONARIOS VALUES (174,'Reynolds','dreynolds4t@biglobe.ne.jp','Feminino','Books','10/8/2010',91561,'VP Product Management',7);
INSERT INTO FUNCIONARIOS VALUES (175,'Daniels','cdaniels4u@rambler.ru','Masculino','Alimentícios','11/7/2013',77307,'Biostatistician IV',7);
INSERT INTO FUNCIONARIOS VALUES (176,'Fisher','rfisher4v@jigsy.com','Masculino','Roupas','10/14/2012',67942,'Financial Advisor',6);
INSERT INTO FUNCIONARIOS VALUES (177,'Ferguson','nferguson4w@networksolutions.com','Feminino','Roupas','9/18/2008',80397,'Compensation Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (178,'Butler','cbutler4x@amazon.de','Feminino','Esporte','2/17/2003',78157,'Librarian',1);
INSERT INTO FUNCIONARIOS VALUES (179,'Reynolds','rreynolds4y@miitbeian.gov.cn','Feminino','Jardim','1/29/2004',121836,'VP Accounting',7);
INSERT INTO FUNCIONARIOS VALUES (180,'Williamson','nwilliamson4z@dropbox.com','Masculino','Outdoors','11/8/2008',76063,'Administrative Assistant II',6);
INSERT INTO FUNCIONARIOS VALUES (181,'Shaw','sshaw50@instagram.com','Feminino','Jardim','5/2/2001',56923,'Social Worker',2);
INSERT INTO FUNCIONARIOS VALUES (182,'Gomez','rgomez51@baidu.com','Feminino','Industrial','4/4/2009',76932,'Legal Assistant',5);
INSERT INTO FUNCIONARIOS VALUES (183,'Harrison','jharrison52@scientificamerican.com','Feminino','Games','8/3/2002',64410,'Senior Developer',2);
INSERT INTO FUNCIONARIOS VALUES (184,'Watson','ewatson53@latimes.com','Feminino','Books','2/2/2008',111873,'Payment Adjustment Coordinator',2);
INSERT INTO FUNCIONARIOS VALUES (185,'Watson','rwatson54@webeden.co.uk','Feminino','Roupas','9/22/2001',74648,'Saúde Coach III',2);
INSERT INTO FUNCIONARIOS VALUES (186,'Larson','dlarson55@technorati.com','Feminino','Brinquedos','9/17/2011',144991,'Technical Writer',7);
INSERT INTO FUNCIONARIOS VALUES (187,'Gordon','kgordon56@techcrunch.com','Feminino','Outdoors','11/4/2005',107407,'Systems Administrator II',3);
INSERT INTO FUNCIONARIOS VALUES (188,'Rose','erose57@guardian.co.uk','Masculino','Alimentícios','3/17/2012',120225,'Editor',7);
INSERT INTO FUNCIONARIOS VALUES (189,'Anderson','banderson58@wsj.com','Masculino','Lar','12/2/2014',122272,'Environmental Specialist',2);
INSERT INTO FUNCIONARIOS VALUES (190,'Powell','hpowell59@geocities.com','Feminino','Saúde','11/13/2002',120577,'Web Designer III',1);
INSERT INTO FUNCIONARIOS VALUES (191,'Woods','dwoods5a@businesswire.com','Feminino','Eletronicos','4/29/2008',148986,'Structural Analysis Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (192,'Morales','jmorales5b@joomla.org','Masculino','Games','2/10/2000',101855,'Engineer IV',4);
INSERT INTO FUNCIONARIOS VALUES (193,'Stanley','dstanley5c@is.gd','Feminino','Industrial','2/17/2006',140850,'Financial Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (194,'Wagner','ewagner5d@cornell.edu','Masculino','Brinquedos','2/1/2006',142516,'Professor',1);
INSERT INTO FUNCIONARIOS VALUES (195,'Meyer','nmeyer5e@about.me','Masculino','Calçados','11/9/2012',48829,'Accountant I',1);
INSERT INTO FUNCIONARIOS VALUES (196,'Jacobs','rjacobs5f@oracle.com','Masculino','Outdoors','9/16/2006',81270,'Geological Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (197,'Hayes','jhayes5g@jiathis.com','Feminino','Beleza','1/3/2011',130097,'Office Assistant IV',5);
INSERT INTO FUNCIONARIOS VALUES (198,'Sanders','esanders5h@ihg.com','Feminino','Industrial','1/24/2000',117905,'Dental Hygienist',4);
INSERT INTO FUNCIONARIOS VALUES (199,'Reed','sreed5i@bloglovin.com','Feminino','Calçados','11/12/2010',142483,'Social Worker',3);

INSERT INTO FUNCIONARIOS VALUES (201,'Andrews','jandrews5k@free.fr','Masculino','Lar','3/18/2009',48684,'Nurse Practicioner',6);
INSERT INTO FUNCIONARIOS VALUES (202,'Morris','lmorris5l@patch.com','Feminino','Automotivo','1/23/2004',91932,'Analyst Programmer',1);
INSERT INTO FUNCIONARIOS VALUES (203,'Moreno','jmoreno5m@xing.com','Feminino','Alimentícios','10/7/2005',112004,'Internal Auditor',7);
INSERT INTO FUNCIONARIOS VALUES (204,'Powell','cpowell5n@cocolog-nifty.com','Feminino','Beleza','9/25/2000',116013,'Tax Accountant',4);
INSERT INTO FUNCIONARIOS VALUES (205,'Graham','jgraham5o@printfriendly.com','Feminino','Games','9/10/2008',109058,'Chemical Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (206,'Riley','hriley5p@dailymotion.com','Masculino','Brinquedos','5/6/2012',61992,'Sales Representative',4);

INSERT INTO FUNCIONARIOS VALUES (208,'Gilbert','rgilbert5r@domainmarket.com','Feminino','Alimentícios','12/15/2001',67746,'Director of Sales',2);
INSERT INTO FUNCIONARIOS VALUES (209,'Peterson','jpeterson5s@t-online.de','Masculino','Books','3/14/2010',104530,'VP Marketing',2);
INSERT INTO FUNCIONARIOS VALUES (210,'Foster','jfoster5t@icq.com','Feminino','Música','1/17/2008',42759,'Social Worker',4);
INSERT INTO FUNCIONARIOS VALUES (211,'Fowler','afowler5u@parallels.com','Feminino','Crianças','2/25/2011',43097,'Associate Professor',2);
INSERT INTO FUNCIONARIOS VALUES (212,'Matthews','fmatthews5v@theatlantic.com','Feminino','Outdoors','11/22/2005',123936,'Internal Auditor',1);
INSERT INTO FUNCIONARIOS VALUES (213,'Thomas','gthomas5w@slate.com','Masculino','Ferramentas','11/28/2006',128239,'Teacher',6);
INSERT INTO FUNCIONARIOS VALUES (214,'West','gwest5x@hao123.com','Masculino','Computadores','10/31/2003',66084,'Electrical Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (215,'Stevens','estevens5y@salon.com','Masculino','Games','3/14/2009',106729,'Occupational Therapist',5);
INSERT INTO FUNCIONARIOS VALUES (216,'Howard','dhoward5z@soundcloud.com','Masculino','Joalheria','3/15/2009',87269,'General Manager',4);
INSERT INTO FUNCIONARIOS VALUES (217,'Boyd','mboyd60@jimdo.com','Masculino','Lar','12/1/2004',128765,'Senior Financial Analyst',2);
INSERT INTO FUNCIONARIOS VALUES (218,'Ross','iross61@jimdo.com','Masculino','Games','5/25/2003',104671,'VP Marketing',7);
INSERT INTO FUNCIONARIOS VALUES (219,'Harrison','vharrison62@networkadvertising.org','Masculino','Calçados','5/1/2011',55073,'Assistant Professor',4);
INSERT INTO FUNCIONARIOS VALUES (220,'Ellis','lellis63@ucla.edu','Feminino','Outdoors','11/21/2007',146256,'Paralegal',1);
INSERT INTO FUNCIONARIOS VALUES (221,'Diaz','sdiaz64@disqus.com','Feminino','Lar','1/15/2005',55077,'Registered Nurse',7);
INSERT INTO FUNCIONARIOS VALUES (222,'Snyder','asnyder65@soundcloud.com','Feminino','Alimentícios','4/11/2011',124215,'Recruiting Manager',2);
INSERT INTO FUNCIONARIOS VALUES (223,'Gibson','bgibson66@lulu.com','Masculino','Computadores','4/28/2008',105444,'Human Resources Assistant II',6);
INSERT INTO FUNCIONARIOS VALUES (224,'Hanson','dhanson67@cmu.edu','Feminino','Esporte','5/1/2010',141513,'funcionarios Accountant I',1);
INSERT INTO FUNCIONARIOS VALUES (225,'Peterson','mpeterson68@Lar.pl','Feminino','Calçados','3/13/2008',97623,'Technical Writer',1);
INSERT INTO FUNCIONARIOS VALUES (226,'Gonzalez','tgonzalez69@umich.edu','Masculino','Saúde','11/12/2005',106833,'Registered Nurse',7);
INSERT INTO FUNCIONARIOS VALUES (227,'Rivera','crivera6a@amazon.co.jp','Feminino','Beleza','4/18/2006',69045,'Accounting Assistant IV',2);
INSERT INTO FUNCIONARIOS VALUES (228,'Washington','cwashington6b@cargocollective.com','Masculino','Outdoors','7/4/2008',113311,'Programmer III',2);
INSERT INTO FUNCIONARIOS VALUES (229,'Ruiz','lruiz6c@thetimes.co.uk','Feminino','Outdoors','11/2/2013',116301,'Design Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (230,'Ford','sford6d@flavors.me','Feminino','Industrial','1/5/2006',138459,'Geological Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (231,'Day','lday6e@usgs.gov','Feminino','Roupas','7/3/2005',87800,'Sales Associate',7);
INSERT INTO FUNCIONARIOS VALUES (232,'Peterson','apeterson6f@sina.com.cn','Feminino','Crianças','5/27/2000',52572,'Compensation Analyst',7);
INSERT INTO FUNCIONARIOS VALUES (233,'Gonzalez','rgonzalez6g@europa.eu','Masculino','Eletronicos','4/24/2009',44917,'Biostatistician IV',5);
INSERT INTO FUNCIONARIOS VALUES (234,'Walker','jwalker6h@google.es','Feminino','Calçados','2/2/2010',110896,'Accountant II',2);
INSERT INTO FUNCIONARIOS VALUES (235,'Griffin','sgriffin6i@123-reg.co.uk','Masculino','Books','12/22/2001',108970,'Senior Cost Accountant',2);
INSERT INTO FUNCIONARIOS VALUES (236,'Tucker','jtucker6j@dailymail.co.uk','Masculino','Joalheria','4/27/2009',83543,'Programmer II',5);
INSERT INTO FUNCIONARIOS VALUES (237,'Armstrong','aarmstrong6k@redcross.org','Feminino','Música','7/14/2013',63598,'Budget/Accounting Analyst II',1);
INSERT INTO FUNCIONARIOS VALUES (238,'Gonzales','cgonzales6l@berkeley.edu','Masculino','Filmes','4/6/2014',131274,'Clinical Specialist',2);
INSERT INTO FUNCIONARIOS VALUES (239,'Williamson','jwilliamson6m@arizona.edu','Feminino','Computadores','2/16/2005',149085,'Software Engineer III',7);
INSERT INTO FUNCIONARIOS VALUES (240,'Spencer','wspencer6n@marriott.com','Masculino','Games','9/21/2013',143223,'funcionarios Accountant IV',6);
INSERT INTO FUNCIONARIOS VALUES (241,'Rose','jrose6o@dion.ne.jp','Feminino','Roupas','12/22/2010',107207,'Web Developer II',3);
INSERT INTO FUNCIONARIOS VALUES (242,'Robinson','probinson6p@ucla.edu','Masculino','Saúde','11/30/2003',137594,'Operator',6);
INSERT INTO FUNCIONARIOS VALUES (243,'Gutierrez','kgutierrez6q@bravesites.com','Masculino','Lar','1/26/2006',139845,'Director of Sales',4);
INSERT INTO FUNCIONARIOS VALUES (244,'Alvarez','jalvarez6r@geocities.com','Feminino','Esporte','9/7/2012',65563,'Help Desk Technician',4);
INSERT INTO FUNCIONARIOS VALUES (245,'Webb','swebb6s@people.com.cn','Feminino','Crianças','1/2/2014',142988,'Marketing Manager',6);
INSERT INTO FUNCIONARIOS VALUES (246,'Ellis','tellis6t@squarespace.com','Feminino','Industrial','1/22/2000',134074,'Product Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (247,'Romero','jromero6u@cafepress.com','Masculino','Brinquedos','1/21/2010',80654,'Geological Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (248,'White','jwhite6v@tripadvisor.com','Masculino','Jardim','12/13/2005',118834,'Financial Analyst',6);
INSERT INTO FUNCIONARIOS VALUES (249,'Miller','jmiller6w@businesswire.com','Masculino','Crianças','3/3/2013',85559,'Pharmacist',2);
INSERT INTO FUNCIONARIOS VALUES (250,'Fowler','mfowler6x@geocities.jp','Masculino','Books','9/15/2001',84049,'Information Systems Manager',5);
INSERT INTO FUNCIONARIOS VALUES (251,'Duncan','pduncan6y@sina.com.cn','Feminino','Joalheria','1/16/2011',47439,'Tax Accountant',7);
INSERT INTO FUNCIONARIOS VALUES (252,'Johnston','jjohnston6z@irs.gov','Masculino','Ferramentas','12/16/2000',87072,'Structural Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (253,'Marshall','mmarshall70@hibu.com','Feminino','Computadores','5/12/2003',123401,'Computer Systems Analyst I',4);
INSERT INTO FUNCIONARIOS VALUES (254,'Lawrence','alawrence71@unicef.org','Feminino','Alimentícios','4/2/2001',131681,'Account Executive',7);
INSERT INTO FUNCIONARIOS VALUES (255,'Lynch','rlynch72@sitemeter.com','Feminino','Crianças','8/29/2014',96118,'Social Worker',5);
INSERT INTO FUNCIONARIOS VALUES (256,'Stone','gstone73@google.es','Feminino','Books','12/1/2006',87816,'Administrative Assistant I',2);
INSERT INTO FUNCIONARIOS VALUES (257,'Freeman','gfreeman74@bloomberg.com','Feminino','Lar','6/5/2012',83804,'Operator',1);
INSERT INTO FUNCIONARIOS VALUES (258,'Schmidt','dschmidt75@sitemeter.com','Masculino','Automotivo','10/26/2007',133612,'VP Product Management',4);
INSERT INTO FUNCIONARIOS VALUES (259,'Wallace','gwallace76@technorati.com','Feminino','Computadores','4/14/2010',47007,'Internal Auditor',3);
INSERT INTO FUNCIONARIOS VALUES (260,'Fuller','ffuller77@ustream.tv','Masculino','Saúde','12/13/2005',142967,'GIS Technical Architect',5);
INSERT INTO FUNCIONARIOS VALUES (261,'Bennett','jbennett78@surveymonkey.com','Feminino','Crianças','12/6/2011',71433,'Food Chemist',4);
INSERT INTO FUNCIONARIOS VALUES (262,'Lewis','dlewis79@parallels.com','Feminino','Beleza','3/8/2000',74191,'Business Systems Development Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (263,'Snyder','dsnyder7a@digg.com','Masculino','Filmes','1/29/2005',109004,'Account Coordinator',5);
INSERT INTO FUNCIONARIOS VALUES (264,'Sanders','ksanders7b@pinterest.com','Masculino','Industrial','4/20/2014',102211,'Senior Cost Accountant',3);
INSERT INTO FUNCIONARIOS VALUES (265,'Fox','wfox7c@yelp.com','Masculino','Computadores','8/3/2000',75862,'Electrical Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (266,'Burke','cburke7d@ameblo.jp','Masculino','Joalheria','3/5/2000',61446,'Environmental Specialist',2);
INSERT INTO FUNCIONARIOS VALUES (267,'Murphy','dmurphy7e@patch.com','Masculino','Lar','6/2/2011',146432,'VP Quality Control',2);
INSERT INTO FUNCIONARIOS VALUES (268,'Bowman','hbowman7f@reddit.com','Feminino','Alimentícios','2/18/2002',50623,'Biostatistician III',7);
INSERT INTO FUNCIONARIOS VALUES (269,'Cunningham','kcunningham7g@squidoo.com','Masculino','Outdoors','12/11/2014',108248,'Safety Technician I',3);
INSERT INTO FUNCIONARIOS VALUES (270,'Torres','ttorres7h@telegraph.co.uk','Feminino','Automotivo','8/6/2005',120875,'Software Consultant',1);
INSERT INTO FUNCIONARIOS VALUES (271,'Jordan','pjordan7i@squidoo.com','Feminino','Esporte','8/7/2001',123843,'Senior Sales Associate',7);
INSERT INTO FUNCIONARIOS VALUES (272,'Banks','jbanks7j@dion.ne.jp','Masculino','Música','5/16/2014',43940,'Saúde Coach I',2);
INSERT INTO FUNCIONARIOS VALUES (273,'Gordon','egordon7k@yellowbook.com','Feminino','Filmes','1/6/2013',142840,'Account Coordinator',1);
INSERT INTO FUNCIONARIOS VALUES (274,'Bennett','abennett7l@guardian.co.uk','Masculino','Jardim','8/1/2006',125713,'Account Representative III',3);
INSERT INTO FUNCIONARIOS VALUES (275,'Rivera','arivera7m@comcast.net','Feminino','Books','4/26/2010',122219,'Engineer I',6);
INSERT INTO FUNCIONARIOS VALUES (276,'Ellis','dellis7n@seesaa.net','Feminino','Eletronicos','5/21/2000',46259,'Help Desk Technician',6);
INSERT INTO FUNCIONARIOS VALUES (277,'Richardson','lrichardson7o@fc2.com','Feminino','Roupas','7/14/2003',142403,'Engineer III',3);
INSERT INTO FUNCIONARIOS VALUES (278,'Ortiz','wortiz7p@reddit.com','Masculino','Jardim','1/26/2000',88165,'Librarian',4);
INSERT INTO FUNCIONARIOS VALUES (279,'Clark','mclark7q@privacy.gov.au','Masculino','Jardim','6/26/2007',86291,'Dental Hygienist',7);
INSERT INTO FUNCIONARIOS VALUES (280,'Chavez','rchavez7r@youtu.be','Masculino','Crianças','6/4/2008',139163,'Legal Assistant',5);
INSERT INTO FUNCIONARIOS VALUES (281,'Holmes','aholmes7s@last.fm','Masculino','Música','11/5/2006',48892,'Accounting Assistant I',1);
INSERT INTO FUNCIONARIOS VALUES (282,'Fowler','rfowler7t@ameblo.jp','Feminino','Outdoors','12/24/2014',120540,'Junior Executive',6);
INSERT INTO FUNCIONARIOS VALUES (283,'George','ageorge7u@1und1.de','Feminino','Saúde','3/13/2000',47450,'Automation Specialist I',1);
INSERT INTO FUNCIONARIOS VALUES (284,'Murray','kmurray7v@ca.gov','Feminino','Saúde','8/25/2008',142255,'Quality Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (285,'Hunter','rhunter7w@buzzfeed.com','Masculino','Jardim','8/16/2000',62441,'Environmental Specialist',3);
INSERT INTO FUNCIONARIOS VALUES (286,'Long','elong7x@nymag.com','Feminino','Games','3/11/2007',142529,'Librarian',2);
INSERT INTO FUNCIONARIOS VALUES (287,'Andrews','tandrews7y@ycombinator.com','Feminino','Beleza','3/19/2010',142103,'Associate Professor',4);
INSERT INTO FUNCIONARIOS VALUES (288,'Moore','bmoore7z@twitpic.com','Masculino','Eletronicos','8/11/2002',102395,'Account Coordinator',6);
INSERT INTO FUNCIONARIOS VALUES (289,'Sanders','csanders80@blog.com','Masculino','Lar','10/9/2009',44593,'Engineer III',2);
INSERT INTO FUNCIONARIOS VALUES (290,'Carter','scarter81@cargocollective.com','Masculino','Alimentícios','2/9/2007',120800,'Accountant III',5);
INSERT INTO FUNCIONARIOS VALUES (291,'Moreno','rmoreno82@alibaba.com','Feminino','Books','11/26/2003',121238,'Senior Developer',4);
INSERT INTO FUNCIONARIOS VALUES (292,'Ortiz','dortiz83@themeforest.net','Feminino','Automotivo','12/8/2011',91296,'Environmental Tech',6);
INSERT INTO FUNCIONARIOS VALUES (293,'Castillo','pcastillo84@1688.com','Feminino','Saúde','8/24/2011',86070,'Clinical Specialist',3);
INSERT INTO FUNCIONARIOS VALUES (294,'Cooper','icooper85@w3.org','Feminino','Filmes','1/31/2009',61519,'Human Resources Assistant III',7);
INSERT INTO FUNCIONARIOS VALUES (295,'Harris','lharris86@ibm.com','Feminino','Books','9/20/2005',47131,'Developer IV',6);
INSERT INTO FUNCIONARIOS VALUES (296,'Edwards','aedwards87@webeden.co.uk','Masculino','Crianças','4/7/2008',93962,'funcionarios Scientist',3);
INSERT INTO FUNCIONARIOS VALUES (297,'Harrison','nharrison88@imageshack.us','Masculino','Calçados','11/12/2014',133845,'Executive Secretary',4);
INSERT INTO FUNCIONARIOS VALUES (298,'Berry','lberry89@gov.uk','Masculino','Roupas','6/17/2010',43067,'Research Assistant I',7);
INSERT INTO FUNCIONARIOS VALUES (299,'Stephens','cstephens8a@imdb.com','Feminino','Beleza','9/1/2001',88972,'Paralegal',7);
INSERT INTO FUNCIONARIOS VALUES (300,'Arnold','barnold8b@thetimes.co.uk','Masculino','Roupas','11/15/2005',77635,'VP Product Management',3);
INSERT INTO FUNCIONARIOS VALUES (301,'Myers','amyers8c@ibm.com','Masculino','Alimentícios','5/16/2011',148993,'Speech Pathologist',1);
INSERT INTO FUNCIONARIOS VALUES (302,'Jenkins','rjenkins8d@wufoo.com','Feminino','Ferramentas','8/15/2002',113599,'Geological Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (303,'West','jwest8e@berkeley.edu','Masculino','Eletronicos','3/15/2012',76943,'General Manager',7);
INSERT INTO FUNCIONARIOS VALUES (304,'Mccoy','mmccoy8f@wisc.edu','Feminino','Books','5/26/2007',77486,'Community Outreach Specialist',4);
INSERT INTO FUNCIONARIOS VALUES (305,'Johnson','fjohnson8g@wikipedia.org','Masculino','Eletronicos','11/20/2013',135001,'Recruiting Manager',4);
INSERT INTO FUNCIONARIOS VALUES (306,'Sanders','ssanders8h@mtv.com','Masculino','Bebês','11/10/2008',52171,'Data Coordiator',2);
INSERT INTO FUNCIONARIOS VALUES (307,'Cunningham','acunningham8i@wikimedia.org','Feminino','Jardim','6/22/2006',139302,'Engineer IV',5);
INSERT INTO FUNCIONARIOS VALUES (308,'Lynch','slynch8j@123-reg.co.uk','Feminino','Saúde','8/9/2000',126683,'Librarian',4);
INSERT INTO FUNCIONARIOS VALUES (309,'Riley','driley8k@dell.com','Masculino','Esporte','7/4/2006',143781,'Product Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (310,'Ray','aray8l@cbc.ca','Masculino','Books','3/5/2008',51761,'Cost Accountant',5);
INSERT INTO FUNCIONARIOS VALUES (311,'Lane','plane8m@pbs.org','Masculino','Calçados','5/26/2011',45463,'Marketing Manager',5);
INSERT INTO FUNCIONARIOS VALUES (312,'Jordan','pjordan8n@adobe.com','Feminino','Roupas','11/15/2003',133498,'Nuclear Power Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (313,'Gibson','bgibson8o@pen.io','Feminino','Lar','3/21/2011',81273,'Saúde Coach II',4);
INSERT INTO FUNCIONARIOS VALUES (314,'Elliott','telliott8p@mozilla.org','Masculino','Computadores','2/27/2008',77921,'Environmental Specialist',7);
INSERT INTO FUNCIONARIOS VALUES (315,'Smith','bsmith8q@mysql.com','Masculino','Games','7/25/2012',59580,'General Manager',2);
INSERT INTO FUNCIONARIOS VALUES (316,'Peters','cpeters8r@epa.gov','Masculino','Esporte','9/16/2010',40418,'VP Marketing',2);
INSERT INTO FUNCIONARIOS VALUES (317,'Tucker','htucker8s@photobucket.com','Masculino','Alimentícios','8/5/2004',104844,'Structural Analysis Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (318,'Moore','jmoore8t@umich.edu','Masculino','Computadores','4/27/2003',139304,'Help Desk Technician',3);
INSERT INTO FUNCIONARIOS VALUES (319,'Crawford','mcrawford8u@parallels.com','Feminino','Lar','12/20/2011',140996,'Software Engineer IV',3);
INSERT INTO FUNCIONARIOS VALUES (320,'Gilbert','egilbert8v@nydailynews.com','Masculino','Jardim','4/12/2010',52430,'Assistant Media Planner',5);
INSERT INTO FUNCIONARIOS VALUES (321,'Wheeler','jwheeler8w@whitehouse.gov','Feminino','Books','8/24/2001',145284,'Information Systems Manager',7);
INSERT INTO FUNCIONARIOS VALUES (322,'Marshall','jmarshall8x@va.gov','Masculino','Computadores','11/7/2013',66063,'Web Designer III',2);
INSERT INTO FUNCIONARIOS VALUES (323,'Robinson','rrobinson8y@businessinsider.com','Masculino','Eletronicos','4/10/2008',134422,'Occupational Therapist',4);
INSERT INTO FUNCIONARIOS VALUES (324,'Stevens','astevens8z@si.edu','Feminino','Computadores','5/19/2012',106229,'Research Associate',4);
INSERT INTO FUNCIONARIOS VALUES (325,'Wright','kwright90@buzzfeed.com','Feminino','Roupas','5/13/2012',107727,'Computer Systems Analyst I',2);
INSERT INTO FUNCIONARIOS VALUES (326,'Castillo','bcastillo91@hc360.com','Feminino','Joalheria','12/12/2007',130188,'Social Worker',3);
INSERT INTO FUNCIONARIOS VALUES (327,'Edwards','medwards92@mail.ru','Masculino','Automotivo','10/4/2002',140194,'Programmer IV',5);
INSERT INTO FUNCIONARIOS VALUES (328,'Hanson','bhanson93@blinklist.com','Feminino','Computadores','1/6/2005',58719,'Media Manager I',4);
INSERT INTO FUNCIONARIOS VALUES (329,'Mccoy','hmccoy94@miitbeian.gov.cn','Feminino','Calçados','7/27/2004',86803,'Administrative Assistant III',4);
INSERT INTO FUNCIONARIOS VALUES (330,'Dunn','cdunn95@ft.com','Masculino','Industrial','6/23/2010',68334,'Administrative Officer',7);
INSERT INTO FUNCIONARIOS VALUES (331,'Hudson','jhudson96@thetimes.co.uk','Feminino','Esporte','12/23/2008',91906,'Food Chemist',4);
INSERT INTO FUNCIONARIOS VALUES (332,'Garza','lgarza97@bing.com','Feminino','Games','12/20/2006',48064,'Office Assistant II',5);
INSERT INTO FUNCIONARIOS VALUES (333,'Garza','pgarza98@go.com','Masculino','Industrial','6/30/2004',75281,'Data Coordiator',7);
INSERT INTO FUNCIONARIOS VALUES (334,'Mills','fmills99@ameblo.jp','Masculino','Industrial','3/24/2009',91659,'VP Accounting',4);
INSERT INTO FUNCIONARIOS VALUES (335,'Gilbert','pgilbert9a@wiley.com','Feminino','Esporte','10/3/2001',52792,'Pharmacist',2);
INSERT INTO FUNCIONARIOS VALUES (336,'Campbell','pcampbell9b@istockphoto.com','Feminino','Lar','8/30/2001',40415,'Food Chemist',4);
INSERT INTO FUNCIONARIOS VALUES (337,'Spencer','dspencer9c@ed.gov','Masculino','Filmes','6/16/2008',83256,'Senior Editor',5);
INSERT INTO FUNCIONARIOS VALUES (338,'Garrett','kgarrett9d@wordpress.com','Feminino','Eletronicos','12/30/2012',145181,'Programmer Analyst III',1);
INSERT INTO FUNCIONARIOS VALUES (339,'Hudson','rhudson9e@geocities.com','Feminino','Joalheria','7/23/2004',78294,'Software Consultant',4);
INSERT INTO FUNCIONARIOS VALUES (340,'Williams','jwilliams9f@canalblog.com','Masculino','Eletronicos','7/3/2007',90120,'Biostatistician I',2);
INSERT INTO FUNCIONARIOS VALUES (341,'Ellis','cellis9g@ibm.com','Masculino','Lar','9/24/2008',80284,'VP Accounting',3);
INSERT INTO FUNCIONARIOS VALUES (342,'Carroll','scarroll9h@yellowbook.com','Feminino','Calçados','7/26/2009',85511,'Business Systems Development Analyst',5);
INSERT INTO FUNCIONARIOS VALUES (343,'Long','along9i@ocn.ne.jp','Feminino','Brinquedos','6/13/2008',40138,'Payment Adjustment Coordinator',6);
INSERT INTO FUNCIONARIOS VALUES (344,'Owens','eowens9j@skyrock.com','Masculino','Books','6/17/2010',42714,'Electrical Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (345,'Perez','jperez9k@bloglines.com','Masculino','Música','6/21/2005',65767,'Programmer Analyst I',4);
INSERT INTO FUNCIONARIOS VALUES (346,'Freeman','lfreeman9l@cpanel.net','Feminino','Crianças','2/13/2013',149351,'Design Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (347,'Frazier','dfrazier9m@amazon.co.uk','Feminino','Ferramentas','1/3/2012',88470,'Associate Professor',1);
INSERT INTO FUNCIONARIOS VALUES (348,'Thomas','athomas9n@answers.com','Feminino','Eletronicos','11/26/2009',90317,'Saúde Coach I',4);
INSERT INTO FUNCIONARIOS VALUES (349,'Crawford','acrawford9o@cpanel.net','Masculino','Jardim','10/10/2012',142149,'Compensation Analyst',2);
INSERT INTO FUNCIONARIOS VALUES (350,'Hawkins','ahawkins9p@hud.gov','Masculino','Eletronicos','5/21/2000',144073,'Programmer I',1);
INSERT INTO FUNCIONARIOS VALUES (351,'Fuller','jfuller9q@merriam-webster.com','Feminino','Books','8/17/2001',54410,'Programmer Analyst II',7);
INSERT INTO FUNCIONARIOS VALUES (352,'Moreno','smoreno9r@slate.com','Masculino','Lar','6/28/2000',107907,'Financial Advisor',5);
INSERT INTO FUNCIONARIOS VALUES (353,'Gonzales','jgonzales9s@sourceforge.net','Feminino','Lar','7/10/2010',91249,'Mechanical Systems Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (354,'Hudson','shudson9t@shareasale.com','Masculino','Outdoors','12/20/2005',78478,'Compensation Analyst',5);
INSERT INTO FUNCIONARIOS VALUES (355,'Murray','cmurray9u@reverbnation.com','Masculino','Esporte','7/7/2005',48812,'Human Resources Assistant III',7);
INSERT INTO FUNCIONARIOS VALUES (356,'Stephens','estephens9v@bbc.co.uk','Feminino','Alimentícios','4/27/2000',147440,'Sales Associate',2);
INSERT INTO FUNCIONARIOS VALUES (357,'Reynolds','dreynolds9w@angelfire.com','Masculino','Outdoors','5/18/2003',87978,'Senior Financial Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (358,'Gutierrez','jgutierrez9x@telegraph.co.uk','Masculino','Automotivo','6/17/2002',67800,'Desktop Support Technician',2);
INSERT INTO FUNCIONARIOS VALUES (359,'Tucker','gtucker9y@instagram.com','Masculino','Bebês','5/14/2010',42944,'Tax Accountant',3);
INSERT INTO FUNCIONARIOS VALUES (360,'Jenkins','jjenkins9z@w3.org','Feminino','Automotivo','7/18/2004',84356,'Marketing Assistant',2);
INSERT INTO FUNCIONARIOS VALUES (361,'Rice','dricea0@hubpages.com','Feminino','Jardim','12/6/2006',144724,'Senior Quality Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (362,'Burke','jburkea1@mayoclinic.com','Masculino','Alimentícios','9/8/2003',147290,'Analyst Programmer',6);
INSERT INTO FUNCIONARIOS VALUES (363,'Hall','jhalla2@prweb.com','Masculino','Automotivo','12/28/2001',83177,'Community Outreach Specialist',3);
INSERT INTO FUNCIONARIOS VALUES (364,'Ryan','rryana3@twitter.com','Masculino','Saúde','5/31/2014',83252,'Civil Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (365,'Gonzales','jgonzalesa4@cpanel.net','Masculino','Roupas','8/30/2000',127393,'Help Desk Technician',7);
INSERT INTO FUNCIONARIOS VALUES (366,'Jacobs','bjacobsa5@domainmarket.com','Masculino','Industrial','1/29/2006',67186,'Research Nurse',1);
INSERT INTO FUNCIONARIOS VALUES (367,'Ramos','jramosa6@cdbaby.com','Feminino','Beleza','3/5/2002',102361,'Computer Systems Analyst III',5);
INSERT INTO FUNCIONARIOS VALUES (368,'Rivera','driveraa7@typepad.com','Feminino','Crianças','8/15/2001',60688,'Paralegal',1);
INSERT INTO FUNCIONARIOS VALUES (369,'Lawrence','llawrencea8@mozilla.com','Feminino','Eletronicos','4/24/2013',44704,'Data Coordiator',2);
INSERT INTO FUNCIONARIOS VALUES (370,'Austin','eaustina9@answers.com','Masculino','Lar','1/9/2002',110627,'Teacher',7);
INSERT INTO FUNCIONARIOS VALUES (371,'Sims','bsimsaa@privacy.gov.au','Masculino','Esporte','6/4/2000',127223,'Operator',5);
INSERT INTO FUNCIONARIOS VALUES (372,'Harper','rharperab@china.com.cn','Feminino','Crianças','8/31/2001',96163,'Safety Technician IV',3);

INSERT INTO FUNCIONARIOS VALUES (374,'Mcdonald','jmcdonaldad@sbwire.com','Feminino','Bebês','9/19/2005',141464,'Programmer IV',4);
INSERT INTO FUNCIONARIOS VALUES (375,'Hudson','mhudsonae@ihg.com','Feminino','Industrial','8/27/2014',88029,'Help Desk Operator',4);
INSERT INTO FUNCIONARIOS VALUES (376,'Harper','charperaf@google.pl','Masculino','Lar','3/21/2007',47281,'VP Quality Control',6);
INSERT INTO FUNCIONARIOS VALUES (377,'Alexander','valexanderag@amazon.co.uk','Feminino','Eletronicos','1/15/2002',93245,'funcionarios Scientist',1);
INSERT INTO FUNCIONARIOS VALUES (378,'Nichols','bnicholsah@networkadvertising.org','Masculino','Automotivo','7/30/2012',110589,'Cost Accountant',7);

INSERT INTO FUNCIONARIOS VALUES (380,'Turner','bturneraj@samsung.com','Feminino','Industrial','11/23/2013',91182,'Compensation Analyst',5);
INSERT INTO FUNCIONARIOS VALUES (381,'Welch','dwelchak@printfriendly.com','Masculino','Música','9/9/2012',133007,'Software Test Engineer I',7);
INSERT INTO FUNCIONARIOS VALUES (382,'Payne','jpayneal@comsenz.com','Feminino','Lar','8/10/2012',92879,'Nurse',2);
INSERT INTO FUNCIONARIOS VALUES (383,'Young','pyoungam@theguardian.com','Masculino','Roupas','12/10/2002',104079,'Systems Administrator IV',4);
INSERT INTO FUNCIONARIOS VALUES (384,'Butler','dbutleran@eventbrite.com','Feminino','Beleza','11/1/2005',63918,'Structural Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (385,'Carroll','ecarrollao@newsvine.com','Feminino','Automotivo','5/2/2011',128885,'Office Assistant III',5);
INSERT INTO FUNCIONARIOS VALUES (386,'Griffin','tgriffinap@reddit.com','Masculino','Games','2/27/2011',140567,'Research Associate',2);
INSERT INTO FUNCIONARIOS VALUES (387,'Burke','mburkeaq@360.cn','Feminino','Jardim','8/9/2003',95726,'Registered Nurse',4);
INSERT INTO FUNCIONARIOS VALUES (388,'Kelley','akelleyar@list-manage.com','Feminino','Música','1/24/2008',84261,'Senior Editor',5);
INSERT INTO FUNCIONARIOS VALUES (389,'Ortiz','gortizas@w3.org','Masculino','Bebês','6/22/2013',42924,'Marketing Assistant',2);
INSERT INTO FUNCIONARIOS VALUES (390,'Olson','aolsonat@cpanel.net','Masculino','Computadores','9/14/2008',86670,'Web Designer II',2);
INSERT INTO FUNCIONARIOS VALUES (391,'White','cwhiteau@amazon.de','Feminino','Roupas','11/4/2003',147702,'VP Quality Control',4);
INSERT INTO FUNCIONARIOS VALUES (392,'Peters','apetersav@loc.gov','Feminino','Beleza','2/2/2013',132470,'Database Administrator II',6);
INSERT INTO FUNCIONARIOS VALUES (393,'Sullivan','ksullivanaw@slideshare.net','Feminino','Música','9/11/2000',63341,'Research Associate',7);
INSERT INTO FUNCIONARIOS VALUES (394,'Washington','rwashingtonax@gmpg.org','Feminino','Beleza','10/23/2002',91651,'funcionarios Accountant III',4);
INSERT INTO FUNCIONARIOS VALUES (395,'Ward','jwarday@quantcast.com','Masculino','Bebês','9/11/2013',48927,'Sales Representative',6);
INSERT INTO FUNCIONARIOS VALUES (396,'Kelly','bkellyaz@bandcamp.com','Feminino','Crianças','11/17/2013',143433,'Web Developer II',1);
INSERT INTO FUNCIONARIOS VALUES (397,'Martin','hmartinb0@homestead.com','Masculino','Brinquedos','10/2/2006',81998,'Product Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (398,'Cooper','scooperb1@cmu.edu','Feminino','Lar','5/8/2001',68584,'Quality Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (399,'Holmes','jholmesb2@uol.com.br','Feminino','Computadores','7/4/2009',88216,'Accountant III',3);
INSERT INTO FUNCIONARIOS VALUES (400,'Harrison','jharrisonb3@google.de','Masculino','Saúde','12/24/2011',86046,'Nuclear Power Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (401,'Parker','jparkerb4@mit.edu','Feminino','Outdoors','3/5/2008',148906,'Project Manager',5);
INSERT INTO FUNCIONARIOS VALUES (402,'Marshall','emarshallb5@yahoo.co.jp','Feminino','Roupas','11/10/2007',93266,'Recruiter',7);
INSERT INTO FUNCIONARIOS VALUES (403,'Chapman','schapmanb6@nhs.uk','Feminino','Lar','3/9/2002',69702,'Food Chemist',1);
INSERT INTO FUNCIONARIOS VALUES (404,'Harvey','aharveyb7@who.int','Feminino','Outdoors','12/28/2010',43366,'Administrative Assistant IV',4);
INSERT INTO FUNCIONARIOS VALUES (405,'Morgan','dmorganb8@moonfruit.com','Masculino','Industrial','5/19/2005',101945,'Web Developer I',2);
INSERT INTO FUNCIONARIOS VALUES (406,'Foster','pfosterb9@intel.com','Masculino','Brinquedos','2/1/2003',54007,'Geological Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (407,'Vasquez','jvasquezba@dion.ne.jp','Masculino','Bebês','4/9/2013',54704,'Analog Circuit Design manager',3);
INSERT INTO FUNCIONARIOS VALUES (408,'Moore','jmoorebb@liveinternet.ru','Feminino','Computadores','11/13/2007',93954,'Project Manager',5);
INSERT INTO FUNCIONARIOS VALUES (409,'Williams','swilliamsbc@bing.com','Feminino','Lar','4/22/2007',58235,'Analog Circuit Design manager',6);
INSERT INTO FUNCIONARIOS VALUES (410,'Harris','lharrisbd@ow.ly','Feminino','Ferramentas','1/7/2012',148940,'Senior Financial Analyst',6);
INSERT INTO FUNCIONARIOS VALUES (411,'Hayes','chayesbe@usnews.com','Masculino','Crianças','4/9/2003',110615,'Paralegal',6);

INSERT INTO FUNCIONARIOS VALUES (413,'Brooks','lbrooksbg@storify.com','Feminino','Saúde','9/19/2008',94502,'Executive Secretary',1);
INSERT INTO FUNCIONARIOS VALUES (414,'Peterson','epetersonbh@reverbnation.com','Masculino','Games','8/10/2011',72505,'Registered Nurse',3);
INSERT INTO FUNCIONARIOS VALUES (415,'Holmes','dholmesbi@jugem.jp','Masculino','Brinquedos','6/18/2001',147150,'Analog Circuit Design manager',6);
INSERT INTO FUNCIONARIOS VALUES (416,'Butler','dbutlerbj@wix.com','Feminino','Beleza','2/9/2002',66313,'Food Chemist',5);
INSERT INTO FUNCIONARIOS VALUES (417,'Hanson','shansonbk@ted.com','Masculino','Eletronicos','11/4/2002',97372,'Systems Administrator I',6);
INSERT INTO FUNCIONARIOS VALUES (418,'Morales','dmoralesbl@mit.edu','Feminino','Lar','10/2/2013',149598,'VP Product Management',3);
INSERT INTO FUNCIONARIOS VALUES (419,'Dixon','jdixonbm@indiatimes.com','Masculino','Saúde','2/22/2008',104224,'Clinical Specialist',5);
INSERT INTO FUNCIONARIOS VALUES (420,'Henry','hhenrybn@privacy.gov.au','Feminino','Ferramentas','9/24/2007',95583,'Civil Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (421,'Harper','rharperbo@webeden.co.uk','Feminino','Música','1/5/2001',92043,'Assistant Manager',3);
INSERT INTO FUNCIONARIOS VALUES (422,'Torres','ctorresbp@yahoo.com','Feminino','Computadores','9/17/2009',118307,'funcionarios Accountant II',1);
INSERT INTO FUNCIONARIOS VALUES (423,'Walker','awalkerbq@wsj.com','Feminino','Joalheria','5/11/2011',145281,'VP Accounting',4);
INSERT INTO FUNCIONARIOS VALUES (424,'Berry','jberrybr@discuz.net','Feminino','Lar','8/20/2013',148640,'Internal Auditor',4);
INSERT INTO FUNCIONARIOS VALUES (425,'Carpenter','lcarpenterbs@xrea.com','Feminino','Computadores','9/7/2000',125523,'Financial Advisor',7);
INSERT INTO FUNCIONARIOS VALUES (426,'Graham','tgrahambt@mediafire.com','Masculino','Crianças','1/12/2009',49503,'Occupational Therapist',5);
INSERT INTO FUNCIONARIOS VALUES (427,'Clark','aclarkbu@npr.org','Feminino','Esporte','9/10/2000',146611,'Systems Administrator III',7);
INSERT INTO FUNCIONARIOS VALUES (428,'Schmidt','rschmidtbv@tumblr.com','Feminino','Esporte','2/8/2012',125465,'Teacher',1);
INSERT INTO FUNCIONARIOS VALUES (429,'Ortiz','jortizbw@t.co','Feminino','Roupas','1/23/2003',75024,'Structural Analysis Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (430,'Hall','ehallbx@google.com.br','Masculino','Esporte','10/25/2011',60793,'Registered Nurse',7);
INSERT INTO FUNCIONARIOS VALUES (431,'Bishop','kbishopby@loc.gov','Feminino','Ferramentas','6/6/2010',110744,'Accountant I',2);
INSERT INTO FUNCIONARIOS VALUES (432,'Murphy','nmurphybz@jiathis.com','Feminino','Joalheria','8/21/2006',46653,'Registered Nurse',4);
INSERT INTO FUNCIONARIOS VALUES (433,'Parker','dparkerc0@webeden.co.uk','Masculino','Games','5/4/2014',114919,'Database Administrator III',7);
INSERT INTO FUNCIONARIOS VALUES (434,'Lee','rleec1@ibm.com','Feminino','Computadores','7/24/2000',98733,'Payment Adjustment Coordinator',4);
INSERT INTO FUNCIONARIOS VALUES (435,'Ellis','kellisc2@cafepress.com','Feminino','Saúde','8/23/2008',139775,'Chemical Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (436,'Bishop','abishopc3@e-recht24.de','Feminino','Joalheria','5/10/2005',69559,'Programmer Analyst III',3);
INSERT INTO FUNCIONARIOS VALUES (437,'Roberts','arobertsc4@businessweek.com','Masculino','Filmes','7/10/2007',48934,'Electrical Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (438,'Moreno','bmorenoc5@addtoany.com','Masculino','Alimentícios','4/25/2014',79980,'Recruiter',5);
INSERT INTO FUNCIONARIOS VALUES (439,'Boyd','eboydc6@unc.edu','Masculino','Roupas','4/1/2002',108854,'Senior Editor',4);
INSERT INTO FUNCIONARIOS VALUES (440,'Murphy','amurphyc7@wikia.com','Masculino','Books','1/23/2007',128105,'Help Desk Technician',7);
INSERT INTO FUNCIONARIOS VALUES (441,'Bailey','jbaileyc8@newsvine.com','Masculino','Books','6/10/2008',71676,'GIS Technical Architect',4);
INSERT INTO FUNCIONARIOS VALUES (442,'Bryant','jbryantc9@zdnet.com','Feminino','Música','9/11/2007',139347,'Data Coordiator',1);
INSERT INTO FUNCIONARIOS VALUES (443,'Powell','cpowellca@samsung.com','Feminino','Industrial','2/28/2002',80491,'GIS Technical Architect',7);
INSERT INTO FUNCIONARIOS VALUES (444,'Ferguson','jfergusoncb@sphinn.com','Feminino','Ferramentas','12/30/2010',119385,'Assistant Media Planner',4);
INSERT INTO FUNCIONARIOS VALUES (445,'Greene','dgreenecc@reuters.com','Masculino','Brinquedos','3/23/2002',149835,'Geologist III',1);
INSERT INTO FUNCIONARIOS VALUES (446,'Kennedy','pkennedycd@google.cn','Feminino','Saúde','12/2/2008',80137,'Business Systems Development Analyst',2);
INSERT INTO FUNCIONARIOS VALUES (447,'Brooks','cbrooksce@washingtonpost.com','Masculino','Lar','8/25/2000',79724,'Developer IV',7);
INSERT INTO FUNCIONARIOS VALUES (448,'Brooks','jbrookscf@ucla.edu','Masculino','Books','6/25/2009',102458,'Occupational Therapist',1);
INSERT INTO FUNCIONARIOS VALUES (449,'Gray','tgraycg@fotki.com','Feminino','Roupas','4/20/2014',134205,'Biostatistician I',4);
INSERT INTO FUNCIONARIOS VALUES (450,'Morgan','kmorganch@reddit.com','Feminino','Beleza','5/21/2004',76052,'Technical Writer',5);
INSERT INTO FUNCIONARIOS VALUES (451,'Robinson','arobinsonci@mapy.cz','Feminino','Música','11/17/2004',144608,'Research Associate',4);
INSERT INTO FUNCIONARIOS VALUES (452,'Kennedy','ckennedycj@boston.com','Feminino','Brinquedos','5/10/2000',111072,'Senior Quality Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (453,'Anderson','aandersonck@whitehouse.gov','Masculino','Automotivo','1/24/2010',126485,'Computer Systems Analyst I',6);
INSERT INTO FUNCIONARIOS VALUES (454,'Price','jpricecl@liveinternet.ru','Feminino','Bebês','9/22/2006',96388,'Graphic Designer',6);
INSERT INTO FUNCIONARIOS VALUES (455,'Hawkins','jhawkinscm@furl.net','Feminino','Automotivo','6/13/2002',115506,'Product Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (456,'Watson','swatsoncn@wufoo.com','Feminino','Industrial','3/10/2012',115679,'Editor',2);
INSERT INTO FUNCIONARIOS VALUES (457,'Cole','bcoleco@parallels.com','Feminino','Joalheria','12/11/2001',133040,'Research Associate',6);
INSERT INTO FUNCIONARIOS VALUES (458,'Little','dlittlecp@usatoday.com','Feminino','Filmes','5/14/2000',91660,'Research Assistant I',5);
INSERT INTO FUNCIONARIOS VALUES (459,'Robertson','erobertsoncq@prweb.com','Feminino','Computadores','9/20/2009',136406,'Chemical Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (460,'Sanchez','lsanchezcr@rediff.com','Masculino','Automotivo','4/28/2005',146167,'Assistant Professor',5);
INSERT INTO FUNCIONARIOS VALUES (461,'Lane','llanecs@free.fr','Feminino','Books','4/4/2003',94299,'Media Manager III',4);
INSERT INTO FUNCIONARIOS VALUES (462,'Perry','rperryct@answers.com','Masculino','Industrial','7/31/2004',56382,'Executive Secretary',3);
INSERT INTO FUNCIONARIOS VALUES (463,'Mason','dmasoncu@about.com','Masculino','Ferramentas','12/21/2010',120160,'Database Administrator II',3);
INSERT INTO FUNCIONARIOS VALUES (464,'Brooks','dbrookscv@biblegateway.com','Feminino','Calçados','4/23/2008',77060,'Marketing Manager',3);
INSERT INTO FUNCIONARIOS VALUES (465,'White','dwhitecw@exblog.jp','Masculino','Computadores','10/17/2007',122540,'Administrative Officer',2);
INSERT INTO FUNCIONARIOS VALUES (466,'Carroll','fcarrollcx@ucoz.ru','Feminino','Games','5/29/2008',128562,'Senior Developer',7);
INSERT INTO FUNCIONARIOS VALUES (467,'Ford','efordcy@elpais.com','Feminino','Esporte','3/15/2002',60674,'Software Engineer I',3);

INSERT INTO FUNCIONARIOS VALUES (469,'Hicks','rhicksd0@histats.com','Feminino','Crianças','8/8/2010',97913,'Occupational Therapist',3);
INSERT INTO FUNCIONARIOS VALUES (470,'Rice','triced1@examiner.com','Feminino','Alimentícios','8/13/2005',108380,'Data Coordiator',5);
INSERT INTO FUNCIONARIOS VALUES (471,'Lewis','plewisd2@businessinsider.com','Feminino','Bebês','11/16/2007',50448,'Database Administrator III',4);
INSERT INTO FUNCIONARIOS VALUES (472,'Arnold','larnoldd3@webeden.co.uk','Feminino','Books','2/25/2012',133781,'Office Assistant I',4);
INSERT INTO FUNCIONARIOS VALUES (473,'Jordan','djordand4@trellian.com','Feminino','Books','11/14/2009',90409,'Research Assistant II',3);
INSERT INTO FUNCIONARIOS VALUES (474,'Reed','creedd5@bloglines.com','Masculino','Jardim','1/7/2004',144953,'Registered Nurse',7);
INSERT INTO FUNCIONARIOS VALUES (475,'Jenkins','sjenkinsd6@bloglovin.com','Masculino','Outdoors','12/22/2001',46072,'Nurse',2);
INSERT INTO FUNCIONARIOS VALUES (476,'Matthews','jmatthewsd7@economist.com','Masculino','Books','2/1/2012',119602,'Actuary',5);
INSERT INTO FUNCIONARIOS VALUES (477,'Gonzalez','lgonzalezd8@fastcompany.com','Masculino','Computadores','10/17/2010',122231,'Director of Sales',5);
INSERT INTO FUNCIONARIOS VALUES (478,'Mason','jmasond9@networkadvertising.org','Masculino','Esporte','4/16/2003',147166,'Systems Administrator I',6);
INSERT INTO FUNCIONARIOS VALUES (479,'Nelson','lnelsonda@example.com','Masculino','Alimentícios','9/8/2009',56465,'Programmer IV',6);
INSERT INTO FUNCIONARIOS VALUES (480,'Miller','amillerdb@reddit.com','Masculino','Eletronicos','2/7/2001',78158,'Programmer Analyst I',5);

INSERT INTO FUNCIONARIOS VALUES (482,'Harris','rharrisdd@paypal.com','Masculino','Brinquedos','6/10/2007',126468,'Budget/Accounting Analyst III',4);
INSERT INTO FUNCIONARIOS VALUES (483,'Brown','mbrownde@bizjournals.com','Feminino','Beleza','5/10/2012',79419,'Senior Developer',3);
INSERT INTO FUNCIONARIOS VALUES (484,'Little','glittledf@xrea.com','Masculino','Computadores','3/23/2009',83093,'Registered Nurse',1);
INSERT INTO FUNCIONARIOS VALUES (485,'Austin','caustindg@pen.io','Feminino','Crianças','11/3/2014',90797,'Help Desk Operator',1);
INSERT INTO FUNCIONARIOS VALUES (486,'Young','fyoungdh@npr.org','Feminino','Crianças','7/6/2008',78755,'Desktop Support Technician',5);
INSERT INTO FUNCIONARIOS VALUES (487,'Fox','hfoxdi@acquirethisname.com','Feminino','Crianças','4/18/2003',128726,'Business Systems Development Analyst',3);
INSERT INTO FUNCIONARIOS VALUES (488,'Brooks','ebrooksdj@berkeley.edu','Masculino','Música','12/15/2011',69026,'Nuclear Power Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (489,'Parker','lparkerdk@salon.com','Feminino','Jardim','1/16/2014',78109,'Research Nurse',5);
INSERT INTO FUNCIONARIOS VALUES (490,'Griffin','bgriffindl@pbs.org','Masculino','Filmes','4/8/2000',116480,'Nurse Practicioner',5);
INSERT INTO FUNCIONARIOS VALUES (491,'Stevens','bstevensdm@aol.com','Feminino','Brinquedos','6/13/2004',108444,'Environmental Tech',7);
INSERT INTO FUNCIONARIOS VALUES (492,'Evans','levansdn@house.gov','Masculino','Computadores','2/8/2010',106535,'funcionarios Scientist',1);
INSERT INTO FUNCIONARIOS VALUES (493,'Banks','bbanksdo@bravesites.com','Masculino','Computadores','6/24/2008',137025,'Research Nurse',5);
INSERT INTO FUNCIONARIOS VALUES (494,'Sullivan','ksullivandp@ucoz.com','Masculino','Industrial','3/3/2005',71663,'Analog Circuit Design manager',3);
INSERT INTO FUNCIONARIOS VALUES (495,'Black','eblackdq@ihg.com','Feminino','Books','10/8/2004',80073,'Senior Developer',3);
INSERT INTO FUNCIONARIOS VALUES (496,'Andrews','dandrewsdr@patch.com','Masculino','Beleza','3/14/2008',40254,'Quality Control Specialist',5);
INSERT INTO FUNCIONARIOS VALUES (497,'Jenkins','bjenkinsds@kickstarter.com','Feminino','Alimentícios','3/10/2011',80027,'VP Sales',3);
INSERT INTO FUNCIONARIOS VALUES (498,'Gutierrez','jgutierrezdt@woothemes.com','Feminino','Jardim','8/22/2001',106994,'Technical Writer',3);
INSERT INTO FUNCIONARIOS VALUES (499,'Hansen','jhansendu@timesonline.co.uk','Masculino','Brinquedos','4/29/2001',145559,'Office Assistant III',2);
INSERT INTO FUNCIONARIOS VALUES (500,'Rodriguez','drodriguezdv@histats.com','Masculino','Industrial','3/21/2001',91994,'Actuary',5);
INSERT INTO FUNCIONARIOS VALUES (501,'Bailey','hbaileydw@networksolutions.com','Masculino','Música','8/5/2001',138540,'Geologist IV',7);
INSERT INTO FUNCIONARIOS VALUES (502,'Banks','gbanksdx@berkeley.edu','Feminino','Computadores','10/17/2010',136034,'Product Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (503,'Rose','jrosedy@squarespace.com','Feminino','Bebês','1/19/2004',127291,'Accounting Assistant III',7);
INSERT INTO FUNCIONARIOS VALUES (504,'Weaver','mweaverdz@ft.com','Masculino','Industrial','3/19/2000',131283,'funcionarios Scientist',4);
INSERT INTO FUNCIONARIOS VALUES (505,'Walker','jwalkere0@oakley.com','Masculino','Computadores','6/20/2005',122108,'Analog Circuit Design manager',7);
INSERT INTO FUNCIONARIOS VALUES (506,'Cox','ncoxe1@1und1.de','Feminino','Lar','1/1/2008',49048,'Sales Associate',1);
INSERT INTO FUNCIONARIOS VALUES (507,'Reed','preede2@who.int','Feminino','Bebês','11/1/2012',97427,'Occupational Therapist',6);
INSERT INTO FUNCIONARIOS VALUES (508,'Marshall','dmarshalle3@about.me','Masculino','Computadores','5/14/2007',90960,'Software Test Engineer II',7);
INSERT INTO FUNCIONARIOS VALUES (509,'Gonzalez','rgonzaleze4@furl.net','Masculino','Saúde','12/30/2011',43986,'Geologist IV',3);
INSERT INTO FUNCIONARIOS VALUES (510,'Lawrence','rlawrencee5@hhs.gov','Masculino','Outdoors','11/21/2014',108748,'Senior Editor',4);
INSERT INTO FUNCIONARIOS VALUES (511,'Medina','tmedinae6@g.co','Feminino','Industrial','12/3/2006',102149,'Sales Representative',5);
INSERT INTO FUNCIONARIOS VALUES (512,'Carpenter','rcarpentere7@blog.com','Masculino','Outdoors','6/13/2008',133360,'Research Nurse',7);
INSERT INTO FUNCIONARIOS VALUES (513,'Carter','mcartere8@twitpic.com','Feminino','Jardim','7/9/2004',70814,'Account Representative I',4);
INSERT INTO FUNCIONARIOS VALUES (514,'Peters','gpeterse9@people.com.cn','Masculino','Alimentícios','12/18/2010',132037,'Web Developer IV',6);
INSERT INTO FUNCIONARIOS VALUES (515,'Gomez','kgomezea@bloglovin.com','Masculino','Roupas','5/1/2002',55747,'Human Resources Assistant I',1);
INSERT INTO FUNCIONARIOS VALUES (516,'Stanley','rstanleyeb@alibaba.com','Feminino','Brinquedos','6/9/2006',89324,'Systems Administrator IV',3);
INSERT INTO FUNCIONARIOS VALUES (517,'Carpenter','lcarpenterec@technorati.com','Masculino','Computadores','2/8/2011',124418,'Chief Design Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (518,'Peters','cpetersed@goo.ne.jp','Feminino','Alimentícios','12/25/2005',138093,'Human Resources Assistant I',3);
INSERT INTO FUNCIONARIOS VALUES (519,'Hamilton','chamiltonee@google.es','Masculino','Eletronicos','8/26/2003',141340,'Budget/Accounting Analyst III',4);
INSERT INTO FUNCIONARIOS VALUES (520,'Owens','sowensef@ted.com','Masculino','Industrial','6/2/2006',54672,'Structural Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (521,'Williamson','dwilliamsoneg@creativecommons.org','Masculino','Roupas','10/6/2003',118602,'Director of Sales',5);

INSERT INTO FUNCIONARIOS VALUES (523,'Johnston','ajohnstonei@php.net','Feminino','Saúde','6/10/2012',143855,'Internal Auditor',5);
INSERT INTO FUNCIONARIOS VALUES (524,'Edwards','pedwardsej@businessinsider.com','Feminino','Saúde','6/15/2009',43431,'Physical Therapy Assistant',6);
INSERT INTO FUNCIONARIOS VALUES (525,'Payne','tpayneek@newyorker.com','Feminino','Ferramentas','3/1/2002',94016,'VP Quality Control',2);
INSERT INTO FUNCIONARIOS VALUES (526,'Allen','lallenel@nyu.edu','Feminino','Bebês','9/9/2011',66847,'Assistant Media Planner',2);
INSERT INTO FUNCIONARIOS VALUES (527,'Richards','jrichardsem@1688.com','Masculino','Roupas','4/20/2005',69705,'Senior Developer',3);
INSERT INTO FUNCIONARIOS VALUES (528,'Cole','fcoleen@msn.com','Masculino','Esporte','2/8/2012',96739,'Product Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (529,'Meyer','lmeyereo@storify.com','Feminino','Jardim','9/1/2006',52956,'Senior Developer',3);
INSERT INTO FUNCIONARIOS VALUES (530,'Reyes','lreyesep@foxnews.com','Feminino','Computadores','12/14/2012',71559,'Librarian',1);
INSERT INTO FUNCIONARIOS VALUES (531,'Hudson','rhudsoneq@fotki.com','Masculino','Lar','11/17/2010',143226,'Food Chemist',7);
INSERT INTO FUNCIONARIOS VALUES (532,'Rice','rriceer@wired.com','Masculino','Books','2/14/2011',145747,'Financial Advisor',3);
INSERT INTO FUNCIONARIOS VALUES (533,'Castillo','dcastilloes@cocolog-nifty.com','Feminino','Industrial','10/15/2013',72001,'Automation Specialist IV',2);
INSERT INTO FUNCIONARIOS VALUES (534,'Harrison','jharrisonet@mapquest.com','Feminino','Música','9/20/2000',50308,'Compensation Analyst',6);
INSERT INTO FUNCIONARIOS VALUES (535,'Morris','rmorriseu@yahoo.com','Feminino','Lar','7/25/2007',131662,'Help Desk Operator',3);
INSERT INTO FUNCIONARIOS VALUES (536,'Castillo','acastilloev@cnet.com','Feminino','Crianças','5/19/2011',55730,'Speech Pathologist',7);
INSERT INTO FUNCIONARIOS VALUES (537,'Webb','rwebbew@twitter.com','Feminino','Games','2/12/2005',63836,'Occupational Therapist',1);
INSERT INTO FUNCIONARIOS VALUES (538,'Freeman','gfreemanex@nps.gov','Masculino','Calçados','10/24/2005',121296,'Civil Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (539,'Kelley','rkelleyey@feedburner.com','Masculino','Filmes','3/20/2012',110660,'Senior Financial Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (540,'Matthews','lmatthewsez@edublogs.org','Masculino','Games','12/19/2001',89114,'GIS Technical Architect',5);
INSERT INTO FUNCIONARIOS VALUES (541,'Mendoza','tmendozaf0@google.nl','Feminino','Música','8/28/2007',48769,'Nurse',5);
INSERT INTO FUNCIONARIOS VALUES (542,'Rice','ericef1@cpanel.net','Masculino','Música','2/1/2008',90069,'Assistant Professor',5);
INSERT INTO FUNCIONARIOS VALUES (543,'Walker','kwalkerf2@vinaora.com','Feminino','Lar','9/7/2013',120085,'Human Resources Assistant III',6);
INSERT INTO FUNCIONARIOS VALUES (544,'Moore','mmooref3@oakley.com','Feminino','Eletronicos','11/15/2007',41697,'Automation Specialist I',7);
INSERT INTO FUNCIONARIOS VALUES (545,'Lynch','jlynchf4@jimdo.com','Masculino','Crianças','5/4/2009',44093,'Saúde Coach IV',5);
INSERT INTO FUNCIONARIOS VALUES (546,'Fox','mfoxf5@jimdo.com','Feminino','Joalheria','11/1/2006',59294,'Senior Editor',6);
INSERT INTO FUNCIONARIOS VALUES (547,'Moreno','bmorenof6@vkontakte.ru','Masculino','Industrial','8/21/2013',140858,'Cost Accountant',7);
INSERT INTO FUNCIONARIOS VALUES (548,'Simpson','dsimpsonf7@engadget.com','Feminino','Brinquedos','1/10/2009',46444,'Desktop Support Technician',6);
INSERT INTO FUNCIONARIOS VALUES (549,'Reynolds','kreynoldsf8@vistaprint.com','Feminino','Books','9/26/2012',85855,'Financial Advisor',4);
INSERT INTO FUNCIONARIOS VALUES (550,'Watson','lwatsonf9@alexa.com','Masculino','Calçados','5/1/2000',72334,'Developer IV',3);
INSERT INTO FUNCIONARIOS VALUES (551,'Cruz','bcruzfa@nbcnews.com','Masculino','Música','10/4/2011',69246,'Web Developer III',6);
INSERT INTO FUNCIONARIOS VALUES (552,'Gomez','cgomezfb@reddit.com','Masculino','Beleza','3/18/2011',107389,'Community Outreach Specialist',2);
INSERT INTO FUNCIONARIOS VALUES (553,'George','rgeorgefc@youtube.com','Masculino','Automotivo','12/16/2009',141505,'Associate Professor',6);
INSERT INTO FUNCIONARIOS VALUES (554,'Frazier','mfrazierfd@tripod.com','Masculino','Brinquedos','1/6/2008',60318,'Engineer I',5);
INSERT INTO FUNCIONARIOS VALUES (555,'Bryant','cbryantfe@phpbb.com','Feminino','Outdoors','6/12/2014',148260,'Executive Secretary',7);
INSERT INTO FUNCIONARIOS VALUES (556,'Ferguson','mfergusonff@trellian.com','Feminino','Eletronicos','12/20/2006',73199,'Payment Adjustment Coordinator',2);
INSERT INTO FUNCIONARIOS VALUES (557,'Frazier','dfrazierfg@twitter.com','Masculino','Crianças','8/26/2002',111244,'Environmental Specialist',6);
INSERT INTO FUNCIONARIOS VALUES (558,'Hudson','jhudsonfh@soundcloud.com','Masculino','Bebês','3/21/2012',103845,'Nurse Practicioner',1);
INSERT INTO FUNCIONARIOS VALUES (559,'Murphy','jmurphyfi@naver.com','Feminino','Computadores','10/19/2008',88666,'Senior Editor',7);
INSERT INTO FUNCIONARIOS VALUES (560,'Kim','jkimfj@dropbox.com','Masculino','Roupas','1/22/2014',67845,'Administrative Officer',7);
INSERT INTO FUNCIONARIOS VALUES (561,'Rodriguez','jrodriguezfk@cafepress.com','Masculino','Esporte','4/8/2004',62527,'Recruiter',1);
INSERT INTO FUNCIONARIOS VALUES (562,'Perez','jperezfl@seesaa.net','Masculino','Ferramentas','5/17/2003',73412,'Librarian',5);
INSERT INTO FUNCIONARIOS VALUES (563,'Graham','bgrahamfm@usatoday.com','Masculino','Beleza','4/21/2011',123391,'Financial Advisor',7);
INSERT INTO FUNCIONARIOS VALUES (564,'Martinez','amartinezfn@people.com.cn','Feminino','Saúde','2/23/2005',99508,'VP Quality Control',5);
INSERT INTO FUNCIONARIOS VALUES (565,'Pierce','jpiercefo@cnet.com','Feminino','Joalheria','4/17/2014',55726,'Geologist III',7);
INSERT INTO FUNCIONARIOS VALUES (566,'Lynch','mlynchfp@reverbnation.com','Masculino','Eletronicos','12/10/2011',67140,'Systems Administrator III',3);
INSERT INTO FUNCIONARIOS VALUES (567,'Myers','dmyersfq@amazon.com','Feminino','Lar','5/27/2010',139060,'Assistant Professor',7);
INSERT INTO FUNCIONARIOS VALUES (568,'Day','kdayfr@wix.com','Masculino','Lar','7/20/2004',135993,'Geologist IV',4);
INSERT INTO FUNCIONARIOS VALUES (569,'Little','jlittlefs@bravesites.com','Feminino','Books','11/12/2010',80788,'Programmer I',4);
INSERT INTO FUNCIONARIOS VALUES (570,'James','rjamesft@jiathis.com','Feminino','Roupas','3/21/2001',136377,'Software Engineer I',7);
INSERT INTO FUNCIONARIOS VALUES (571,'Ortiz','eortizfu@java.com','Feminino','Eletronicos','6/19/2009',46247,'VP Accounting',3);
INSERT INTO FUNCIONARIOS VALUES (572,'Duncan','jduncanfv@etsy.com','Masculino','Automotivo','3/17/2014',45774,'Electrical Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (573,'Kennedy','jkennedyfw@nasa.gov','Feminino','Esporte','4/23/2010',100741,'Senior Cost Accountant',1);
INSERT INTO FUNCIONARIOS VALUES (574,'Pierce','dpiercefx@marketwatch.com','Masculino','Alimentícios','9/20/2005',45534,'Senior Sales Associate',1);
INSERT INTO FUNCIONARIOS VALUES (575,'Bowman','abowmanfy@devhub.com','Masculino','Games','4/26/2002',75399,'VP Quality Control',7);
INSERT INTO FUNCIONARIOS VALUES (576,'Taylor','staylorfz@issuu.com','Masculino','Roupas','7/13/2006',50235,'Assistant Media Planner',1);
INSERT INTO FUNCIONARIOS VALUES (577,'Jones','jjonesg0@g.co','Masculino','Bebês','1/27/2011',128048,'Programmer III',5);
INSERT INTO FUNCIONARIOS VALUES (578,'Lynch','hlynchg1@washingtonpost.com','Masculino','Roupas','5/2/2006',111318,'Technical Writer',3);
INSERT INTO FUNCIONARIOS VALUES (579,'Barnes','jbarnesg2@hubpages.com','Feminino','Jardim','12/23/2000',100763,'Database Administrator I',7);
INSERT INTO FUNCIONARIOS VALUES (580,'Weaver','kweaverg3@wikia.com','Masculino','Computadores','5/23/2012',54231,'Accounting Assistant II',3);
INSERT INTO FUNCIONARIOS VALUES (581,'Cunningham','pcunninghamg4@example.com','Feminino','Esporte','3/25/2010',92334,'GIS Technical Architect',3);

INSERT INTO FUNCIONARIOS VALUES (583,'Hunter','ehunterg6@ucsd.edu','Feminino','Calçados','12/12/2000',112048,'Software Engineer II',5);
INSERT INTO FUNCIONARIOS VALUES (584,'Cook','ccookg7@blog.com','Feminino','Música','5/13/2008',109404,'Chief Design Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (585,'Lopez','nlopezg8@fema.gov','Masculino','Jardim','7/19/2007',138776,'Senior Editor',2);
INSERT INTO FUNCIONARIOS VALUES (586,'Olson','folsong9@acquirethisname.com','Feminino','Lar','7/1/2003',110411,'Compensation Analyst',3);
INSERT INTO FUNCIONARIOS VALUES (587,'Martin','pmartinga@webnode.com','Feminino','Brinquedos','9/7/2002',74973,'General Manager',7);
INSERT INTO FUNCIONARIOS VALUES (588,'Day','edaygb@google.nl','Feminino','Ferramentas','10/15/2002',129890,'Software Consultant',4);
INSERT INTO FUNCIONARIOS VALUES (589,'Arnold','sarnoldgc@parallels.com','Masculino','Filmes','1/27/2005',135786,'Account Representative I',7);
INSERT INTO FUNCIONARIOS VALUES (590,'Allen','rallengd@cnet.com','Feminino','Alimentícios','6/15/2007',132998,'Business Systems Development Analyst',3);
INSERT INTO FUNCIONARIOS VALUES (591,'Sims','wsimsge@vinaora.com','Feminino','Bebês','2/28/2014',84318,'Software Test Engineer I',2);
INSERT INTO FUNCIONARIOS VALUES (592,'Duncan','aduncangf@behance.net','Masculino','Calçados','4/11/2004',110407,'Sales Associate',5);
INSERT INTO FUNCIONARIOS VALUES (593,'Evans','aevansgg@wordpress.org','Feminino','Lar','6/15/2000',94980,'Financial Advisor',4);
INSERT INTO FUNCIONARIOS VALUES (594,'Chapman','schapmangh@arstechnica.com','Feminino','Industrial','3/7/2004',125843,'Web Designer II',4);
INSERT INTO FUNCIONARIOS VALUES (595,'Price','rpricegi@flavors.me','Feminino','Alimentícios','1/27/2000',66180,'funcionarios Scientist',5);
INSERT INTO FUNCIONARIOS VALUES (596,'Ford','jfordgj@nyu.edu','Feminino','Joalheria','11/27/2014',88854,'Account Representative I',4);
INSERT INTO FUNCIONARIOS VALUES (597,'Lynch','alynchgk@tumblr.com','Feminino','Beleza','2/10/2004',71448,'Electrical Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (598,'Diaz','jdiazgl@hhs.gov','Feminino','Esporte','11/2/2002',60547,'Community Outreach Specialist',2);
INSERT INTO FUNCIONARIOS VALUES (599,'Watkins','rwatkinsgm@independent.co.uk','Feminino','Outdoors','11/21/2010',128805,'Occupational Therapist',5);
INSERT INTO FUNCIONARIOS VALUES (600,'Ruiz','sruizgn@reddit.com','Feminino','Outdoors','5/11/2006',96782,'Database Administrator II',5);
INSERT INTO FUNCIONARIOS VALUES (601,'Lopez','blopezgo@sourceforge.net','Masculino','Saúde','3/12/2001',125944,'Office Assistant II',2);
INSERT INTO FUNCIONARIOS VALUES (602,'Henderson','chendersongp@sina.com.cn','Masculino','Ferramentas','9/17/2011',101937,'Teacher',7);
INSERT INTO FUNCIONARIOS VALUES (603,'Webb','lwebbgq@last.fm','Masculino','Joalheria','12/6/2000',127569,'Analyst Programmer',7);
INSERT INTO FUNCIONARIOS VALUES (604,'Greene','agreenegr@cmu.edu','Masculino','Roupas','6/30/2004',104517,'Research Assistant III',2);
INSERT INTO FUNCIONARIOS VALUES (605,'Stephens','estephensgs@phoca.cz','Feminino','Alimentícios','12/11/2010',110366,'Research Nurse',6);
INSERT INTO FUNCIONARIOS VALUES (606,'Parker','rparkergt@1688.com','Feminino','Industrial','2/8/2003',136917,'Assistant Professor',4);
INSERT INTO FUNCIONARIOS VALUES (607,'Reyes','hreyesgu@gnu.org','Masculino','Esporte','7/21/2007',130563,'Nuclear Power Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (608,'Garza','hgarzagv@webmd.com','Masculino','Saúde','11/13/2004',73553,'Accountant IV',6);
INSERT INTO FUNCIONARIOS VALUES (609,'Fisher','dfishergw@myspace.com','Masculino','Eletronicos','1/21/2007',93995,'Teacher',2);
INSERT INTO FUNCIONARIOS VALUES (610,'Hicks','hhicksgx@ifeng.com','Masculino','Saúde','8/23/2009',45270,'VP Marketing',7);
INSERT INTO FUNCIONARIOS VALUES (611,'Ford','jfordgy@earthlink.net','Feminino','Calçados','10/29/2009',147739,'Safety Technician I',5);
INSERT INTO FUNCIONARIOS VALUES (612,'Fowler','cfowlergz@joomla.org','Feminino','Saúde','9/10/2003',142211,'Software Test Engineer IV',4);
INSERT INTO FUNCIONARIOS VALUES (613,'Coleman','hcolemanh0@feedburner.com','Feminino','Beleza','9/26/2006',48791,'Teacher',1);
INSERT INTO FUNCIONARIOS VALUES (614,'Ramirez','jramirezh1@php.net','Feminino','Eletronicos','11/2/2008',112929,'Account Coordinator',5);
INSERT INTO FUNCIONARIOS VALUES (615,'Alexander','falexanderh2@irs.gov','Feminino','Roupas','12/25/2009',72854,'Marketing Assistant',7);
INSERT INTO FUNCIONARIOS VALUES (616,'Marshall','hmarshallh3@com.com','Feminino','Automotivo','10/10/2006',47281,'VP Sales',6);
INSERT INTO FUNCIONARIOS VALUES (617,'Mills','hmillsh4@lulu.com','Feminino','Saúde','6/12/2013',49410,'Account Representative II',1);
INSERT INTO FUNCIONARIOS VALUES (618,'Phillips','wphillipsh5@economist.com','Masculino','Roupas','6/7/2001',128205,'Sales Representative',6);
INSERT INTO FUNCIONARIOS VALUES (619,'Cole','jcoleh6@php.net','Masculino','Ferramentas','6/2/2014',133190,'Research Nurse',7);
INSERT INTO FUNCIONARIOS VALUES (620,'Olson','aolsonh7@psu.edu','Feminino','Books','8/14/2009',59644,'Systems Administrator III',1);
INSERT INTO FUNCIONARIOS VALUES (621,'Reynolds','nreynoldsh8@redcross.org','Masculino','Crianças','10/31/2004',111427,'Programmer I',4);
INSERT INTO FUNCIONARIOS VALUES (622,'Wright','rwrighth9@jimdo.com','Masculino','Eletronicos','3/15/2002',98339,'Assistant Manager',3);
INSERT INTO FUNCIONARIOS VALUES (623,'Ford','mfordha@youku.com','Masculino','Beleza','2/27/2006',72948,'Teacher',6);
INSERT INTO FUNCIONARIOS VALUES (624,'Garza','mgarzahb@elegantthemes.com','Masculino','Books','11/26/2008',60203,'Product Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (625,'Andrews','handrewshc@salon.com','Feminino','Outdoors','12/2/2007',147003,'Chemical Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (626,'Ruiz','sruizhd@slashdot.org','Feminino','Jardim','1/12/2009',83706,'Assistant Media Planner',2);
INSERT INTO FUNCIONARIOS VALUES (627,'Watkins','swatkinshe@wunderground.com','Feminino','Alimentícios','1/21/2000',80245,'VP Product Management',6);

INSERT INTO FUNCIONARIOS VALUES (630,'Pierce','spiercehh@google.nl','Masculino','Outdoors','2/9/2002',96107,'Actuary',5);
INSERT INTO FUNCIONARIOS VALUES (631,'Perez','wperezhi@yahoo.co.jp','Feminino','Ferramentas','6/14/2014',44788,'Project Manager',2);
INSERT INTO FUNCIONARIOS VALUES (632,'Lopez','clopezhj@mediafire.com','Feminino','Jardim','1/1/2004',86207,'Accountant II',4);
INSERT INTO FUNCIONARIOS VALUES (633,'Freeman','mfreemanhk@walmart.com','Masculino','Calçados','10/25/2000',79845,'Teacher',1);
INSERT INTO FUNCIONARIOS VALUES (634,'Fowler','wfowlerhl@people.com.cn','Feminino','Outdoors','4/6/2011',104264,'funcionarios Scientist',6);
INSERT INTO FUNCIONARIOS VALUES (635,'Rodriguez','mrodriguezhm@wiley.com','Feminino','Ferramentas','12/27/2010',77005,'Systems Administrator IV',1);
INSERT INTO FUNCIONARIOS VALUES (636,'Wheeler','lwheelerhn@skyrock.com','Feminino','Industrial','9/25/2011',69564,'Senior Editor',6);
INSERT INTO FUNCIONARIOS VALUES (637,'Knight','dknightho@buzzfeed.com','Feminino','Calçados','7/25/2007',84549,'Senior Cost Accountant',5);
INSERT INTO FUNCIONARIOS VALUES (638,'Walker','bwalkerhp@dropbox.com','Masculino','Games','6/9/2006',134488,'Software Consultant',1);
INSERT INTO FUNCIONARIOS VALUES (639,'Porter','eporterhq@amazon.com','Masculino','Calçados','2/13/2007',140243,'Financial Advisor',5);
INSERT INTO FUNCIONARIOS VALUES (640,'Washington','hwashingtonhr@bbc.co.uk','Masculino','Joalheria','2/22/2003',44096,'Geologist IV',4);
INSERT INTO FUNCIONARIOS VALUES (641,'Hayes','rhayeshs@loc.gov','Feminino','Saúde','4/7/2010',69454,'Web Designer II',1);
INSERT INTO FUNCIONARIOS VALUES (642,'Warren','awarrenht@addthis.com','Feminino','Filmes','5/15/2009',126201,'Electrical Engineer',2);

INSERT INTO FUNCIONARIOS VALUES (644,'Carroll','jcarrollhv@over-blog.com','Masculino','Alimentícios','4/6/2002',52956,'Compensation Analyst',7);
INSERT INTO FUNCIONARIOS VALUES (645,'Webb','twebbhw@google.com.br','Masculino','Ferramentas','6/1/2007',143595,'Geological Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (646,'Harvey','lharveyhx@plala.or.jp','Masculino','Beleza','8/14/2014',124707,'Registered Nurse',6);
INSERT INTO FUNCIONARIOS VALUES (647,'Washington','mwashingtonhy@icio.us','Masculino','Eletronicos','10/15/2009',57092,'Internal Auditor',2);
INSERT INTO FUNCIONARIOS VALUES (648,'Long','rlonghz@list-manage.com','Masculino','Beleza','2/12/2007',149099,'Executive Secretary',3);
INSERT INTO FUNCIONARIOS VALUES (649,'Russell','krusselli0@posterous.com','Masculino','Calçados','11/18/2007',99352,'Recruiting Manager',1);
INSERT INTO FUNCIONARIOS VALUES (650,'Frazier','rfrazieri1@github.com','Masculino','Alimentícios','1/22/2013',44919,'Quality Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (651,'Freeman','tfreemani2@soundcloud.com','Feminino','Saúde','8/28/2006',55034,'Administrative Officer',4);
INSERT INTO FUNCIONARIOS VALUES (652,'Rivera','criverai3@github.io','Masculino','Joalheria','6/16/2006',60396,'Senior Quality Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (653,'Ramirez','vramirezi4@yellowpages.com','Masculino','Brinquedos','7/6/2013',147862,'Chemical Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (654,'Mcdonald','hmcdonaldi5@4shared.com','Masculino','Automotivo','11/3/2002',69594,'Recruiting Manager',3);
INSERT INTO FUNCIONARIOS VALUES (655,'Meyer','emeyeri6@friendfeed.com','Feminino','Esporte','6/8/2014',145363,'GIS Technical Architect',3);
INSERT INTO FUNCIONARIOS VALUES (656,'Campbell','kcampbelli7@prnewswire.com','Masculino','Books','4/3/2008',70804,'Quality Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (657,'Reid','areidi8@wunderground.com','Feminino','Roupas','6/29/2013',65154,'Sales Representative',5);
INSERT INTO FUNCIONARIOS VALUES (658,'Gilbert','agilberti9@parallels.com','Masculino','Eletronicos','10/8/2013',61332,'Marketing Assistant',3);
INSERT INTO FUNCIONARIOS VALUES (659,'Ramos','kramosia@ed.gov','Feminino','Outdoors','9/7/2003',72319,'Quality Control Specialist',1);
INSERT INTO FUNCIONARIOS VALUES (660,'Nelson','mnelsonib@ibm.com','Masculino','Calçados','12/8/2001',139564,'Pharmacist',7);
INSERT INTO FUNCIONARIOS VALUES (661,'Foster','pfosteric@smugmug.com','Feminino','Automotivo','9/21/2004',63364,'Community Outreach Specialist',4);
INSERT INTO FUNCIONARIOS VALUES (662,'Scott','bscottid@mashable.com','Masculino','Bebês','1/18/2000',86497,'Administrative Officer',6);
INSERT INTO FUNCIONARIOS VALUES (663,'Lynch','tlynchie@bloglovin.com','Feminino','Outdoors','1/25/2003',117248,'funcionarios Accountant III',1);
INSERT INTO FUNCIONARIOS VALUES (664,'Watkins','ewatkinsif@ask.com','Feminino','Esporte','2/9/2013',133507,'Budget/Accounting Analyst II',1);
INSERT INTO FUNCIONARIOS VALUES (665,'Garcia','pgarciaig@macromedia.com','Feminino','Saúde','11/4/2008',135132,'Research Assistant III',7);
INSERT INTO FUNCIONARIOS VALUES (666,'Arnold','jarnoldih@tripod.com','Feminino','Calçados','4/22/2013',52041,'Database Administrator I',2);
INSERT INTO FUNCIONARIOS VALUES (667,'Willis','nwillisii@sohu.com','Feminino','Música','3/12/2012',73425,'Human Resources Manager',3);
INSERT INTO FUNCIONARIOS VALUES (668,'Burton','jburtonij@webmd.com','Feminino','Computadores','3/17/2001',46960,'Financial Advisor',4);
INSERT INTO FUNCIONARIOS VALUES (669,'Owens','sowensik@prlog.org','Masculino','Brinquedos','5/6/2001',104373,'Graphic Designer',6);
INSERT INTO FUNCIONARIOS VALUES (670,'Moreno','rmorenoil@gizmodo.com','Feminino','Calçados','9/17/2014',102493,'Senior Quality Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (671,'Fuller','jfullerim@theguardian.com','Masculino','Calçados','12/11/2007',55568,'Senior Cost Accountant',7);
INSERT INTO FUNCIONARIOS VALUES (672,'Fowler','cfowlerin@yelp.com','Masculino','Esporte','5/5/2006',75159,'Biostatistician III',2);
INSERT INTO FUNCIONARIOS VALUES (673,'Thomas','lthomasio@pagesperso-orange.fr','Masculino','Saúde','10/27/2014',51782,'Operator',6);
INSERT INTO FUNCIONARIOS VALUES (674,'Adams','jadamsip@cisco.com','Masculino','Brinquedos','8/28/2009',41855,'Payment Adjustment Coordinator',7);
INSERT INTO FUNCIONARIOS VALUES (675,'Snyder','ssnyderiq@vkontakte.ru','Masculino','Games','6/22/2005',143846,'Web Developer III',3);
INSERT INTO FUNCIONARIOS VALUES (676,'Sullivan','rsullivanir@xinhuanet.com','Masculino','Música','9/29/2013',101756,'Programmer IV',5);
INSERT INTO FUNCIONARIOS VALUES (677,'Robertson','lrobertsonis@forbes.com','Masculino','Computadores','8/4/2014',136492,'Compensation Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (678,'Mills','jmillsit@webs.com','Masculino','Música','4/17/2011',82979,'Senior Quality Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (679,'Stone','pstoneiu@narod.ru','Masculino','Eletronicos','5/15/2014',40218,'Paralegal',2);
INSERT INTO FUNCIONARIOS VALUES (680,'Simmons','gsimmonsiv@cocolog-nifty.com','Feminino','Games','12/9/2001',60695,'Chemical Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (681,'Butler','dbutleriw@discuz.net','Masculino','Lar','11/30/2008',47994,'Senior Quality Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (682,'Scott','kscottix@ycombinator.com','Masculino','Jardim','9/3/2004',50057,'Account Executive',2);
INSERT INTO FUNCIONARIOS VALUES (683,'Torres','jtorresiy@4shared.com','Feminino','Games','3/11/2006',135886,'Assistant Media Planner',3);
INSERT INTO FUNCIONARIOS VALUES (684,'Hall','lhalliz@smh.com.au','Masculino','Joalheria','7/15/2009',77924,'Senior Sales Associate',7);
INSERT INTO FUNCIONARIOS VALUES (685,'White','jwhitej0@usnews.com','Feminino','Beleza','12/7/2008',136356,'Office Assistant IV',1);
INSERT INTO FUNCIONARIOS VALUES (686,'Watkins','mwatkinsj1@myspace.com','Masculino','Brinquedos','3/24/2004',104444,'Business Systems Development Analyst',2);
INSERT INTO FUNCIONARIOS VALUES (687,'Gardner','agardnerj2@blogs.com','Feminino','Computadores','12/3/2000',49693,'Chemical Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (688,'Cruz','kcruzj3@shinystat.com','Masculino','Lar','6/29/2012',90829,'Recruiter',6);
INSERT INTO FUNCIONARIOS VALUES (689,'Austin','aaustinj4@walmart.com','Feminino','Eletronicos','10/31/2007',62293,'Administrative Officer',4);
INSERT INTO FUNCIONARIOS VALUES (690,'Perkins','rperkinsj5@ehow.com','Masculino','Música','5/9/2000',57988,'Web Developer I',4);
INSERT INTO FUNCIONARIOS VALUES (691,'Hansen','chansenj6@uiuc.edu','Feminino','Beleza','2/4/2010',113893,'Clinical Specialist',7);
INSERT INTO FUNCIONARIOS VALUES (692,'Owens','dowensj7@hibu.com','Masculino','Calçados','3/11/2013',58265,'Nurse Practicioner',3);
INSERT INTO FUNCIONARIOS VALUES (693,'Carr','hcarrj8@latimes.com','Masculino','Jardim','1/17/2005',143570,'Actuary',4);
INSERT INTO FUNCIONARIOS VALUES (694,'Chavez','rchavezj9@uiuc.edu','Feminino','Alimentícios','4/19/2007',116894,'Chief Design Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (695,'Morales','rmoralesja@vinaora.com','Feminino','Automotivo','1/24/2006',82244,'Administrative Assistant III',2);
INSERT INTO FUNCIONARIOS VALUES (696,'Anderson','dandersonjb@linkedin.com','Masculino','Games','10/7/2012',92640,'Executive Secretary',7);
INSERT INTO FUNCIONARIOS VALUES (697,'Woods','twoodsjc@ucoz.ru','Masculino','Beleza','6/23/2000',123995,'Assistant Media Planner',5);
INSERT INTO FUNCIONARIOS VALUES (698,'Cook','tcookjd@blinklist.com','Masculino','Jardim','12/12/2005',97351,'Saúde Coach I',4);
INSERT INTO FUNCIONARIOS VALUES (699,'Price','bpriceje@icio.us','Feminino','Roupas','1/25/2003',133091,'VP Accounting',7);
INSERT INTO FUNCIONARIOS VALUES (700,'Stone','tstonejf@com.com','Masculino','Jardim','7/15/2004',100746,'VP Quality Control',6);
INSERT INTO FUNCIONARIOS VALUES (701,'Williams','jwilliamsjg@rediff.com','Masculino','Joalheria','10/13/2002',101599,'Developer II',7);
INSERT INTO FUNCIONARIOS VALUES (702,'Wells','dwellsjh@is.gd','Masculino','Esporte','6/2/2014',77293,'Structural Analysis Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (703,'Hernandez','ahernandezji@ucoz.ru','Feminino','Games','3/4/2014',119787,'Speech Pathologist',1);
INSERT INTO FUNCIONARIOS VALUES (704,'Burke','eburkejj@godaddy.com','Masculino','Computadores','6/12/2013',114690,'funcionarios Scientist',2);
INSERT INTO FUNCIONARIOS VALUES (705,'Clark','pclarkjk@joomla.org','Masculino','Filmes','10/25/2009',97150,'VP Accounting',6);
INSERT INTO FUNCIONARIOS VALUES (706,'Mendoza','rmendozajl@g.co','Feminino','Lar','12/5/2011',91655,'Cost Accountant',5);
INSERT INTO FUNCIONARIOS VALUES (707,'Perry','jperryjm@Lar.pl','Masculino','Industrial','11/8/2006',124296,'Developer III',1);
INSERT INTO FUNCIONARIOS VALUES (708,'Rose','crosejn@cnbc.com','Feminino','Automotivo','12/24/2011',66063,'Software Test Engineer I',7);
INSERT INTO FUNCIONARIOS VALUES (709,'Payne','cpaynejo@tinyurl.com','Feminino','Books','1/12/2007',138137,'Developer IV',2);
INSERT INTO FUNCIONARIOS VALUES (710,'Mills','jmillsjp@yahoo.com','Feminino','Música','1/22/2005',49326,'Chemical Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (711,'Roberts','jrobertsjq@ed.gov','Masculino','Roupas','8/21/2009',80743,'Geological Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (712,'Torres','dtorresjr@state.tx.us','Masculino','Joalheria','12/23/2007',105686,'Senior Developer',6);
INSERT INTO FUNCIONARIOS VALUES (713,'Hicks','ahicksjs@arstechnica.com','Feminino','Esporte','12/23/2013',65650,'Project Manager',1);
INSERT INTO FUNCIONARIOS VALUES (714,'Cooper','kcooperjt@salon.com','Masculino','Games','9/26/2003',86446,'Statistician II',4);
INSERT INTO FUNCIONARIOS VALUES (715,'Henry','rhenryju@answers.com','Feminino','Games','6/26/2010',132421,'Human Resources Manager',1);
INSERT INTO FUNCIONARIOS VALUES (716,'Jacobs','bjacobsjv@thetimes.co.uk','Masculino','Eletronicos','6/18/2004',69855,'Payment Adjustment Coordinator',4);
INSERT INTO FUNCIONARIOS VALUES (717,'Greene','rgreenejw@so-net.ne.jp','Feminino','Outdoors','7/8/2007',80999,'funcionarios Accountant II',6);
INSERT INTO FUNCIONARIOS VALUES (718,'Armstrong','darmstrongjx@cafepress.com','Masculino','Saúde','1/3/2003',66447,'Account Coordinator',2);
INSERT INTO FUNCIONARIOS VALUES (719,'Wagner','ewagnerjy@jalbum.net','Masculino','Beleza','1/4/2013',135445,'Operator',2);
INSERT INTO FUNCIONARIOS VALUES (720,'Rice','hricejz@blinklist.com','Feminino','Joalheria','11/8/2010',57781,'Dental Hygienist',4);
INSERT INTO FUNCIONARIOS VALUES (721,'Smith','hsmithk0@4shared.com','Feminino','Saúde','9/21/2005',83802,'Research Assistant II',7);
INSERT INTO FUNCIONARIOS VALUES (722,'Hill','khillk1@about.me','Feminino','Roupas','8/31/2002',73262,'Information Systems Manager',5);
INSERT INTO FUNCIONARIOS VALUES (723,'Howard','rhowardk2@cnet.com','Feminino','Bebês','3/3/2002',89035,'Senior Editor',5);
INSERT INTO FUNCIONARIOS VALUES (724,'Elliott','delliottk3@who.int','Masculino','Industrial','5/20/2001',125115,'Senior Quality Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (725,'Richards','krichardsk4@bloglines.com','Masculino','Bebês','10/2/2003',80939,'Analyst Programmer',1);
INSERT INTO FUNCIONARIOS VALUES (726,'Welch','dwelchk5@mapquest.com','Masculino','Lar','9/11/2008',49463,'Research Nurse',1);
INSERT INTO FUNCIONARIOS VALUES (727,'Johnson','mjohnsonk6@sciencedaily.com','Masculino','Filmes','5/21/2012',83165,'Account Representative I',5);
INSERT INTO FUNCIONARIOS VALUES (728,'Larson','slarsonk7@sakura.ne.jp','Feminino','Outdoors','4/21/2006',125574,'Research Associate',1);
INSERT INTO FUNCIONARIOS VALUES (729,'Banks','hbanksk8@nifty.com','Masculino','Joalheria','11/15/2013',119747,'Graphic Designer',5);
INSERT INTO FUNCIONARIOS VALUES (730,'Johnston','ejohnstonk9@liveinternet.ru','Feminino','Esporte','11/24/2008',57651,'Help Desk Operator',6);
INSERT INTO FUNCIONARIOS VALUES (731,'Ferguson','gfergusonka@geocities.jp','Feminino','Lar','6/28/2009',70524,'VP Accounting',2);
INSERT INTO FUNCIONARIOS VALUES (732,'Murray','amurraykb@blinklist.com','Masculino','Roupas','8/15/2004',50511,'Senior Cost Accountant',3);
INSERT INTO FUNCIONARIOS VALUES (733,'Diaz','jdiazkc@china.com.cn','Masculino','Lar','11/20/2000',58847,'Community Outreach Specialist',4);
INSERT INTO FUNCIONARIOS VALUES (734,'Simmons','tsimmonskd@chicagotribune.com','Feminino','Automotivo','2/20/2005',58555,'Biostatistician I',2);
INSERT INTO FUNCIONARIOS VALUES (735,'Richards','jrichardske@hatena.ne.jp','Masculino','Roupas','11/14/2014',116333,'Legal Assistant',5);
INSERT INTO FUNCIONARIOS VALUES (736,'Morgan','emorgankf@businessinsider.com','Masculino','Bebês','8/27/2009',80813,'Senior Quality Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (737,'Price','bpricekg@xinhuanet.com','Masculino','Saúde','7/26/2004',142794,'Recruiting Manager',1);
INSERT INTO FUNCIONARIOS VALUES (738,'Hudson','chudsonkh@google.co.uk','Feminino','Computadores','1/4/2003',65083,'Marketing Assistant',6);
INSERT INTO FUNCIONARIOS VALUES (739,'Carroll','lcarrollki@example.com','Feminino','Bebês','3/13/2014',125398,'Assistant Professor',2);
INSERT INTO FUNCIONARIOS VALUES (740,'Long','jlongkj@dailymail.co.uk','Feminino','Crianças','1/13/2008',98502,'Structural Analysis Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (741,'Parker','cparkerkk@foxnews.com','Feminino','Calçados','12/31/2002',90086,'Research Associate',4);
INSERT INTO FUNCIONARIOS VALUES (742,'Nguyen','lnguyenkl@goodreads.com','Masculino','Esporte','12/3/2007',77382,'Design Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (743,'Garza','agarzakm@miitbeian.gov.cn','Feminino','Eletronicos','12/23/2014',113278,'Statistician IV',2);
INSERT INTO FUNCIONARIOS VALUES (744,'Gordon','pgordonkn@mac.com','Masculino','Automotivo','9/18/2001',129324,'Developer I',4);
INSERT INTO FUNCIONARIOS VALUES (745,'Reed','lreedko@wikipedia.org','Feminino','Outdoors','11/21/2005',108504,'Pharmacist',1);
INSERT INTO FUNCIONARIOS VALUES (746,'Baker','bbakerkp@list-manage.com','Masculino','Industrial','10/4/2001',145283,'Payment Adjustment Coordinator',1);
INSERT INTO FUNCIONARIOS VALUES (747,'Carroll','mcarrollkq@whitehouse.gov','Masculino','Crianças','7/30/2006',82674,'Junior Executive',4);
INSERT INTO FUNCIONARIOS VALUES (748,'Elliott','delliottkr@dot.gov','Masculino','Roupas','12/9/2009',119097,'Administrative Assistant I',2);
INSERT INTO FUNCIONARIOS VALUES (749,'Parker','aparkerks@godaddy.com','Feminino','Joalheria','9/5/2012',60498,'Accountant I',4);
INSERT INTO FUNCIONARIOS VALUES (750,'Ward','kwardkt@wikipedia.org','Masculino','Música','7/16/2014',108228,'VP Sales',3);
INSERT INTO FUNCIONARIOS VALUES (751,'Kelley','ckelleyku@gravatar.com','Masculino','Eletronicos','5/7/2005',106602,'Occupational Therapist',2);
INSERT INTO FUNCIONARIOS VALUES (752,'Gonzales','rgonzaleskv@meetup.com','Feminino','Lar','1/24/2011',95810,'Food Chemist',4);
INSERT INTO FUNCIONARIOS VALUES (753,'King','bkingkw@friendfeed.com','Feminino','Eletronicos','2/5/2005',149597,'Structural Analysis Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (754,'Mendoza','smendozakx@java.com','Feminino','Eletronicos','3/17/2000',57331,'Occupational Therapist',3);
INSERT INTO FUNCIONARIOS VALUES (755,'Tucker','ctuckerky@1688.com','Masculino','Industrial','8/17/2011',49113,'Business Systems Development Analyst',7);
INSERT INTO FUNCIONARIOS VALUES (756,'Fox','dfoxkz@foxnews.com','Feminino','Alimentícios','7/17/2005',80417,'Assistant Media Planner',7);
INSERT INTO FUNCIONARIOS VALUES (757,'Evans','aevansl0@nba.com','Masculino','Games','4/5/2012',122595,'Automation Specialist I',6);
INSERT INTO FUNCIONARIOS VALUES (758,'Ray','nrayl1@mail.ru','Masculino','Brinquedos','10/23/2013',126661,'Systems Administrator I',2);
INSERT INTO FUNCIONARIOS VALUES (759,'Vasquez','jvasquezl2@edublogs.org','Masculino','Jardim','4/2/2000',127695,'Systems Administrator I',7);
INSERT INTO FUNCIONARIOS VALUES (760,'Bell','sbelll3@goo.gl','Masculino','Bebês','7/24/2008',66608,'General Manager',1);
INSERT INTO FUNCIONARIOS VALUES (761,'Burke','eburkel4@newsvine.com','Feminino','Lar','12/14/2014',106033,'Quality Control Specialist',1);
INSERT INTO FUNCIONARIOS VALUES (762,'Stanley','cstanleyl5@springer.com','Masculino','Eletronicos','8/9/2013',103237,'Account Executive',7);
INSERT INTO FUNCIONARIOS VALUES (763,'Bell','dbelll6@wisc.edu','Masculino','Computadores','4/22/2002',122843,'Accountant IV',2);
INSERT INTO FUNCIONARIOS VALUES (764,'Jacobs','mjacobsl7@ibm.com','Feminino','Música','7/6/2004',51771,'Accountant III',3);
INSERT INTO FUNCIONARIOS VALUES (765,'Williams','dwilliamsl8@google.com.br','Masculino','Ferramentas','11/7/2009',107709,'Nuclear Power Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (766,'Elliott','kelliottl9@hhs.gov','Masculino','Books','12/18/2009',104149,'Food Chemist',2);
INSERT INTO FUNCIONARIOS VALUES (767,'Hall','jhallla@hao123.com','Masculino','Books','8/2/2004',91501,'Editor',7);
INSERT INTO FUNCIONARIOS VALUES (768,'Meyer','jmeyerlb@yandex.ru','Feminino','Automotivo','7/24/2014',42602,'Programmer IV',2);
INSERT INTO FUNCIONARIOS VALUES (769,'Kelly','jkellylc@linkedin.com','Feminino','Crianças','11/24/2013',132676,'Dental Hygienist',4);
INSERT INTO FUNCIONARIOS VALUES (770,'Burton','jburtonld@delicious.com','Feminino','Games','5/4/2006',140688,'Programmer Analyst III',3);
INSERT INTO FUNCIONARIOS VALUES (771,'Clark','rclarkle@ted.com','Feminino','Jardim','9/9/2014',51792,'Software Consultant',4);
INSERT INTO FUNCIONARIOS VALUES (772,'Elliott','delliottlf@fda.gov','Masculino','Filmes','10/13/2004',100570,'Senior Financial Analyst',5);
INSERT INTO FUNCIONARIOS VALUES (773,'Dixon','rdixonlg@parallels.com','Masculino','Ferramentas','7/2/2007',60383,'VP Product Management',1);
INSERT INTO FUNCIONARIOS VALUES (774,'Richards','vrichardslh@forbes.com','Masculino','Calçados','3/21/2006',68761,'Graphic Designer',1);
INSERT INTO FUNCIONARIOS VALUES (775,'Gonzalez','egonzalezli@naver.com','Feminino','Ferramentas','10/14/2009',131830,'GIS Technical Architect',2);
INSERT INTO FUNCIONARIOS VALUES (776,'Olson','kolsonlj@friendfeed.com','Feminino','Roupas','9/27/2013',107535,'Office Assistant III',7);
INSERT INTO FUNCIONARIOS VALUES (777,'Sims','jsimslk@angelfire.com','Masculino','Industrial','11/15/2001',95548,'Sales Associate',3);
INSERT INTO FUNCIONARIOS VALUES (778,'Thomas','ethomasll@aol.com','Masculino','Automotivo','5/16/2013',116487,'Graphic Designer',1);
INSERT INTO FUNCIONARIOS VALUES (779,'Gonzalez','mgonzalezlm@illinois.edu','Masculino','Alimentícios','2/3/2005',148106,'Sales Representative',2);
INSERT INTO FUNCIONARIOS VALUES (780,'Cox','dcoxln@studiopress.com','Masculino','Games','4/4/2007',135719,'Database Administrator I',5);
INSERT INTO FUNCIONARIOS VALUES (781,'Schmidt','rschmidtlo@harvard.edu','Feminino','Automotivo','4/4/2010',121300,'Human Resources Assistant II',5);
INSERT INTO FUNCIONARIOS VALUES (782,'Weaver','jweaverlp@unblog.fr','Masculino','Filmes','11/9/2011',120226,'Software Engineer II',4);
INSERT INTO FUNCIONARIOS VALUES (783,'Burns','kburnslq@163.com','Masculino','Automotivo','8/13/2004',44377,'Technical Writer',4);
INSERT INTO FUNCIONARIOS VALUES (784,'Burns','aburnslr@squidoo.com','Masculino','Eletronicos','2/15/2008',102001,'Developer III',4);
INSERT INTO FUNCIONARIOS VALUES (785,'Miller','nmillerls@behance.net','Masculino','Música','3/10/2009',99151,'Information Systems Manager',1);
INSERT INTO FUNCIONARIOS VALUES (786,'Willis','jwillislt@instagram.com','Masculino','Jardim','10/8/2000',123427,'General Manager',4);
INSERT INTO FUNCIONARIOS VALUES (787,'Williamson','twilliamsonlu@ow.ly','Feminino','Ferramentas','3/9/2003',135695,'Budget/Accounting Analyst III',6);
INSERT INTO FUNCIONARIOS VALUES (788,'Phillips','dphillipslv@domainmarket.com','Feminino','Brinquedos','4/29/2004',102793,'Editor',4);
INSERT INTO FUNCIONARIOS VALUES (789,'James','kjameslw@yellowbook.com','Masculino','Roupas','3/20/2005',130188,'Structural Analysis Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (790,'Murray','cmurraylx@icio.us','Feminino','Lar','4/25/2013',97607,'Accountant IV',3);
INSERT INTO FUNCIONARIOS VALUES (791,'Phillips','tphillipsly@globo.com','Feminino','Esporte','12/11/2013',93534,'Saúde Coach IV',1);
INSERT INTO FUNCIONARIOS VALUES (792,'Mccoy','jmccoylz@samsung.com','Masculino','Industrial','9/20/2007',95787,'Engineer IV',2);
INSERT INTO FUNCIONARIOS VALUES (793,'Kelly','akellym0@unblog.fr','Feminino','Games','4/16/2011',120086,'Professor',6);
INSERT INTO FUNCIONARIOS VALUES (794,'Larson','mlarsonm1@blinklist.com','Feminino','Outdoors','1/1/2009',119414,'Research Assistant II',1);
INSERT INTO FUNCIONARIOS VALUES (795,'Hansen','dhansenm2@thetimes.co.uk','Feminino','Jardim','9/12/2008',79952,'Compensation Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (796,'Owens','jowensm3@mail.ru','Masculino','Beleza','8/17/2004',138682,'Analyst Programmer',7);
INSERT INTO FUNCIONARIOS VALUES (797,'Ramos','aramosm4@issuu.com','Feminino','Saúde','5/20/2003',49667,'Help Desk Technician',6);
INSERT INTO FUNCIONARIOS VALUES (798,'Kim','akimm5@vimeo.com','Masculino','Jardim','7/13/2008',83798,'Technical Writer',5);
INSERT INTO FUNCIONARIOS VALUES (799,'Sims','asimsm6@lycos.com','Feminino','Roupas','3/9/2013',146024,'Actuary',7);
INSERT INTO FUNCIONARIOS VALUES (800,'Peterson','apetersonm7@eepurl.com','Masculino','Outdoors','9/8/2000',144841,'Web Developer I',4);
INSERT INTO FUNCIONARIOS VALUES (801,'Gomez','tgomezm8@ucoz.ru','Feminino','Filmes','9/20/2012',101582,'Biostatistician II',7);
INSERT INTO FUNCIONARIOS VALUES (802,'Knight','dknightm9@quantcast.com','Feminino','Filmes','5/30/2006',100716,'Help Desk Operator',3);
INSERT INTO FUNCIONARIOS VALUES (803,'Hunt','ahuntma@g.co','Feminino','Beleza','3/16/2011',72016,'Computer Systems Analyst I',4);
INSERT INTO FUNCIONARIOS VALUES (804,'Hunter','hhuntermb@reverbnation.com','Feminino','Books','7/31/2005',123156,'Social Worker',1);
INSERT INTO FUNCIONARIOS VALUES (805,'Gordon','pgordonmc@creativecommons.org','Masculino','Bebês','8/13/2014',110058,'Business Systems Development Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (806,'Hill','shillmd@ca.gov','Masculino','Calçados','12/15/2011',117092,'VP Product Management',5);
INSERT INTO FUNCIONARIOS VALUES (807,'Gibson','hgibsonme@ox.ac.uk','Masculino','Industrial','12/15/2005',148816,'Operator',4);
INSERT INTO FUNCIONARIOS VALUES (808,'Mills','jmillsmf@seesaa.net','Feminino','Games','4/14/2009',79031,'Electrical Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (809,'Butler','rbutlermg@netvibes.com','Masculino','Automotivo','8/9/2006',128448,'Technical Writer',3);
INSERT INTO FUNCIONARIOS VALUES (810,'Foster','lfostermh@blog.com','Feminino','Saúde','1/7/2013',138478,'Software Test Engineer IV',4);
INSERT INTO FUNCIONARIOS VALUES (811,'Harrison','eharrisonmi@cdbaby.com','Masculino','Joalheria','10/8/2010',41026,'Professor',1);
INSERT INTO FUNCIONARIOS VALUES (812,'Harvey','jharveymj@yandex.ru','Masculino','Beleza','9/25/2006',131816,'Sales Representative',1);
INSERT INTO FUNCIONARIOS VALUES (813,'Collins','dcollinsmk@salon.com','Feminino','Alimentícios','11/11/2013',85647,'Speech Pathologist',6);
INSERT INTO FUNCIONARIOS VALUES (814,'Hayes','shayesml@usda.gov','Masculino','Joalheria','2/28/2000',49457,'Compensation Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (815,'Burton','rburtonmm@ow.ly','Feminino','Jardim','10/1/2014',80763,'Community Outreach Specialist',3);
INSERT INTO FUNCIONARIOS VALUES (816,'Jackson','pjacksonmn@dailymotion.com','Feminino','Beleza','12/29/2013',107093,'Electrical Engineer',3);
INSERT INTO FUNCIONARIOS VALUES (817,'Dixon','sdixonmo@marriott.com','Masculino','Bebês','1/15/2008',138970,'Structural Analysis Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (818,'Rice','jricemp@columbia.edu','Feminino','Filmes','4/5/2002',82077,'Data Coordiator',4);
INSERT INTO FUNCIONARIOS VALUES (819,'Murray','jmurraymq@spiegel.de','Masculino','Industrial','12/6/2014',83237,'Editor',4);
INSERT INTO FUNCIONARIOS VALUES (820,'Baker','jbakermr@cafepress.com','Masculino','Brinquedos','1/20/2002',107749,'Graphic Designer',2);
INSERT INTO FUNCIONARIOS VALUES (821,'Riley','rrileyms@uiuc.edu','Masculino','Joalheria','6/19/2012',149114,'Business Systems Development Analyst',7);
INSERT INTO FUNCIONARIOS VALUES (822,'Gonzalez','jgonzalezmt@nsw.gov.au','Masculino','Saúde','8/9/2007',107240,'Financial Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (823,'Harrison','mharrisonmu@guardian.co.uk','Feminino','Bebês','5/30/2008',134334,'Accountant II',7);
INSERT INTO FUNCIONARIOS VALUES (824,'Morris','mmorrismv@tumblr.com','Masculino','Alimentícios','9/26/2002',72008,'GIS Technical Architect',2);
INSERT INTO FUNCIONARIOS VALUES (825,'Turner','jturnermw@mapy.cz','Masculino','Books','4/3/2000',89285,'Community Outreach Specialist',5);
INSERT INTO FUNCIONARIOS VALUES (826,'Garcia','cgarciamx@vistaprint.com','Feminino','Alimentícios','8/10/2003',131075,'Help Desk Operator',2);
INSERT INTO FUNCIONARIOS VALUES (827,'Fowler','hfowlermy@nps.gov','Masculino','Bebês','5/7/2009',110383,'Chief Design Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (828,'Allen','wallenmz@gnu.org','Feminino','Ferramentas','7/18/2005',149586,'Account Coordinator',1);
INSERT INTO FUNCIONARIOS VALUES (829,'Parker','bparkern0@weibo.com','Masculino','Saúde','11/27/2002',89503,'Research Associate',2);
INSERT INTO FUNCIONARIOS VALUES (830,'Stewart','cstewartn1@hugedomains.com','Feminino','Computadores','3/14/2010',149336,'Senior Sales Associate',1);
INSERT INTO FUNCIONARIOS VALUES (831,'Rodriguez','drodriguezn2@guardian.co.uk','Feminino','Outdoors','8/30/2006',140276,'Electrical Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (832,'Turner','hturnern3@tumblr.com','Feminino','Games','4/8/2001',127875,'Accountant III',7);
INSERT INTO FUNCIONARIOS VALUES (833,'Chavez','rchavezn4@tamu.edu','Feminino','Música','5/29/2009',137704,'Help Desk Technician',4);
INSERT INTO FUNCIONARIOS VALUES (834,'Cox','kcoxn5@dyndns.org','Feminino','Games','1/17/2013',149221,'Senior Financial Analyst',2);
INSERT INTO FUNCIONARIOS VALUES (835,'Tucker','btuckern6@ovh.net','Masculino','Bebês','6/4/2014',148573,'Nurse Practicioner',4);
INSERT INTO FUNCIONARIOS VALUES (836,'Vasquez','svasquezn7@1und1.de','Feminino','Games','9/20/2002',125378,'Senior Developer',4);
INSERT INTO FUNCIONARIOS VALUES (837,'Cole','wcolen8@php.net','Feminino','Joalheria','9/12/2006',66420,'Clinical Specialist',7);
INSERT INTO FUNCIONARIOS VALUES (838,'Black','rblackn9@sun.com','Masculino','Brinquedos','9/28/2008',117171,'Electrical Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (839,'Richardson','trichardsonna@cbsnews.com','Feminino','Saúde','10/23/2008',145962,'Cost Accountant',3);
INSERT INTO FUNCIONARIOS VALUES (840,'Hamilton','phamiltonnb@earthlink.net','Masculino','Books','10/19/2001',73778,'Sales Representative',2);
INSERT INTO FUNCIONARIOS VALUES (841,'Sullivan','ssullivannc@clickbank.net','Masculino','Crianças','3/4/2008',76731,'Accounting Assistant II',2);
INSERT INTO FUNCIONARIOS VALUES (842,'Carpenter','acarpenternd@prlog.org','Feminino','Beleza','7/13/2008',101653,'Web Designer II',6);
INSERT INTO FUNCIONARIOS VALUES (843,'Ross','rrossne@salon.com','Masculino','Jardim','1/11/2001',62534,'Senior Editor',3);
INSERT INTO FUNCIONARIOS VALUES (844,'Hall','jhallnf@1und1.de','Masculino','Outdoors','4/30/2013',100428,'Web Designer I',3);
INSERT INTO FUNCIONARIOS VALUES (845,'Washington','iwashingtonng@freewebs.com','Masculino','Crianças','12/2/2001',109828,'VP Quality Control',6);
INSERT INTO FUNCIONARIOS VALUES (846,'Moreno','dmorenonh@webs.com','Feminino','Joalheria','3/21/2001',63133,'Clinical Specialist',5);
INSERT INTO FUNCIONARIOS VALUES (847,'Knight','dknightni@unc.edu','Feminino','Roupas','3/22/2008',91532,'Operator',4);
INSERT INTO FUNCIONARIOS VALUES (848,'Austin','jaustinnj@gov.uk','Feminino','Calçados','1/26/2005',101646,'Environmental Tech',1);
INSERT INTO FUNCIONARIOS VALUES (849,'Rice','kricenk@cyberchimps.com','Masculino','Alimentícios','8/2/2002',68034,'Senior Financial Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (850,'Kelley','pkelleynl@biglobe.ne.jp','Masculino','Crianças','4/4/2012',55214,'Senior Quality Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (851,'Gordon','bgordonnm@imdb.com','Feminino','Automotivo','12/29/2002',136448,'Media Manager II',4);
INSERT INTO FUNCIONARIOS VALUES (852,'Rose','srosenn@flavors.me','Masculino','Calçados','5/1/2010',76086,'Statistician I',7);
INSERT INTO FUNCIONARIOS VALUES (853,'Mendoza','emendozano@edublogs.org','Masculino','Beleza','8/3/2013',128947,'Help Desk Operator',5);
INSERT INTO FUNCIONARIOS VALUES (854,'Hanson','ghansonnp@free.fr','Masculino','Ferramentas','10/14/2006',113354,'VP Quality Control',4);
INSERT INTO FUNCIONARIOS VALUES (855,'Perry','eperrynq@imdb.com','Masculino','Jardim','5/21/2012',75125,'VP Marketing',7);
INSERT INTO FUNCIONARIOS VALUES (856,'Roberts','trobertsnr@over-blog.com','Feminino','Roupas','2/21/2004',139714,'Help Desk Operator',2);
INSERT INTO FUNCIONARIOS VALUES (857,'Nichols','dnicholsns@ifeng.com','Masculino','Brinquedos','10/20/2003',43537,'Help Desk Operator',4);
INSERT INTO FUNCIONARIOS VALUES (858,'Wright','lwrightnt@house.gov','Feminino','Automotivo','11/23/2001',127521,'Nurse',4);
INSERT INTO FUNCIONARIOS VALUES (859,'Clark','mclarknu@bigcartel.com','Masculino','Saúde','2/19/2007',112510,'Information Systems Manager',4);
INSERT INTO FUNCIONARIOS VALUES (860,'Anderson','landersonnv@sakura.ne.jp','Masculino','Esporte','12/26/2004',115009,'Structural Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (861,'Foster','kfosternw@a8.net','Feminino','Eletronicos','5/1/2013',64381,'Professor',7);
INSERT INTO FUNCIONARIOS VALUES (862,'Stanley','bstanleynx@phoca.cz','Feminino','Alimentícios','2/10/2001',149929,'Director of Sales',6);
INSERT INTO FUNCIONARIOS VALUES (863,'Gonzales','fgonzalesny@squarespace.com','Feminino','Automotivo','9/7/2001',101006,'Sales Associate',2);
INSERT INTO FUNCIONARIOS VALUES (864,'Jones','sjonesnz@chron.com','Feminino','Beleza','9/1/2013',47716,'Quality Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (865,'Dixon','mdixono0@cbc.ca','Feminino','Esporte','12/29/2008',126420,'Structural Analysis Engineer',6);
INSERT INTO FUNCIONARIOS VALUES (866,'Kelly','jkellyo1@ameblo.jp','Feminino','Esporte','9/1/2011',55265,'Paralegal',1);
INSERT INTO FUNCIONARIOS VALUES (867,'Johnson','bjohnsono2@toplist.cz','Feminino','Books','3/18/2012',95679,'Associate Professor',3);
INSERT INTO FUNCIONARIOS VALUES (868,'Price','jpriceo3@google.it','Masculino','Filmes','1/24/2003',52612,'Analyst Programmer',7);
INSERT INTO FUNCIONARIOS VALUES (869,'Turner','pturnero4@tamu.edu','Feminino','Calçados','12/10/2010',130849,'Desktop Support Technician',5);
INSERT INTO FUNCIONARIOS VALUES (870,'Howard','ghowardo5@ow.ly','Masculino','Outdoors','8/21/2006',141753,'Assistant Professor',3);
INSERT INTO FUNCIONARIOS VALUES (871,'Hanson','thansono6@paginegialle.it','Masculino','Saúde','8/27/2007',133492,'Accountant II',3);
INSERT INTO FUNCIONARIOS VALUES (872,'Hall','thallo7@hud.gov','Masculino','Crianças','12/28/2004',112126,'Information Systems Manager',3);
INSERT INTO FUNCIONARIOS VALUES (873,'Alexander','aalexandero8@histats.com','Feminino','Brinquedos','7/5/2006',140078,'Environmental Specialist',3);
INSERT INTO FUNCIONARIOS VALUES (874,'Spencer','kspencero9@eventbrite.com','Masculino','Books','9/29/2012',119769,'Director of Sales',2);
INSERT INTO FUNCIONARIOS VALUES (875,'Jenkins','rjenkinsoa@answers.com','Feminino','Saúde','2/15/2007',115911,'Civil Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (876,'Montgomery','amontgomeryob@dmoz.org','Masculino','Calçados','12/22/2003',75676,'Recruiting Manager',3);
INSERT INTO FUNCIONARIOS VALUES (877,'Webb','rwebboc@a8.net','Masculino','Outdoors','4/13/2005',144932,'Marketing Assistant',4);
INSERT INTO FUNCIONARIOS VALUES (878,'Williamson','pwilliamsonod@utexas.edu','Masculino','Industrial','10/25/2010',80102,'Graphic Designer',2);
INSERT INTO FUNCIONARIOS VALUES (879,'Hill','shilloe@ft.com','Masculino','Ferramentas','10/3/2011',144661,'Registered Nurse',3);
INSERT INTO FUNCIONARIOS VALUES (880,'Grant','kgrantof@phoca.cz','Feminino','Música','9/26/2001',60268,'Registered Nurse',3);
INSERT INTO FUNCIONARIOS VALUES (881,'Wright','cwrightog@trellian.com','Feminino','Ferramentas','9/10/2014',94072,'Social Worker',3);
INSERT INTO FUNCIONARIOS VALUES (882,'George','wgeorgeoh@mail.ru','Masculino','Calçados','2/23/2006',85249,'Engineer I',2);
INSERT INTO FUNCIONARIOS VALUES (883,'George','lgeorgeoi@jigsy.com','Masculino','Alimentícios','10/12/2007',66059,'Software Test Engineer IV',5);
INSERT INTO FUNCIONARIOS VALUES (884,'Ford','bfordoj@spiegel.de','Feminino','Eletronicos','11/26/2005',80931,'Cost Accountant',1);
INSERT INTO FUNCIONARIOS VALUES (885,'Wallace','mwallaceok@abc.net.au','Feminino','Brinquedos','9/17/2011',118793,'Research Assistant III',3);
INSERT INTO FUNCIONARIOS VALUES (886,'Murphy','fmurphyol@tumblr.com','Feminino','Bebês','9/26/2014',62114,'Analyst Programmer',7);
INSERT INTO FUNCIONARIOS VALUES (887,'Vasquez','jvasquezom@networksolutions.com','Masculino','Beleza','5/3/2014',131811,'Social Worker',4);
INSERT INTO FUNCIONARIOS VALUES (888,'Collins','bcollinson@google.pl','Feminino','Outdoors','9/30/2007',143034,'Budget/Accounting Analyst III',3);
INSERT INTO FUNCIONARIOS VALUES (889,'Jackson','ajacksonoo@slate.com','Masculino','Games','5/7/2013',41516,'Nurse',1);
INSERT INTO FUNCIONARIOS VALUES (890,'Howell','ehowellop@dailymotion.com','Feminino','Bebês','11/26/2012',72534,'Account Executive',4);
INSERT INTO FUNCIONARIOS VALUES (891,'Richards','arichardsoq@so-net.ne.jp','Masculino','Bebês','6/9/2011',140004,'Design Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (892,'Crawford','pcrawfordor@gnu.org','Masculino','Beleza','6/23/2004',114436,'Account Representative IV',5);
INSERT INTO FUNCIONARIOS VALUES (893,'Dixon','jdixonos@msu.edu','Masculino','Alimentícios','3/31/2009',68684,'funcionarios Scientist',3);
INSERT INTO FUNCIONARIOS VALUES (894,'Owens','jowensot@gmpg.org','Masculino','Automotivo','9/18/2000',135326,'Graphic Designer',1);
INSERT INTO FUNCIONARIOS VALUES (895,'Moore','kmooreou@slate.com','Masculino','Industrial','2/23/2014',40194,'Environmental Specialist',5);
INSERT INTO FUNCIONARIOS VALUES (896,'Carpenter','rcarpenterov@pagesperso-orange.fr','Feminino','Lar','10/28/2010',134813,'Saúde Coach I',7);
INSERT INTO FUNCIONARIOS VALUES (897,'Reid','sreidow@smugmug.com','Masculino','Beleza','3/9/2002',79718,'Marketing Manager',4);
INSERT INTO FUNCIONARIOS VALUES (898,'Lee','kleeox@nature.com','Feminino','Industrial','12/9/2010',115085,'Senior Quality Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (899,'Burton','kburtonoy@army.mil','Feminino','Calçados','3/5/2005',67758,'Chemical Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (900,'Jordan','tjordanoz@instagram.com','Masculino','Brinquedos','2/23/2012',115776,'Database Administrator I',2);
INSERT INTO FUNCIONARIOS VALUES (901,'Perry','kperryp0@chron.com','Masculino','Books','12/15/2013',146701,'Research Assistant II',7);
INSERT INTO FUNCIONARIOS VALUES (902,'Wright','bwrightp1@deviantart.com','Masculino','Calçados','12/16/2011',109233,'Mechanical Systems Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (903,'Burns','eburnsp2@discuz.net','Feminino','Outdoors','1/7/2007',113654,'Saúde Coach IV',1);
INSERT INTO FUNCIONARIOS VALUES (904,'Roberts','drobertsp3@ed.gov','Feminino','Ferramentas','8/25/2004',90937,'Cost Accountant',6);
INSERT INTO FUNCIONARIOS VALUES (905,'Webb','dwebbp4@about.com','Masculino','Automotivo','10/10/2007',111689,'GIS Technical Architect',5);
INSERT INTO FUNCIONARIOS VALUES (906,'Spencer','sspencerp5@mtv.com','Masculino','Eletronicos','4/18/2014',110881,'Electrical Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (907,'Frazier','kfrazierp6@dailymail.co.uk','Feminino','Ferramentas','9/22/2009',104326,'Assistant Manager',5);
INSERT INTO FUNCIONARIOS VALUES (908,'Hanson','jhansonp7@1688.com','Feminino','Eletronicos','11/27/2003',144767,'Executive Secretary',5);
INSERT INTO FUNCIONARIOS VALUES (909,'Mcdonald','hmcdonaldp8@facebook.com','Masculino','Automotivo','12/26/2009',111041,'Research Assistant II',6);
INSERT INTO FUNCIONARIOS VALUES (910,'Reyes','freyesp9@ft.com','Feminino','Jardim','12/21/2005',148860,'Product Engineer',4);
INSERT INTO FUNCIONARIOS VALUES (911,'Peterson','jpetersonpa@unblog.fr','Masculino','Automotivo','1/20/2002',53964,'Pharmacist',1);
INSERT INTO FUNCIONARIOS VALUES (912,'Fisher','sfisherpb@answers.com','Feminino','Beleza','3/1/2007',131152,'Database Administrator IV',2);
INSERT INTO FUNCIONARIOS VALUES (913,'Kelley','mkelleypc@sourceforge.net','Feminino','Roupas','2/20/2012',116266,'Marketing Assistant',6);
INSERT INTO FUNCIONARIOS VALUES (914,'Armstrong','carmstrongpd@4shared.com','Feminino','Beleza','6/7/2006',143853,'Design Engineer',2);
INSERT INTO FUNCIONARIOS VALUES (915,'Bell','cbellpe@npr.org','Masculino','Ferramentas','5/26/2010',92561,'Senior Sales Associate',1);
INSERT INTO FUNCIONARIOS VALUES (916,'Payne','bpaynepf@cbsnews.com','Feminino','Alimentícios','8/10/2006',45486,'GIS Technical Architect',1);
INSERT INTO FUNCIONARIOS VALUES (917,'Gutierrez','sgutierrezpg@bloglovin.com','Masculino','Beleza','12/11/2004',95424,'VP Product Management',2);
INSERT INTO FUNCIONARIOS VALUES (918,'Miller','amillerph@skype.com','Feminino','Bebês','9/30/2004',73905,'Design Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (919,'Bishop','kbishoppi@ovh.net','Feminino','Filmes','12/18/2010',53798,'Mechanical Systems Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (920,'Cole','scolepj@odnoklassniki.ru','Feminino','Ferramentas','5/2/2010',116766,'Account Representative IV',4);
INSERT INTO FUNCIONARIOS VALUES (921,'Moore','jmoorepk@Lar.pl','Feminino','Beleza','6/23/2013',142101,'Paralegal',2);
INSERT INTO FUNCIONARIOS VALUES (922,'Watkins','swatkinspl@google.fr','Feminino','Beleza','4/19/2000',41299,'Computer Systems Analyst IV',5);
INSERT INTO FUNCIONARIOS VALUES (923,'White','jwhitepm@elpais.com','Masculino','Alimentícios','1/7/2003',122130,'Project Manager',1);
INSERT INTO FUNCIONARIOS VALUES (924,'Wilson','bwilsonpn@chron.com','Masculino','Beleza','3/6/2003',122446,'Systems Administrator II',6);
INSERT INTO FUNCIONARIOS VALUES (925,'Phillips','dphillipspo@adobe.com','Feminino','Jardim','10/3/2011',127367,'Recruiting Manager',4);
INSERT INTO FUNCIONARIOS VALUES (926,'Austin','raustinpp@house.gov','Masculino','Brinquedos','4/1/2014',50161,'Account Executive',3);
INSERT INTO FUNCIONARIOS VALUES (927,'Howard','dhowardpq@ocn.ne.jp','Masculino','Música','11/10/2003',82080,'Analog Circuit Design manager',2);
INSERT INTO FUNCIONARIOS VALUES (928,'Young','lyoungpr@psu.edu','Feminino','Crianças','12/21/2009',62799,'Operator',1);
INSERT INTO FUNCIONARIOS VALUES (929,'Rice','ericeps@reference.com','Feminino','Roupas','8/8/2003',66357,'Cost Accountant',3);
INSERT INTO FUNCIONARIOS VALUES (930,'Hansen','jhansenpt@slate.com','Feminino','Jardim','4/26/2013',129746,'Geological Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (931,'Burton','jburtonpu@wufoo.com','Feminino','Brinquedos','8/24/2004',63682,'Recruiting Manager',5);
INSERT INTO FUNCIONARIOS VALUES (932,'Reyes','lreyespv@tuttocitta.it','Feminino','Jardim','5/27/2009',134114,'Accounting Assistant IV',2);
INSERT INTO FUNCIONARIOS VALUES (933,'Williams','gwilliamspw@columbia.edu','Masculino','Bebês','3/23/2014',131273,'Web Developer IV',6);
INSERT INTO FUNCIONARIOS VALUES (934,'Morrison','tmorrisonpx@free.fr','Masculino','Brinquedos','9/22/2005',93714,'Social Worker',5);
INSERT INTO FUNCIONARIOS VALUES (935,'Hudson','mhudsonpy@altervista.org','Masculino','Books','12/8/2001',146745,'Assistant Media Planner',1);
INSERT INTO FUNCIONARIOS VALUES (936,'Weaver','mweaverpz@delicious.com','Feminino','Computadores','12/20/2010',126307,'Professor',4);
INSERT INTO FUNCIONARIOS VALUES (937,'Hawkins','chawkinsq0@bravesites.com','Masculino','Esporte','9/25/2011',134931,'Tax Accountant',1);
INSERT INTO FUNCIONARIOS VALUES (938,'Jones','djonesq1@tamu.edu','Feminino','Lar','2/10/2002',73668,'Environmental Specialist',2);
INSERT INTO FUNCIONARIOS VALUES (939,'Austin','kaustinq2@soup.io','Masculino','Industrial','1/19/2012',48840,'Product Engineer',1);
INSERT INTO FUNCIONARIOS VALUES (940,'Turner','lturnerq3@ycombinator.com','Masculino','Alimentícios','3/9/2014',146952,'Dental Hygienist',2);
INSERT INTO FUNCIONARIOS VALUES (941,'Cunningham','gcunninghamq4@webmd.com','Feminino','Jardim','5/7/2006',73565,'Mechanical Systems Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (942,'Lopez','llopezq5@usgs.gov','Masculino','Calçados','6/7/2010',64443,'Senior Sales Associate',6);
INSERT INTO FUNCIONARIOS VALUES (943,'Phillips','kphillipsq6@soup.io','Feminino','Eletronicos','1/5/2008',127171,'Cost Accountant',4);
INSERT INTO FUNCIONARIOS VALUES (944,'Adams','jadamsq7@aol.com','Feminino','Automotivo','2/11/2002',79045,'VP Product Management',3);
INSERT INTO FUNCIONARIOS VALUES (945,'Lee','pleeq8@noaa.gov','Feminino','Joalheria','3/16/2006',117147,'funcionarios Accountant III',1);
INSERT INTO FUNCIONARIOS VALUES (946,'Phillips','dphillipsq9@stanford.edu','Feminino','Outdoors','1/6/2014',69807,'Account Representative IV',3);
INSERT INTO FUNCIONARIOS VALUES (947,'Kelly','ckellyqa@boston.com','Feminino','Calçados','1/9/2004',128646,'Senior Editor',1);
INSERT INTO FUNCIONARIOS VALUES (948,'James','bjamesqb@hubpages.com','Masculino','Ferramentas','2/13/2008',47271,'Programmer Analyst IV',1);
INSERT INTO FUNCIONARIOS VALUES (949,'Woods','jwoodsqc@patch.com','Masculino','Calçados','12/25/2005',59363,'Programmer Analyst IV',1);
INSERT INTO FUNCIONARIOS VALUES (950,'Kennedy','jkennedyqd@nba.com','Feminino','Calçados','7/22/2008',68364,'Professor',5);
INSERT INTO FUNCIONARIOS VALUES (951,'Lewis','jlewisqe@etsy.com','Feminino','Brinquedos','12/17/2012',115975,'Social Worker',7);
INSERT INTO FUNCIONARIOS VALUES (952,'Cole','acoleqf@unblog.fr','Feminino','Calçados','10/21/2008',53905,'Editor',7);
INSERT INTO FUNCIONARIOS VALUES (953,'Edwards','pedwardsqg@cnbc.com','Masculino','Alimentícios','9/3/2003',115360,'Social Worker',6);
INSERT INTO FUNCIONARIOS VALUES (954,'Cooper','ncooperqh@wp.com','Feminino','Eletronicos','7/19/2011',120108,'Computer Systems Analyst II',5);
INSERT INTO FUNCIONARIOS VALUES (955,'Marshall','wmarshallqi@fastcompany.com','Masculino','Roupas','4/18/2005',59234,'VP Product Management',7);
INSERT INTO FUNCIONARIOS VALUES (956,'Austin','saustinqj@vimeo.com','Feminino','Alimentícios','1/28/2007',76812,'Biostatistician III',7);
INSERT INTO FUNCIONARIOS VALUES (957,'Franklin','cfranklinqk@dyndns.org','Feminino','Games','5/8/2012',42347,'VP Product Management',3);
INSERT INTO FUNCIONARIOS VALUES (958,'Wood','bwoodql@epa.gov','Masculino','Ferramentas','12/5/2003',82164,'Compensation Analyst',1);
INSERT INTO FUNCIONARIOS VALUES (959,'Young','jyoungqm@xing.com','Masculino','Música','11/29/2000',114695,'Statistician IV',1);
INSERT INTO FUNCIONARIOS VALUES (960,'Lane','glaneqn@google.fr','Masculino','Computadores','12/31/2002',47541,'Payment Adjustment Coordinator',2);
INSERT INTO FUNCIONARIOS VALUES (961,'Bowman','rbowmanqo@auda.org.au','Feminino','Bebês','11/14/2011',116355,'Structural Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (962,'Hayes','ahayesqp@npr.org','Feminino','Saúde','10/13/2000',48339,'Engineer III',5);
INSERT INTO FUNCIONARIOS VALUES (963,'Burton','cburtonqq@github.io','Feminino','Roupas','6/20/2012',58697,'Teacher',4);
INSERT INTO FUNCIONARIOS VALUES (964,'Ramos','mramosqr@is.gd','Masculino','Jardim','3/2/2002',127268,'Nurse Practicioner',4);
INSERT INTO FUNCIONARIOS VALUES (965,'Butler','sbutlerqs@ow.ly','Masculino','Games','4/2/2014',115541,'Pharmacist',6);
INSERT INTO FUNCIONARIOS VALUES (966,'Kelly','ckellyqt@canalblog.com','Feminino','Industrial','2/13/2008',54876,'Research Associate',2);
INSERT INTO FUNCIONARIOS VALUES (967,'Lawson','clawsonqu@cargocollective.com','Feminino','Beleza','8/13/2012',55081,'Mechanical Systems Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (968,'Moreno','nmorenoqv@chronoengine.com','Masculino','Beleza','9/26/2009',123017,'Speech Pathologist',6);
INSERT INTO FUNCIONARIOS VALUES (969,'Richards','jrichardsqw@blog.com','Masculino','Roupas','7/5/2014',85294,'Media Manager I',4);
INSERT INTO FUNCIONARIOS VALUES (970,'James','pjamesqx@nymag.com','Masculino','Crianças','8/5/2004',54470,'Accounting Assistant IV',2);
INSERT INTO FUNCIONARIOS VALUES (971,'Dunn','mdunnqy@chronoengine.com','Feminino','Outdoors','6/11/2011',148889,'Help Desk Operator',4);
INSERT INTO FUNCIONARIOS VALUES (972,'Bailey','mbaileyqz@howstuffworks.com','Feminino','Bebês','1/10/2008',94049,'Senior Financial Analyst',7);
INSERT INTO FUNCIONARIOS VALUES (973,'Walker','swalkerr0@sina.com.cn','Feminino','Filmes','5/11/2009',51132,'Assistant Manager',4);
INSERT INTO FUNCIONARIOS VALUES (974,'Welch','rwelchr1@eventbrite.com','Masculino','Brinquedos','6/14/2002',87422,'Research Nurse',3);
INSERT INTO FUNCIONARIOS VALUES (975,'Fowler','kfowlerr2@wp.com','Feminino','Jardim','9/15/2014',88439,'Media Manager III',2);
INSERT INTO FUNCIONARIOS VALUES (976,'Chapman','achapmanr3@list-manage.com','Masculino','Beleza','2/25/2005',110749,'Legal Assistant',7);
INSERT INTO FUNCIONARIOS VALUES (977,'Collins','acollinsr4@jiathis.com','Masculino','Beleza','10/26/2006',137911,'Accountant IV',4);
INSERT INTO FUNCIONARIOS VALUES (978,'Hunt','ghuntr5@moonfruit.com','Masculino','Eletronicos','6/18/2009',93665,'Saúde Coach I',3);
INSERT INTO FUNCIONARIOS VALUES (979,'Medina','bmedinar6@1688.com','Masculino','Bebês','12/31/2009',90068,'Quality Control Specialist',6);
INSERT INTO FUNCIONARIOS VALUES (980,'Sanchez','tsanchezr7@lycos.com','Feminino','Lar','12/19/2014',83704,'Editor',5);
INSERT INTO FUNCIONARIOS VALUES (981,'Simmons','dsimmonsr8@craigslist.org','Masculino','Beleza','6/27/2011',116767,'Environmental Tech',3);
INSERT INTO FUNCIONARIOS VALUES (982,'Mendoza','bmendozar9@reference.com','Feminino','Brinquedos','8/26/2000',54599,'Assistant Media Planner',3);
INSERT INTO FUNCIONARIOS VALUES (983,'Lopez','llopezra@blogger.com','Feminino','Esporte','2/17/2014',94685,'Research Nurse',4);
INSERT INTO FUNCIONARIOS VALUES (984,'Williams','hwilliamsrb@webnode.com','Masculino','Joalheria','10/20/2004',91608,'funcionarios Scientist',5);
INSERT INTO FUNCIONARIOS VALUES (985,'Stevens','hstevensrc@hugedomains.com','Masculino','Eletronicos','2/28/2006',118791,'Safety Technician IV',1);
INSERT INTO FUNCIONARIOS VALUES (986,'Ryan','hryanrd@networkadvertising.org','Masculino','Beleza','11/27/2002',115888,'Librarian',6);
INSERT INTO FUNCIONARIOS VALUES (987,'Lawrence','slawrencere@cdbaby.com','Feminino','Ferramentas','12/17/2000',60743,'Civil Engineer',5);
INSERT INTO FUNCIONARIOS VALUES (988,'Cole','ecolerf@scientificamerican.com','Feminino','Beleza','4/17/2005',117962,'Accountant III',7);
INSERT INTO FUNCIONARIOS VALUES (989,'Fields','dfieldsrg@examiner.com','Feminino','Música','3/7/2004',67817,'Registered Nurse',7);
INSERT INTO FUNCIONARIOS VALUES (990,'Thomas','lthomasrh@elegantthemes.com','Masculino','Crianças','8/6/2003',76229,'Business Systems Development Analyst',4);
INSERT INTO FUNCIONARIOS VALUES (991,'Turner','rturnerri@a8.net','Feminino','Eletronicos','12/13/2009',62286,'Senior Sales Associate',2);
INSERT INTO FUNCIONARIOS VALUES (992,'Edwards','nedwardsrj@wikimedia.org','Masculino','Outdoors','10/30/2006',121713,'Director of Sales',5);
INSERT INTO FUNCIONARIOS VALUES (993,'Anderson','sandersonrk@businesswire.com','Feminino','Books','3/7/2009',139486,'Product Engineer',7);
INSERT INTO FUNCIONARIOS VALUES (994,'Hamilton','rhamiltonrl@skype.com','Feminino','Saúde','10/29/2002',141375,'Desktop Support Technician',7);
INSERT INTO FUNCIONARIOS VALUES (995,'Wood','kwoodrm@indiegogo.com','Feminino','Joalheria','4/5/2010',83404,'Pharmacist',2);
INSERT INTO FUNCIONARIOS VALUES (996,'James','tjamesrn@soundcloud.com','Feminino','Games','11/17/2013',78433,'Accountant II',7);
INSERT INTO FUNCIONARIOS VALUES (997,'Reynolds','dreynoldsro@blogtalkradio.com','Feminino','Computadores','4/16/2007',120138,'Statistician IV',1);
INSERT INTO FUNCIONARIOS VALUES (998,'Walker','kwalkerrp@unicef.org','Feminino','Games','2/13/2010',60363,'Account Coordinator',1);
INSERT INTO FUNCIONARIOS VALUES (999,'Kennedy','lkennedyrq@edublogs.org','Masculino','Industrial','9/22/2004',48050,'Graphic Designer',2);
INSERT INTO FUNCIONARIOS VALUES (1000,'Howard','showardrr@addtoany.com','Masculino','Bebês','11/7/2003',148687,'General Manager',3);



/* FILTRANDO VALORES NULOS - USANDO DB PROJETO*/
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */

SELECT NOME, EMAIL
FROM CLIENTE;

-- Nesse caso da update na coluna toda de e-mail
UPDATE CLIENTE
SET EMAIL = 'LILIAN@HOTMAIL.COM';

SELECT NOME, EMAIL
FROM CLIENTE;

/* WHERE - VAI SER O SEU MELHOR AMIGO DA VIDA
PRA VIDA INTEIRA */

-- Retorna somente a linha da FRANCISCA
SELECT * FROM CLIENTE
WHERE NOME = 'LILIAN';

UPDATE CLIENTE
SET EMAIL = 'JOAO@IG.COM.BR'
WHERE NOME = 'JOAO';

SELECT NOME, EMAIL
FROM CLIENTE;


/*COMMIT E ROLLBACK */

/* DELETANDO REGISTROS COM A CLAUSULA DELETE */

DELETE FROM CLIENTE; 

SELECT COUNT(*) FROM CLIENTE; -- TOTAL 6

-- TOTAL DELETADO 1
SELECT COUNT(*) FROM CLIENTE
WHERE NOME = 'CELIA';

DELETE FROM CLIENTE
WHERE NOME = 'CELIA';

-- RESTANTE 5
SELECT COUNT(*) FROM CLIENTE; 

-- DA PARA FAZER CONTAS NO BANCO
SELECT 7 - 1;

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE VALUES('CARLA','F','C.LOPES@UOL.COM',45638854,'4575-0048',
'RUA COPPER LEAF - WILLIAMSBURG - KITCHENER');

SELECT * FROM CLIENTE;

-- OR TRAZ TODO MUNDO COM PELO MENOS UMA DAS DUAS CONDICOES
SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@TERATI.COM.BR';

-- TRAZ APENAS O REGISTRO QUE SATISFACA AS DUAS CONDICOES
DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@TERATI.COM.BR';

SELECT * FROM CLIENTE;

/* ENTRANDO COM MAIS TELEFONES */

UPDATE CLIENTE
SET TELEFONE = '97865434'
WHERE NOME = 'JOAO';

SELECT * FROM CLIENTE;

/*  HISTORIA DA MODELAGEM 

DECADA DE 70, EUA - CRISE DO SOFTWARE
FOI A CRISE QUE ATINGIU NAO SOMENTE A AREA DE TECNOLOGIA
MAS TAMBÉM TODAS AS EMPRESAS QUE UTILIZAVAM DE SISTEMAS
TECNOLOGICOS PARA CONTROLAR SEUS NEGOCIOS.

NAQUELA EPOCA, PROGRAMAR ERA UM PROCESSO ARTESANAL.
BASTAVA OLHAR O CODIGO QUE VOCE SABERIA QUEM O
ESCREVEU, TAO POUCOS ERAM OS PROGRAMADORES EACHTAO ARCAICO ERAM
OS METODOS DE PROGRAMACAO. EM UM PRIMEIRO MOMENTO,
OS PROFISSIONAIS DE TI VIRAM A NECESSIDADE DE SE PROGRAMAR
E INICIARAM SUA CAMINHADA, CONSTRUINDO SISTEMAS QUE ATENDIAM
NUM PRIMEIRO MOMENTO, MAS DEPOIS TRAZIAM INFORMACOES ERRADAS,
PROVOCANDO A FALENCIA DE DIVERSAS EMPRESAS. LEMBRE-SE: INFORMACOES
ERRADAS PODEM LEVAR A SUA EMPRESA A FALENCIA, E FOI ISSO QUE ACONTECEU.
ISSO OCORRIA POIS OS PROFISSIONAIS SABIAM PROGRAMAR MAS ENTENDIAM APENAS
DO NEGOCIO DAS EMPRESAS DAS QUAIS FAZIAM PARTE. SER TER O KNOW HOW
DOS DEMAIS NEGOCIOS, OS PROGRAMADORES PROGRAMAVAM VOLTADOS PARA OS
PROCEDIMENTOS, E ESSE FOI UM ERRO MORTAL.

PETER CHEN, VENDO TODO ESSE CENARIO AFIRMOU: NAO PODEMOS CRIAR BANCOS
DE DADOS VOLTADOS PARA PROCEDIMENTOS EMPRESARIAIS, POIS OS PROCEDIMENTOS
SOFREM INTERFERENCIAS EXTERNAS E PODEM SER ALTERADOS. A UNICA COISA
QUE NAO SOFRE ALTERACAO SAO OS DADOS.

POR EXEMPLO, ARMAZENAMOS NO BANCO A VENDA DE JANEIRO, FEVEREIRO E MARCO
O TOTAL DAS VENDAS E O IMPOSTO PAGO AO GOVERNO. 
FAZEMOS ISSO DURANTE MUITO TEMPO. DE UMA HORA PRA OUTRA O GOVERNO
MUDA A ALIQUOTA DO IMPOSTO. COMO FARÁ SENTIDO OS PAGAMENTOS ARMAZENADOS
ANTERIORMENTE? AQUI NOTA-SE QUE ARMAZENAMOS DADOS E ARMAZENAMOS
INFORMACOES CORRESPONDENTES AOS PROCEDIMENTOS EXTERNOS. DEVEMOS
APENAS ARMAZENAR OS DADOS, POIS ELES SAO SUFICIENTES PARA GERAR
A INFORMACAO.

MODELAR É UMA ARTE, ALGO QUE SE APRENDE COM A PRATICA. E VOCES PODEM
SE PERGUNTAR: MAS SE É ALGO QUE SE APRENDE COM A PRATICA, COMO QUEM
ESTA COMEÇANDO, APRENDE?

ASSIM COMO PETER CHEN CRIOU O MODELO DE ENTIDADE E RELACIONAMENTO, O MER,
FORAM CRIADAS FORMAS NORMAIS, QUE SAO DIRETRIZES PARA APLICAR EM
MODELAGEM DE AMBIENTES OLTP OU AMBIENTES TRANSACIONAIS DE BANCOS
DE DADOS.

HOJE TEMOS MAIS DO QUE 3 FORMAS NORMAIS, MAS AO NORMALIZARMOS UM
BANCO ATE A SUA TERCEIRA FORMA, É O SUFICIENTE PARA TER UM
TRABALHO LIMPO E LIVRE DE ERROS. VEREMOS AS TRES FORMAS NORMAIS,
UMA A UMA, DETALHADAMENTE NAS PROXIMAS AULAS.
*/

SELECT SEXO, COUNT(*) AS QTD
FROM CLIENTE
GROUP BY SEXO;

/* PRIMEIRA FORMA NORMAL */

/*

1 - TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA

[AMARELO, AZUL, LARANJA, VERDE] -> CORES
[KA, FIESTA, UNO, CIVIC]-> CARROS

2 - TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA.
QUANDO O CAMPO FOR DIVISÍVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE
TODO O REGISTRO COMO SENDO UNICO.
ISSO ;E O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY.

*/

/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM


se lê a cardinalidade pelo segundo algarismo

*/


CREATE DATABASE COMERCIO;

USE COMERCIO;

SHOW DATABASES; --> Pra saber quais tabelas existem

DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE  VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/* ENDERECO - OBRIGATORIO 
CADASTRO DE SOMENTE UM.
	
TELEFONE - NAO OBRIGATORIO
CADASTRO DE MAIS DE UM (OPCIONAL) */

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */
/* NESSE TIPO DE RELACIONAMENTO, A FOREIGN KEY VAI SER UNIQUE */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */

DESC CLIENTE; --> ESSE COMANDO DESCREVE A TABELA DO BANCO DE DADOS CASO ESQUEÇA

INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAO@IG.COM', '01234567890');

SELECT * FROM CLIENTE; --> CONFIRO SE ESTÁ LÁ MEU INSERT (NO CASO O JOÃO)

INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', 'CARLOS@IG.COM', '67965356007');
INSERT INTO CLIENTE VALUES(NULL, 'ANA', 'F', 'ANA@IG.COM', '01228517061');
INSERT INTO CLIENTE VALUES(NULL, 'CLARA', 'F', NULL, '03304441077');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', 'JORGE@IG.COM', '03170619098');
INSERT INTO CLIENTE VALUES(NULL, 'CELIA', 'F', 'CELIA@IG.COM', '59421963032');
INSERT INTO CLIENTE VALUES(NULL, 'ROBERTO', 'M', 'ROBERTO@IG.COM', '20457543086');
INSERT INTO CLIENTE VALUES(NULL, 'HELIO', 'M', 'HELIO@IG.COM', '49714668000');

+-----------+---------+------+----------------+-------------+
| IDCLIENTE | NOME    | SEXO | EMAIL          | CPF         |
+-----------+---------+------+----------------+-------------+
|         1 | JOAO    | M    | JOAO@IG.COM    | 01234567890 |
|         3 | CARLOS  | M    | CARLOS@IG.COM  | 67965356007 |
|         4 | ANA     | F    | ANA@IG.COM     | 01228517061 |
|         5 | CLARA   | F    | NULL           | 03304441077 |
|         6 | JORGE   | M    | JORGE@IG.COM   | 03170619098 |
|         7 | CELIA   | F    | CELIA@IG.COM   | 59421963032 |
|         8 | ROBERTO | M    | ROBERTO@IG.COM | 20457543086 |
|         9 | HELIO   | M    | HELIO@IG.COM   | 49714668000 |
+-----------+---------+------+----------------+-------------+
DESC ENDERECO;

/*
INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG', 45);

DEU ERRO, MAS NO AUTO_INCREMENT O BANCO BATEU COM ESSES DADOS NA TABELA E NA SEQUÊNCIA É CHECADA A INTEGRIDADE REFERENCIAL E O BANCO REMOVE ESSE DADO DA TABELA, A COLUNA DE AUTO_INCREMENT CONTINUA A SER CONTADA
*/

INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA CAPITAO HERMES', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA PRES VARGAS', 'JARDINS', 'SAO PAULO', 'SP', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA ALFANDEGA', 'ESTACIO', 'RIO DE JANEIRO', 'RJ', 7);
INSERT INTO ENDERECO VALUES(NULL, 'RUA DO OUVIDOR', 'FLAMENGO', 'RIO DE JANEIRO', 'RJ', 6);
INSERT INTO ENDERECO VALUES(NULL, 'RUA URAGUAIANA', 'CENTRO', 'VITORIA', 'ES', 5);

INSERT INTO ENDERECO VALUES(NULL, 'RUA ALFANDEGA', 'CENTRO', 'SAO PAULO', 'SP', 5); --> AO TENTAR INSERIR DA ERRO, POIS A FOREIGN KEY É UNIQUE (1X1)

INSERT INTO ENDERECO VALUES(NULL, 'RUA VOLUNTARIOS DA PATRIA', 'CENTRO', 'CURITIBA', 'PR', 8);

INSERT INTO ENDERECO VALUES(NULL, 'RUA DOS IMIGRANTES', 'AGUA VERDE', 'BLUMENAU', 'SC', 9);

SELECT * FROM ENDERECO; 

DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

SELECT * FROM TELEFONE;

/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO -> É TUDO QUE VOCE QUER VER NA TELA */

SELECT NOW() AS DATA_ATUAL; --> NOW MOSTRA A DATA ATUAL / AS FUNCIONA COMO UM ALIAS
 
SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

/* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
-> A CLAUSULA DE SELECAO É O WHERE
*/

SELECT NOME, SEXO, EMAIL /* PROJECAO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELECAO */

SELECT NUMERO /* PROJECAO */
FROM TELEFONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELECAO */

/* JUNCAO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+--------+---------------+-----------+
| NOME   | EMAIL         | IDCLIENTE |
+--------+---------------+-----------+
| JOAO   | JOAO@IG.COM   |         1 |
| CARLOS | CARLOS@IG.COM |         2 |
| ANA    | ANA@IG.COM    |         3 |
| CLARA  | NULL          |         4 |
| JORGE  | JORGE@IG.COM  |         5 |
| CELIA  | CELIA@IG.COM  |         6 |
+--------+---------------+-----------+	

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE, ENDERECO /* ORIGEM ----> FUNCIONA MAS NAO E RECOMENDADO */
WHERE IDCLIENTE = ID_CLIENTE; /* JUNCAO */

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| JOAO  | M    | CENTRO   | RIO DE JANEIRO |
| ANA   | F    | JARDINS  | SAO PAULO      |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
| JORGE | M    | CENTRO   | VITORIA        |
+-------+------+----------+----------------+

/* WHERE = SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO 
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; 

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SAO PAULO      |
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

/* WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; -> TABELA VERDADE */


SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE /* ORIGEM */
INNER JOIN ENDERECO /* COMO BAIRO E CIDADE VEM ENDEREÇO, O INNER PEGA A JUNÇÃO DE DENTRO */
ON IDCLIENTE = ID_CLIENTE; /* ONDE IDCLIENTE É IGUAL A ID_CLIENTE */

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| JOAO  | M    | CENTRO   | RIO DE JANEIRO |
| ANA   | F    | JARDINS  | SAO PAULO      |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
| JORGE | M    | CENTRO   | VITORIA        |
+-------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */ 
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /*JUNCAO */
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELECAO */

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SAO PAULO      |
| CLARA | F    | CENTRO   | B. HORIZONTE   |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE;


/* 
A TABELA REPETE OS MESMOS NOMES POIS O CLIENTE TEM MAIS DE UM NUMERO 
*/
+--------+------+---------------+------+----------+
| NOME   | SEXO | EMAIL         | TIPO | NUMERO   |
+--------+------+---------------+------+----------+
| JORGE  | M    | JORGE@IG.COM  | CEL  | 78458743 |
| JORGE  | M    | JORGE@IG.COM  | RES  | 56576876 |
| JOAO   | M    | JOAO@IG.COM   | CEL  | 87866896 |
| CARLOS | M    | CARLOS@IG.COM | COM  | 54768899 |
| JOAO   | M    | JOAO@IG.COM   | RES  | 99667587 |
| ANA    | F    | ANA@IG.COM    | CEL  | 78989765 |
| ANA    | F    | ANA@IG.COM    | CEL  | 99766676 |
| JOAO   | M    | JOAO@IG.COM   | COM  | 66687899 |
| JORGE  | M    | JORGE@IG.COM  | RES  | 89986668 |
| CARLOS | M    | CARLOS@IG.COM | CEL  | 88687909 |
+--------+------+---------------+------+----------+

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+-------+------+---------+----------------+------+----------+
| NOME  | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+-------+------+---------+----------------+------+----------+
| JOAO  | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| JOAO  | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| JOAO  | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| ANA   | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA   | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JORGE | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JORGE | M    | CENTRO  | VITORIA        | RES  | 89986668 |
+-------+------+---------+----------------+------+----------+

/* PONTEIRAMENTO ---> AUMENTA A PERFORMANCE DO BANCO */
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C /* APÓS EU COLOCAR A ORIGEM, COLOCO UM ALIAS A MINHA ESCOLHA */
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

+-------+------+---------+----------------+------+----------+
| NOME  | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+-------+------+---------+----------------+------+----------+
| JOAO  | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| JOAO  | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| JOAO  | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| ANA   | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA   | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JORGE | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JORGE | M    | CENTRO  | VITORIA        | RES  | 89986668 |
+-------+------+---------+----------------+------+----------+

/*
	
	DML - DATA MANIPULATION LANGUAGE - MANIPULAÇÃO DE DADOS
	DDL - DATA DEFINITION LANGUAGE - DEFINIÇÃO DE DADOS/TIPAGEM DOS DADOS
	DCL - DATA CONTROL LANGUAGE - CONTROLE DE ACESSO AOS DADOS
	TCL - TRANSACTION CONTROL LANGUAGE - CONTROLE DE TRANSACAO

*/

/* INSERT -> DML - DATA MANIPULATION LANGUAGE */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

/* VEJO SE O IDCLIENTE 7 VAI SER A PAULA */
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

/* COM A GARANTIA DE QUE É A PAULA, EU FAÇO O UPDATE */
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */ 

/* INSIRO UM CLIENTE TODO ERRADO SEM QUERER */
INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

/* VEJO SE E O CLIENTE QUE EU QUERO */
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

/* COM A GARANTIA, VOU LA E DELETO */
DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* 
  DDL - DATA DEFINITION LANGUAGE
*/

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

DESC PRODUTO;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| PRECO        | int(11)     | YES  |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA ----> MYSQL PERMITE, MAS NAO SAO TODOS BD */

/* ADICIONA A COLUNA PESO DEPOIS DE NOME_PRODUTO */
ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONA EM PRIMEIRO LUGAR A COLUNA */
ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

/*  */

