CREATE DATABASE momento;

USE momento;

DROP TABLE IF EXISTS regiao;
CREATE TABLE regiao (
	regiao_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	regiao_name VARCHAR (25) DEFAULT NULL
);

DROP TABLE IF EXISTS paises;
CREATE TABLE paises (
	pais_id CHAR (2) PRIMARY KEY,
	pais_name VARCHAR (40) DEFAULT NULL,
	regiao_id INT (11) NOT NULL,
	FOREIGN KEY (regiao_id) REFERENCES regiao (regiao_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS posicao;
CREATE TABLE posicao (
	posicao_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	endereco VARCHAR (40) DEFAULT NULL,
	cep VARCHAR (12) DEFAULT NULL,
	cidade VARCHAR (30) NOT NULL,
	estado VARCHAR (25) DEFAULT NULL,
	pais_id CHAR (2) NOT NULL,
	FOREIGN KEY (pais_id) REFERENCES paises (pais_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ocupacoes;
CREATE TABLE ocupacoes (
	ocupacao_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	ocupacao_title VARCHAR (35) NOT NULL,
	min_salario DECIMAL (8, 2) DEFAULT NULL,
	max_salario DECIMAL (8, 2) DEFAULT NULL
);

DROP TABLE IF EXISTS departamento;
CREATE TABLE departamento (
	departamento_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	departamento_name VARCHAR (30) NOT NULL,
	posicao_id INT (11) DEFAULT NULL,
	FOREIGN KEY (posicao_id) REFERENCES posicao (posicao_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS funcionarios; 
CREATE TABLE funcionarios (
	funcionario_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	primeiro_nome VARCHAR (20) DEFAULT NULL,
	sobrenome VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	telefone VARCHAR (20) DEFAULT NULL,
	dataContratacao DATE NOT NULL,
	ocupacao_id INT (11) NOT NULL,
	salario DECIMAL (8, 2) NOT NULL,
	gerente_id INT (11) DEFAULT NULL,
	departamento_id INT (11) DEFAULT NULL,
	FOREIGN KEY (ocupacao_id) REFERENCES ocupacoes (ocupacao_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (departamento_id) REFERENCES departamento (departamento_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (gerente_id) REFERENCES funcionarios (funcionario_id)
);

DROP TABLE IF EXISTS dependentes; 
CREATE TABLE dependentes (
	dependente_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	primeiro_nome VARCHAR (50) NOT NULL,
	sobrenome VARCHAR (50) NOT NULL,
	parentesco VARCHAR (25) NOT NULL,
	funcionario_id INT (11) NOT NULL,
	FOREIGN KEY (funcionario_id) REFERENCES funcionarios (funcionario_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/*Data for the table regiao */
INSERT INTO regiao(regiao_id,regiao_name) VALUES (1,'Europa');
INSERT INTO regiao(regiao_id,regiao_name) VALUES (2,'Americas');
INSERT INTO regiao(regiao_id,regiao_name) VALUES (3,'Asia');
INSERT INTO regiao(regiao_id,regiao_name) VALUES (4,'Sula da Asia ou Africa');

/*Data for the table paises */
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('AR','Argentina',2);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('AU','Australia',3);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('BE','Belgium',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('BR','Brazil',2);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('CA','Canada',2);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('CH','Switzerland',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('CN','China',3);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('DE','Germany',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('DK','Denmark',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('EG','Egypt',4);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('FR','France',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('HK','HongKong',3);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('IL','Israel',4);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('IN','India',3);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('IT','Italy',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('JP','Japan',3);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('KW','Kuwait',4);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('MX','Mexico',2);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('NG','Nigeria',4);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('NL','Netherlands',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('SG','Singapore',3);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('UK','United Kingdom',1);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('US','United States of America',2);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('ZM','Zambia',4);
INSERT INTO paises(pais_id,pais_name,regiao_id) VALUES ('ZW','Zimbabwe',4);

/*Data for the table posicao */
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
INSERT INTO posicao(posicao_id,endereco,cep,cidade,estado,pais_id) VALUES (5400,'Rua Tito, 54','05051-000','São Paulo','São Paulo','BR');

/*Data for the table ocupacoes */
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (1,'Auxiliar de Almoxarifado Júnior',4200.00,9000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (2,'Gerente de contabilidade',8200.00,16000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (3,'Assistente Administrativo',3000.00,6000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (4,'Presidente',20000.00,40000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (5,'Vice-presidente de administração',15000.00,30000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (6,'Contador',4200.00,9000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (7,'Gerente de Finanças',8200.00,16000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (8,'Representante de Recursos Humanos',4000.00,9000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (9,'Desenvolvedor Web',4000.00,10000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (10,'Gerente de Marketing',9000.00,15000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (11,'Representante de Marketing',4000.00,9000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (12,'Relações Públicas',4500.00,10500.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (13,'Escriturário de compras',2500.00,5500.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (14,'Gerente de Compras',8000.00,15000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (15,'Gerente de Vendas',10000.00,20000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (16,'Representante de Vendas',6000.00,12000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (17,'Vendedor',2500.00,5500.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (18,'Estoquista',2000.00,5000.00);
INSERT INTO ocupacoes(ocupacao_id,ocupacao_title,min_salario,max_salario) VALUES (19,'Gerente de Estoque',5500.00,8500.00);


/*Data for the table departamento */
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (1,'Admnistração',1700);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (2,'Marketing',1800);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (3,'Compras',1700);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (4,'Recursos Humanos',2400);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (5,'Transporte',1500);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (6,'Tecnologia',1400);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (7,'Relações Públicas',2700);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (8,'Vendas',2500);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (9,'Executivo',1700);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (10,'Finanças',1700);
INSERT INTO departamento(departamento_id,departamento_name,posicao_id) VALUES (11,'Contabilidade',1700);

/*Data for the table funcionarios */
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (100,'Steven','King','steven.king@momento.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (101,'Neena','Kochhar','neena.kochhar@momento.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (102,'Lex','De Haan','lex.de haan@momento.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (103,'Alexander','Hunold','alexander.hunold@momento.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (104,'Bruce','Ernst','bruce.ernst@momento.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (105,'David','Austin','david.austin@momento.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (106,'Valli','Pataballa','valli.pataballa@momento.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (107,'Diana','Lorentz','diana.lorentz@momento.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (108,'Nancy','Greenberg','nancy.greenberg@momento.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (109,'Daniel','Faviet','daniel.faviet@momento.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (110,'John','Chen','john.chen@momento.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (111,'Ismael','Sciarra','ismael.sciarra@momento.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@momento.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (113,'Luis','Popp','luis.popp@momento.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (114,'Den','Raphaely','den.raphaely@momento.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (115,'Alexander','Khoo','alexander.khoo@momento.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (116,'Shelli','Baida','shelli.baida@momento.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (117,'Sigal','Tobias','sigal.tobias@momento.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (118,'Guy','Himuro','guy.himuro@momento.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (119,'Karen','Colmenares','karen.colmenares@momento.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (120,'Matthew','Weiss','matthew.weiss@momento.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (121,'Adam','Fripp','adam.fripp@momento.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (122,'Payam','Kaufling','payam.kaufling@momento.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (123,'Shanta','Vollman','shanta.vollman@momento.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@momento.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (145,'John','Russell','john.russell@momento.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (146,'Karen','Partners','karen.partners@momento.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (176,'Jonathon','Taylor','jonathon.taylor@momento.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (177,'Jack','Livingston','jack.livingston@momento.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (178,'Kimberely','Grant','kimberely.grant@momento.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (179,'Charles','Johnson','charles.johnson@momento.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (192,'Sarah','Bell','sarah.bell@momento.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (193,'Britney','Everett','britney.everett@momento.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (200,'Jennifer','Whalen','jennifer.whalen@momento.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (201,'Michael','Hartstein','michael.hartstein@momento.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (202,'Pat','Ferreira','pat.Ferreira@momento.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (203,'Susan','Mavris','susan.mavris@momento.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (204,'Hermann','Baer','hermann.baer@momento.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (205,'Shelley','Higgins','shelley.higgins@momento.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO funcionarios(funcionario_id,primeiro_nome,sobrenome,email,telefone,dataContratacao,ocupacao_id,salario,gerente_id,departamento_id) VALUES (206,'William','Gietz','william.gietz@momento.org','515.123.8181','1994-06-07',1,8300.00,205,11);

/*Data for the table dependentes */
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (1,'Penelope','Gietz','Filho(a)',206);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (2,'Nick','Higgins','Filho(a)',205);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (3,'Ed','Whalen','Filho(a)',200);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (4,'Alice','King','Filho(a)',100);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (31,'Jennifer','King','Cônjuge',100);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (5,'Johnny','Kochhar','Filho(a)',101);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (6,'Bette','De Haan','Filho(a)',102);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (7,'Grace','Faviet','Filho(a)',109);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (8,'Matthew','Chen','Filho(a)',110);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (9,'Joe','Sciarra','Filho(a)',111);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (10,'Christian','Urman','Filho(a)',112);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (11,'Zero','Popp','Filho(a)',113);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (12,'Karl','Greenberg','Filho(a)',108);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (13,'Duas','Mavris','Filho(a)',203);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (32,'Uma','Mavris','Cônjuge',203);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (14,'Vivien','Hunold','Filho(a)',103);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (15,'Cuba','Ernst','Filho(a)',104);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (33,'Salvadora','Ernst','Cônjuge',104);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (16,'Fred','Austin','Filho(a)',105);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (17,'Helen','Pataballa','Filho(a)',106);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (18,'Dan','Lorentz','Filho(a)',107);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (19,'Bob','Hartstein','Filho(a)',201);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (20,'Lucie','Ferreira','Filho(a)',202);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (21,'Kirsten','Baer','Filho(a)',204);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (22,'Elvis','Khoo','Filho(a)',115);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (23,'Sandra','Baida','Filho(a)',116);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (24,'Cameron','Tobias','Filho(a)',117);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (25,'Kevin','Himuro','Filho(a)',118);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (26,'Rip','Colmenares','Filho(a)',119);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (27,'Julia','Raphaely','Filho(a)',114);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (28,'Woody','Russell','Filho(a)',145);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (29,'Alec','Partners','Filho(a)',146);
INSERT INTO dependentes(dependente_id,primeiro_nome,sobrenome,parentesco,funcionario_id) VALUES (30,'Sandra','Taylor','Filho(a)',176);

-- Respostas do exercício

-- 1
-- Inserindo os meus dados
insert into funcionarios values(208, 'Fabiola', 'Costa', 'fabiola.costa@gmail.com', '987.703.819', '2002-08-05', '9', '5000.00', '103', '6');
select * from funcionarios where funcionario_id = 208;

-- 2
-- Inserindo os dados dos integrantes do meu grupo demoday
insert into funcionarios values(209, 'Vitoria', 'Santos', 'vitoria.santos@gmail.com', '991.025.599', '2002-08-29', '3', '4500.00', '101', '1');
insert into funcionarios values(210, 'Victor', 'Pérez', 'victor.perez@gmail.com', '945.961.147', '2002-07-05', '3', '4500.00', '101', '1');
insert into funcionarios values(211, 'Richard', 'Alves', 'richard.alves@gmail.com', '978.125.020', '2002-08-15', '3', '4500.00', '101', '1');
insert into funcionarios values(212, 'Kauã', 'Melo', 'kaua.melo@gmail.com', '978.156.751', '2002-08-20', '3', '4500.00', '101', '1');
insert into funcionarios values(213, 'Ítalo', 'Sousa', 'italo.sousa@gmail.com', '987.154.964', '2002-07-05', '3', '4500.00', '101', '1');
insert into funcionarios values(214, 'Gustavo', 'Goulart', 'gustavo.goulart@gmail.com', '910.654.448', '2002-07-25', '3', '4500.00', '101', '1');
insert into funcionarios values(215, 'Filipe', 'Damasceno', 'filipe.damascenoz@gmail.com', '980.065.748', '2002-08-17', '3', '4500.00', '101', '1');
select * from funcionarios where salario = 4500.00;

-- 3
-- Fazendo a conta de quantos funcionários tem na empresa
select count(*) from funcionarios;

-- 4
-- Fazendo a conta de quantos funcionários tem no departamento de finanças 
select count(*) from funcionarios where departamento_id = 10;

-- 5
-- Fazendo a média salarial do departamento de tecnologia

select avg(salario) from funcionarios where departamento_id = 6;

-- 6
-- Fazendo a soma de quanto o departamento de transportes gasta em salários
select sum(salario) from funcionarios where departamento_id = 5;

-- 7
-- Inserindo um novo departamento chamado inovação, que está locado no Brasil
insert into departamento value (12, 'Inovação', '5400'); 

-- 8
-- Inserindo três novos funcionários no departamento inovação. E adicionando dependentes para esses novos funcionários
select avg(salario) from funcionarios where departamento_id = 1 or departamento_id = 10;

insert into funcionarios values(216, 'William', 'Ferreira', 'william.ferreira@gmail.com', '980.065.748', '2002-10-25', '9', '6250.00', '101', '1');
insert into dependentes values(34, 'Inara', 'Ferreira', 'Cônjuge', 216);
insert into dependentes values(35, 'Gabriel', 'Ferreira', 'Filho(o)', 216);

insert into funcionarios values(217, 'Fernanda', 'Lima', 'fernanda.lima@gmail.com', '987.789.554', '2002-10-25', '9', '6250.00', '101', '1');
insert into dependentes values(36, 'Rodrigo', 'Lima', 'Cônjuge', 217);

insert into ocupacoes values(20, 'Gerente de Departamento', '4000.00', '8000.00');
insert into funcionarios values(218, 'Fabiana', 'Raulino', 'fabiana.raulino@gmail.com', '905.740.889', '2002-10-25', '20', '6250.00', '104', '12');
insert into dependentes values(37, 'Jorge', 'Raulino', 'Cônjuge', 218);
insert into dependentes values(38, 'Laura', 'Raulino', 'Filho(a)', 218);
insert into dependentes values(39, 'Maya', 'Raulino', 'Filho(a)', 218);

-- 9
-- SElecionando todas as regiões em que a empresa atua acompanhadas de seus países.
select paises.pais_name, regiao.regiao_name from paises inner join regiao on paises.regiao_id = regiao.regiao_id;

-- 10
-- Selecionando o pai do Joe Sciarra
select funcionarios.primeiro_nome, funcionarios.sobrenome from dependentes inner join funcionarios on dependentes.funcionario_id = funcionarios.funcionario_id where dependentes.primeiro_nome like'%Joe%' and dependentes.sobrenome like '%Sciarra%';

-- 11
-- Selecionando o filho do Jose Manuel
select dependentes.primeiro_nome, dependentes.parentesco from dependentes inner join funcionarios on dependentes.funcionario_id = funcionarios.funcionario_id where funcionarios.primeiro_nome like 'Jose Manuel';

-- 12
-- Verificando qual região possui mais países
select regiao.regiao_name, count(paises.regiao_id) from paises inner join regiao on regiao.regiao_id = paises.regiao_id group by regiao.regiao_id;

select regiao.regiao_name, count(paises.regiao_id) as quantidade from paises inner join regiao on regiao.regiao_id = paises.regiao_id group by paises.regiao_id order by quantidade desc, paises.regiao_id desc limit 1;

-- 13 
-- Selecionando todos os funcionários acompanhado de seus dependentes.
select funcionarios.primeiro_nome, dependentes.primeiro_nome, dependentes.sobrenome, dependentes.parentesco from funcionarios inner join dependentes on funcionarios.funcionario_id = dependentes.funcionario_id order by funcionarios.primeiro_nome;

-- 14
-- Verificando se Karen Partners possui um cônjuge?
select funcionarios.primeiro_nome, dependentes.parentesco, dependentes.primeiro_nome from funcionarios inner join dependentes on funcionarios.funcionario_id = dependentes.funcionario_id where funcionarios.primeiro_nome like '%Karen%' and funcionarios.sobrenome like '%Partners%';

-- 17
-- Inserindo um novo departamento analista de software locado nos Estados Unidos.
insert into departamento values ('13', 'Analista de Software', '1700');
select * from departamento where departamento_id = 13;



