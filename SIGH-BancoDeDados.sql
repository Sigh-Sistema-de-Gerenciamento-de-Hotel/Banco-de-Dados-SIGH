-- -----------------------------------------------------
-- Drop Database
-- -----------------------------------------------------
DROP DATABASE IF EXISTS sigh;

-- -----------------------------------------------------
-- Create Database
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS sigh;

-- -----------------------------------------------------
-- Use Database
-- -----------------------------------------------------
USE sigh;

-- -----------------------------------------------------
-- Table   `enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `enderecos` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `cep` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `numero` INT NULL,
  PRIMARY KEY (`id_endereco`));


-- -----------------------------------------------------
-- Table   `hospedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `hospedes` (
  `id_hospede` INT NOT NULL AUTO_INCREMENT,
  `primeiro_nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(100) NOT NULL,
  `nome_social` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `cpf` INT NULL,
  `passaporte` VARCHAR(8) NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  `id_endereco` INT NOT NULL,
  `id_responsavel` INT NULL,
  PRIMARY KEY (`id_hospede`),
  CONSTRAINT `fk_hospedes_enderecos`
    FOREIGN KEY (`id_endereco`)
    REFERENCES   `enderecos` (`id_endereco`),
  CONSTRAINT `fk_hospedes_hospedes1`
    FOREIGN KEY (`id_responsavel`)
    REFERENCES   `hospedes` (`id_hospede`));


-- -----------------------------------------------------
-- Table   `necessidades_especiais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `necessidades_especiais` (
  `id_necessidade` INT NOT NULL AUTO_INCREMENT,
  `necessidade_especial` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_necessidade`));


-- -----------------------------------------------------
-- Table   `hospedagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `hospedagens` (
  `id_hospedagem` INT NOT NULL AUTO_INCREMENT,
  `data_entrada` DATE NOT NULL,
  `data_saida` DATE NULL,
  PRIMARY KEY (`id_hospedagem`));


-- -----------------------------------------------------
-- Table   `quartos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `quartos` (
  `id_quarto` INT NOT NULL,
  `conserto` TINYINT NOT NULL,
  `limpeza` TINYINT NOT NULL,
  `acessibilidade` VARCHAR(45) NOT NULL,
  `banheira` TINYINT NOT NULL,
  `frigobar` TINYINT NOT NULL,
  `ar_condicionado` TINYINT NOT NULL,
  `preco` FLOAT NOT NULL,
  `nummax_hospedes` INT NOT NULL,
  `num_cama_solteiro` INT NOT NULL,
  `num_cama_casal` INT NOT NULL,
  PRIMARY KEY (`id_quarto`));


-- -----------------------------------------------------
-- Table   `hospede_hospedagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `hospede_hospedagem` (
  `id_hospede_hospedagem` INT NOT NULL AUTO_INCREMENT,
  `id_hospedagem` INT NOT NULL,
  `id_hospede` INT NOT NULL,
  `id_quarto` INT NOT NULL,
  PRIMARY KEY (`id_hospede_hospedagem`),
  CONSTRAINT `fk_hospede_hospedagem_hospedagens1`
    FOREIGN KEY (`id_hospedagem`)
    REFERENCES   `hospedagens` (`id_hospedagem`),
  CONSTRAINT `fk_hospede_hospedagem_hospedes1`
    FOREIGN KEY (`id_hospede`)
    REFERENCES   `hospedes` (`id_hospede`),
  CONSTRAINT `fk_hospede_hospedagem_quartos1`
    FOREIGN KEY (`id_quarto`)
    REFERENCES   `quartos` (`id_quarto`));

-- -----------------------------------------------------
-- Table   `departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `departamentos` (
  `id_departamento` INT NOT NULL,
  `nome_departamento` VARCHAR(45) NOT NULL, 
  PRIMARY KEY (`id_departamento`));

-- -----------------------------------------------------
-- Table   `pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `pedidos` (
  `id_pedidos` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `horario` TIME NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `feito` TINYINT NULL,
  `id_hospedagem` INT NOT NULL,
  `id_quarto` INT NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_pedidos`),
  CONSTRAINT `fk_pedidos_hospedagens1`
    FOREIGN KEY (`id_hospedagem`)
    REFERENCES   `hospedagens` (`id_hospedagem`),
  CONSTRAINT `fk_pedidos_quartos1`
    FOREIGN KEY (`id_quarto`)
    REFERENCES   `quartos` (`id_quarto`),
  CONSTRAINT `fk_pedidos_departamentos1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `departamentos` (`id_departamento`));


-- -----------------------------------------------------
-- Table   `necessidades_hospede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `necessidades_hospede` (
  `id_necessidade_hospede` INT NOT NULL AUTO_INCREMENT,
  `id_hospede` INT NOT NULL,
  `id_necessidade` INT NOT NULL,
  PRIMARY KEY (`id_necessidade_hospede`),
  CONSTRAINT `fk_hospedes_has_necessidades_especiais_hospedes1`
    FOREIGN KEY (`id_hospede`)
    REFERENCES   `hospedes` (`id_hospede`),
  CONSTRAINT `fk_hospedes_has_necessidades_especiais_necessidades_especiais1`
    FOREIGN KEY (`id_necessidade`)
    REFERENCES   `necessidades_especiais` (`id_necessidade`));




-- -----------------------------------------------------
-- Table   `cargos`
-- -----------------------------------------------------
/*CREATE TABLE IF NOT EXISTS   `cargos` (
  `id_cargo` INT NOT NULL,
  `nome_cargo` VARCHAR(45) NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_cargo`),
  CONSTRAINT `fk_cargos_departamentos1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES   `departamentos` (`id_departamento`));*/

-- -----------------------------------------------------
-- Table   `usuarios_senhas`
-- -----------------------------------------------------
/*CREATE TABLE IF NOT EXISTS   `usuarios_senhas` (
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario`),
  UNIQUE KEY unique_usuario(usuario));*/
  
-- -----------------------------------------------------
-- Table   `funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS   `funcionarios` (
  `id_funcionario` INT NOT NULL,
  `primeiro_nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `nome_social` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_funcionario`));

-- inserts enderecos 
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (12345, 'Geórgia', 'San Jose', 'PO Box 40575', null, 7253);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (5488820, 'santa Catarina', 'Whittttier', 'Suite 1', null, null);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (478, 'Callifornia', 'Palmdalee', 'om 206', 'Casa', 9351);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (852, 'Parana', 'San Diego', 'Room 152', 'Casa', 8368);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (165, 'São Paulo', 'Whittier', 'PO Box 59348', 'Casa', 8200);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (154,  'California', 'Santa Ana', 'PO Box 9725', 'Casa', 8770);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (154, 'Rio Grande do Sul', 'Santa Rosa', 'PO Box 92409', 'Casa', 7858);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (254, 'Texas', 'Los Angeles', 'PO Box 92328', 'casa', 3335);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (265,  'Flórida', 'Van Nuys', 'PO Box 65611', 'Casa', 8670);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (7894,  'California', 'Fresno', '22nd Floor', 'Caasa', 6076);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (222, 'Rio de Janeiro', 'Corona', '3rd Floor', 'Casa', 9156);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (745, 'Rio de Janneiro', 'Santa Cruz', 'Apt 1345', 'casa', 9909);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (0154, 'California', 'Long Beach', 'Apt 1009', 'Casa', 7464);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (5210, 'São Paulo', 'Garden Grove', '9th Floor', 'Casa', 9056);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (202165, 'São Paulo', 'San Rafael', 'PO Box 18784', 'Casa', 8144);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (65, 'Minas Gerais', 'Garden Grove', 'Suite 22', 'Casa', 5413);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (2156, 'Colorado', 'Sannnta Barbara', 'Suite 812', 'Casa', 8627);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (3265, 'Havai', 'Richmond', 'Suite 39', 'Cassa', 6414);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (02515641, 'Virginia', 'Simi Valley', 'Room 240', null, null);
insert into enderecos (cep, estado, cidade, endereco, complemento, numero) values (215610, 'California', 'Long Beach', 'PO Box 73200', 'Casa', 2920);

--------------------------------------------------------------------------------------------------------------------

-- inserts hospedes
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Beee', 'Wettter', null, 'Female', '2002-11-10', 'United states', null, 'us038789', 'pwetter0@irs.gov', 477748784, 1, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Josefina', 'Canby', null,'Genderfluid', '2003-02-25', 'Brazil', 875492836, 'ws637030', 'wcanby1@exblog.jp', 085921159, 2, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Addie', 'Garretts', 'Del', 'Female', '2004-01-14', 'Canada', null, 'hg403564', 'dgarretts2@vk.com', 732425848, 3, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Hesthher', 'Meletti', null, 'Genderqueer', '2003-02-08', 'Dominican Republic', null, 'kl267763', 'gmeletti3@indiatimes.com', 368262143, 4, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Aldwin', 'Peltzer', null, 'Male', '2003-05-07', 'Canada', null, 'ki635763', 'apeltzer4@ebay.com', 489161905, 5, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Israel', 'Trotman', null, 'Genderfluid', '2003-05-02', 'United States', null, 'lo316878', 'jtrotman5@mlb.com', 450432754, 6, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Fredra', 'Kliemann', null, 'Female', '2023-04-24', 'Brazil', 581063453, null, 'lkliemann6@sun.com', 189156511, 7, 3);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Zitella', 'Masarrat', null, 'Female', '2002-09-12', 'Brazil', 511874202, 'mk667060', 'smasarrat7@umich.edu', 891477005, 8, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Byram', 'Turland', 'Georgia', 'Polygender', '2002-06-28', 'Germany', null, 'ki645682', 'gturland8@mozilla.com', 864143915, 9, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Hildagard', 'Blethin', null, 'Female', '2023-02-04', 'Portugal', null, 'ol172005', 'lblethin9@bbb.org', 965583221, 10, 8);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Berkley', 'Fishlee', null, 'Male', '2000-02-01', 'Brasil', 896846771, null, 'sfishleea@tuttocitta.it', 716970713, 11, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Dukey', 'Craigs', null, 'Male', '1952-06-03', 'Brazil', 418376975, null, 'ecraigsb@pinterest.com', 329735772, 12, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Carolyne', 'Hrishchenko', null, 'Female', '2023-02-12', 'Brazil', 317234416,'ji598213', 'ahrishchenkoc@hp.com', 832475583, 13, 11);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Arabel', 'Heugle', 'Nixiie', 'Female', '2023-11-06', 'United States', null, 'ko401110', 'nheugled@sakura.ne.jp', 649333207, 14, 12);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Kayley', 'Cawsy', null, 'Female', '2023-02-07', 'Germany', null, 'ki985030', 'acawsye@prlog.org', 288564037, 15, 12);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Carmella', 'Houliston', null, 'Female', '1958-06-03', 'Portugal', null, 'ju270959', 'khoulistonf@foxnews.com', 121032215, 16, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Fabian', 'Poupard', null, 'Malee', '2023-06-03', 'Brazil', 745065736, null, 'epoooupardg@reverbnation.com', 796711112, 17, 16);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Alexandra', 'Rochelle', null, 'Femalle', '1990-09-10', 'Uruguay', null, 'dr428661', 'crochelleh@wsj.com', 319674200, 18, null);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Aundrea', 'Bonicelli', null, 'Female', '2023-12-03', 'Portugal', null, 'sw043537', 'nbonicellii@ask.com', 128297256, 19, 18);
insert into hospedes (primeiro_nome, sobrenome, nome_social, genero, data_nascimento, nacionalidade, cpf, passaporte, email, telefone, id_endereco, id_responsavel) values ('Quinlan', 'Tregensoe', null, 'Male', '1989-05-19', 'Brazil', 764965966, 'se327774', 'ctregensoej@mac.com', 519622918, 20, null);

--------------------------------------------------------------------------------------------------------------------

-- inserts quartos 
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (980, '1', '1', 'SIM', '1', '1', '1', '194.64', 4, 3, 4);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (378, '1', '0', 'NÃO', '1', '1', '0', '271.49', 3, 2, 2);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (554, '0', '0', 'SIM', '1', '0', '1', '142.93', 6, 3, 3);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (178, '1', '0', 'SIM', '1', '0', '0', '175.98', 3, 4, 4);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (869, '0', '0', 'SIM', '1', '0', '1', '139.01', 5, 5, 5);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (278, '1', '0', 'NÃO', '1', '0', '0', '269.66', 6, 6, 6);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (924, '0', '1', 'SIM', '1', '0', '1', '168.32', 7, 7, 7);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (894, '1', '0', 'SIM', '1', '0', '1', '171.11', 8, 8, 8);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (609, '1', '0', 'NÃO', '0', '1', '1', '211.21', 9, 9, 9);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (606, '0', '1', 'NÃO', '0', '1', '0', '147.53', 5, 5, 5);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (681, '0', '1', 'SIM', '0', '1', '1', '156.86', 1, 1, 1);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (857, '0', '1', 'SIM', '0', '1', '1', '225.53', 4, 1, 1);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (610, '0', '1', 'SIM', '0', '1', '1', '168.31', 3, 2, 2);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (301, '0', '1', 'SIM', '0', '1', '0', '126.79', 1, 1, 1);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (978, '0', '1', 'SIM', '0', '1', '0', '218.80', 4, 3, 4);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (129, '0', '1', 'SIM', '0', '1', '1', '226.83', 3, 2, 2);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (864, '1', '1', 'SIM', '0', '1', '1', '187.76', 5, 5, 5);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (685, '1', '0', 'NÃO', '0', '1', '0', '245.93', 4, 2, 4);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (183, '1', '0', 'NÃO', '0', '1', '0', '108.83', 3, 2, 2);
insert into quartos (id_quarto , conserto, limpeza, acessibilidade, banheira, frigobar, ar_condicionado , preco, nummax_hospedes, num_cama_solteiro, num_cama_casal) values (533, '0', '1', 'SIM', '1', '0', '1', '194.75', 4, 3, 4);

--------------------------------------------------------------------------------------------------------------------

-- inserts hospedagens 
insert into hospedagens (data_entrada, data_saida) values ('2023-08-15', null);
insert into hospedagens (data_entrada, data_saida) values ('2023-03-14', '2022-03-17');
insert into hospedagens (data_entrada, data_saida) values ('2023-01-14', '2022-01-23');
insert into hospedagens (data_entrada, data_saida) values ('2022-09-28', '2022-09-30');
insert into hospedagens (data_entrada, data_saida) values ('2023-06-17', '2023-06-19');
insert into hospedagens (data_entrada, data_saida) values ('2023-08-04', '2023-08-05');
insert into hospedagens (data_entrada, data_saida) values ('2022-04-19', '2022-04-21');
insert into hospedagens (data_entrada, data_saida) values ('2023-04-16', '2022-04-18');
insert into hospedagens (data_entrada, data_saida) values ('2022-08-27', '2022-09-01');
insert into hospedagens (data_entrada, data_saida) values ('2022-12-06', '2022-12-08');
insert into hospedagens (data_entrada, data_saida) values ('2022-08-30', '2022-08-02');
insert into hospedagens (data_entrada, data_saida) values ('2022-01-03', '2023-01-05');
insert into hospedagens (data_entrada, data_saida) values ('2023-08-10', '2022-08-12');
insert into hospedagens (data_entrada, data_saida) values ('2023-10-05', '2022-10-08');
insert into hospedagens (data_entrada, data_saida) values ('2022-03-05', '2022-03-09');
insert into hospedagens (data_entrada, data_saida) values ('2022-07-21', '2022-07-25');
insert into hospedagens (data_entrada, data_saida) values ('2022-03-10', '2023-03-16');
insert into hospedagens (data_entrada, data_saida) values ('2023-02-02', '2023-02-03');
insert into hospedagens (data_entrada, data_saida) values ('2023-05-15', '2022-05-20');
insert into hospedagens (data_entrada, data_saida) values ('2024-02-02', null);
--------------------------------------------------------------------------------------------------------------------

-- inserts hospede_hospedagem
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (1, 1, 980);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (2, 2, 378);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (3, 3, 554);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (4, 4, 178);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (5, 5, 869);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (6, 6, 924);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (6, 7, 924);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (8, 8, 894);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (9, 9, 609);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (10, 10, 606);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (11, 11, 681);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (12, 12, 857);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (13, 13, 610);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (14, 14, 301);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (15, 15, 978);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (16, 16, 129);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (17, 17, 864);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (18, 18, 685);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (19, 19, 183);
insert into hospede_hospedagem (id_hospedagem, id_hospede, id_quarto) values (20, 20, 533);

--------------------------------------------------------------------------------------------------------------------

-- inserts necessidades_especiais 
insert into necessidades_especiais (necessidade_especial) values ('Intolerância a Lactosi');
insert into necessidades_especiais (necessidade_especial) values ('Deficiências visual');
insert into necessidades_especiais (necessidade_especial) values ('Deficiência Auditiva');
insert into necessidades_especiais (necessidade_especial) values ('Deficiência Motora');
insert into necessidades_especiais (necessidade_especial) values ('Paralisia cerebral ');
insert into necessidades_especiais (necessidade_especial) values ('Transtorno Bipolares');
insert into necessidades_especiais (necessidade_especial) values ('Esquizofrania');
insert into necessidades_especiais (necessidade_especial) values ('Síndrome de down');
insert into necessidades_especiais (necessidade_especial) values ('Doença Selíaca');
insert into necessidades_especiais (necessidade_especial) values ('Intolerância ao gluten');
insert into necessidades_especiais (necessidade_especial) values ('Intolerância a Sacarouse');
insert into necessidades_especiais (necessidade_especial) values ('Intolerância ao milho');
insert into necessidades_especiais (necessidade_especial) values ('Intolerância a castanhas');
insert into necessidades_especiais (necessidade_especial) values ('Paraplegeia');
insert into necessidades_especiais (necessidade_especial) values ('Monoplegia');
insert into necessidades_especiais (necessidade_especial) values ('Amputição');
insert into necessidades_especiais (necessidade_especial) values ('Tatraplegia');
insert into necessidades_especiais (necessidade_especial) values ('Triplegia');
insert into necessidades_especiais (necessidade_especial) values ('Hemiplegia');
insert into necessidades_especiais (necessidade_especial) values ('Talidomide');


--------------------------------------------------------------------------------------------------------------------

-- inserts necessidades_hospede 
insert into necessidades_hospede (id_hospede, id_necessidade) values (1, 1);
insert into necessidades_hospede (id_hospede, id_necessidade) values (2, 2);
insert into necessidades_hospede (id_hospede, id_necessidade) values (3, 3);
insert into necessidades_hospede (id_hospede, id_necessidade) values (4, 4);
insert into necessidades_hospede (id_hospede, id_necessidade) values (5, 5);
insert into necessidades_hospede (id_hospede, id_necessidade) values (6, 6);
insert into necessidades_hospede (id_hospede, id_necessidade) values (7, 7);
insert into necessidades_hospede (id_hospede, id_necessidade) values (8, 8);
insert into necessidades_hospede (id_hospede, id_necessidade) values (9, 9);
insert into necessidades_hospede (id_hospede, id_necessidade) values (10, 10);
insert into necessidades_hospede (id_hospede, id_necessidade) values (11, 11);
insert into necessidades_hospede (id_hospede, id_necessidade) values (12, 12);
insert into necessidades_hospede (id_hospede, id_necessidade) values (13, 13);
insert into necessidades_hospede (id_hospede, id_necessidade) values (14, 14);
insert into necessidades_hospede (id_hospede, id_necessidade) values (15, 15);
insert into necessidades_hospede (id_hospede, id_necessidade) values (16, 16);
insert into necessidades_hospede (id_hospede, id_necessidade) values (17, 17);
insert into necessidades_hospede (id_hospede, id_necessidade) values (18, 18);
insert into necessidades_hospede (id_hospede, id_necessidade) values (19, 19);
insert into necessidades_hospede (id_hospede, id_necessidade) values (20, 1);

--------------------------------------------------------------------------------------------------------------------

/*-- inserts usuarios_senhas 
insert into usuarios_senhas (usuario, senha) values ('adm', 'adm');
insert into usuarios_senhas (usuario, senha) values ('a', 'bL6.?8O6"4/');
insert into usuarios_senhas (usuario, senha) values ('b', 'kQ4>5ILf');
insert into usuarios_senhas (usuario, senha) values ('c', 'lO0"ISW/ild');
insert into usuarios_senhas (usuario, senha) values ('d', 'eZ7.v~!v');
insert into usuarios_senhas (usuario, senha) values ('e', 'vN8(CQ>nFa9');
insert into usuarios_senhas (usuario, senha) values ('f', 'jQ9!kAL4`d.');
insert into usuarios_senhas (usuario, senha) values ('g', 'hN1)1gAq$4H');
insert into usuarios_senhas (usuario, senha) values ('h', 'mE4!WaRyC@*');
insert into usuarios_senhas (usuario, senha) values ('i', 'jJ1$XkFOEQ');
insert into usuarios_senhas (usuario, senha) values ('j', 'rK1@&|B$M');
insert into usuarios_senhas (usuario, senha) values ('k', 'cA0|y~!1Ldn@JgMK');
insert into usuarios_senhas (usuario, senha) values ('l', 'zG9)fz%)x9"mRJY');
insert into usuarios_senhas (usuario, senha) values ('m', 'rJ4(BI&J');
insert into usuarios_senhas (usuario, senha) values ('n', 'uZ6$h+"b%x');
insert into usuarios_senhas (usuario, senha) values ('o', 'lP8#(rdO59$O5');
insert into usuarios_senhas (usuario, senha) values ('p', 'pP9&\KAK.>y/3eg');
insert into usuarios_senhas (usuario, senha) values ('q', 'xK1+pH\4uLHt+&');
insert into usuarios_senhas (usuario, senha) values ('r', 'uK2$993yYoS0l29');
insert into usuarios_senhas (usuario, senha) values ('s', 'jC6,$jI%t+&');*/

--------------------------------------------------------------------------------------------------------------------

-- inserts departamentos 
insert into departamentos (id_departamento, nome_departamento) values (12, 'Limpeza');
insert into departamentos (id_departamento, nome_departamento) values (13, 'Manutenção');
insert into departamentos (id_departamento, nome_departamento) values (14, 'Recepção');

--------------------------------------------------------------------------------------------------------------------

-- inserts funcionarios
insert into funcionarios (id_funcionario, primeiro_nome, sobrenome, nome_social, cargo, usuario, senha) values (1, 'adm', 'adm', null, 'ADM', 'adm', 'adm');
insert into funcionarios (id_funcionario, primeiro_nome, sobrenome, nome_social, cargo, usuario, senha) values (2, 'Halimeda', 'Rase', null, "Faxineira", 'a', 'bL6.?8O6"4/');
insert into funcionarios (id_funcionario, primeiro_nome, sobrenome, nome_social, cargo, usuario, senha) values (3, 'Faina', 'Hullins', null, "Eletricista", 'b', 'kQ4>5ILf');
insert into funcionarios (id_funcionario, primeiro_nome, sobrenome, nome_social, cargo, usuario, senha) values (4, 'Ruthann', 'Housbie', 'Carla', "Recepcionista", 'c', 'lO0"ISW/ild');

--------------------------------------------------------------------------------------------------------------------

-- inser pedidos
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-04-21', '11:10:14', 'Limpeza', 0, 1, 980, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-03-09', '04:07:43', 'Trocar lampada', 1, 1, 980, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-09-28', '13:53:43', 'Limpeza completa', 1, 20, 533, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-04-27', '14:48:22', 'Toalhas extras', 0, 12, 857, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-10-28', '04:02:59', 'Trocar lampadas', 1, 2, 378, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-01-29', '02:53:02', 'Trocar roupa de cama', 1, 9, 609, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-03-17', '02:22:44', 'Arrumar chuveiro', 1, 20, 533, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-08-25', '12:01:25', 'Vazamento na pia do baheiro', 0, 13, 610, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-09-15', '13:26:43', 'Limpeza', 0, 16, 129, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-01-31', '13:09:37', 'Trocar roupa de cama', 1, 4, 178, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-10-24', '13:29:23', 'Arrumar cama quebrada', 1, 14, 301, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-07-18', '18:30:17', 'Trocas lampadas', 1, 6, 924, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-01-14', '13:36:52', 'Problema no alarme de incendio', 1, 14, 301, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-09-06', '14:25:35', 'Chuveiro não esquenta', 0, 4, 178, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-01-03', '03:02:27', 'Limpeza', 1, 10, 606, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-10-18', '11:47:07', 'Limpeza', 0, 6, 924, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-05-06', '13:34:38', 'Limpeza completa', 1, 6, 924, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-07-07', '13:01:37', 'Trocar toalhas e roupa de cama', 1, 18, 685, 12); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-09-23', '16:18:08', 'Porta emperrada', 1, 17, 864, 13); 
insert into pedidos (data, horario, descricao, feito, id_hospedagem, id_quarto, id_departamento) values ('2023-01-30', '22:43:12', 'Janela quebrada', 0, 3, 554, 13);

--------------------------------------------------------------------------------------------------------------------

-- select count 

SELECT COUNT(*) FROM enderecos;

SELECT COUNT(*) FROM hospedes;

SELECT COUNT(*) FROM hospede_hospedagem;

SELECT COUNT(*) FROM quartos;

SELECT COUNT(*) FROM necessidades_especiais;

SELECT COUNT(*) FROM hospedagens ;

SELECT COUNT(*) FROM necessidades_hospede; 

/*SELECT COUNT(*) FROM usuarios_senhas;*/

SELECT COUNT(*) FROM departamentos;

/*SELECT COUNT(*) FROM cargos;*/

SELECT COUNT(*) FROM funcionarios;

SELECT COUNT(*) FROM pedidos;

--------------------------------------------------------------------------------------------------------------------

-- select all

SELECT * FROM enderecos ORDER BY id_endereco;

SELECT * FROM hospedes ORDER BY id_hospede;

SELECT * FROM hospede_hospedagem ORDER BY id_hospede_hospedagem;

SELECT * FROM quartos ORDER BY id_quarto;

SELECT * FROM necessidades_especiais ORDER BY id_necessidade;

SELECT * FROM hospedagens ORDER BY id_hospedagem;

SELECT * FROM necessidades_hospede ORDER BY id_necessidade_hospede; 

-- SELECT * FROM usuarios_senhas ORDER BY usuario;

SELECT * FROM departamentos ORDER BY id_departamento;

SELECT * FROM funcionarios ORDER BY id_funcionario;

SELECT * FROM pedidos ORDER BY id_pedidos;

-- select join para toda a tabelas com chave estrangeira 

SELECT 
    necessidades_hospede.id_necessidade_hospede,
    necessidades_hospede.id_hospede,
    necessidades_hospede.id_necessidade 
FROM 
	necessidades_hospede
INNER JOIN hospedes ON hospedes.id_hospede = necessidades_hospede.id_hospede
INNER JOIN necessidades_especiais ON necessidades_especiais.id_necessidade = necessidades_hospede.id_necessidade;

-----------------------------------------------------------------------------------------------------------------------

SELECT 
       hospede_hospedagem.id_hospedagem,
       hospede_hospedagem.id_hospede,
       hospede_hospedagem.id_quarto
FROM
       hospede_hospedagem
INNER JOIN hospedagens ON hospede_hospedagem.id_hospedagem = hospedagens.id_hospedagem
INNER JOIN hospedes ON hospede_hospedagem.id_hospede = hospedes.id_hospede
INNER JOIN quartos ON hospede_hospedagem.id_quarto = quartos.id_quarto;

--------------------------------------------------------------------------------------------------------------------

/*SELECT 
       funcionarios.primeiro_nome,
       funcionarios.id_cargo,
       funcionarios.usuario
FROM 
       funcionarios
INNER JOIN cargos ON funcionarios.id_cargo = cargos.id_cargo
INNER JOIN usuarios_senhas ON funcionarios.usuario = usuarios_senhas.usuario;*/

--------------------------------------------------------------------------------------------------------------------

-- select join pedidos
SELECT * FROM pedidos 
INNER JOIN hospedagens ON pedidos.id_hospedagem = hospedagens.id_hospedagem
INNER JOIN quartos ON quartos.id_quarto = pedidos.id_quarto
INNER JOIN departamentos ON departamentos.id_departamento = pedidos.id_departamento;

--------------------------------------------------------------------------------------------------------------------

-- updates enderecos
SET SQL_SAFE_UPDATES = 0;
UPDATE enderecos SET estado = 'California', cidade = 'San Jose'  WHERE id_endereco = 1;
UPDATE enderecos SET estado = 'Santa Catarina', cidade = 'Whittier'  WHERE id_endereco = 2;
UPDATE enderecos SET complemento = 'Casa', numero = 3735 WHERE id_endereco = 8;
UPDATE enderecos SET complemento = 'Casa', estado = 'Rio de Janeiro' WHERE id_endereco = 12;
UPDATE enderecos SET endereco = 'Room 206', cidade = 'Palmdale' WHERE id_endereco = 3;
UPDATE enderecos SET endereco = '2nd Floor', complemento = 'Casa' WHERE id_endereco = 10;
UPDATE enderecos SET complemento = 'Casa', estado = 'Havaí' WHERE id_endereco = 18;
UPDATE enderecos SET endereco = '9th Floor', cidade = 'Garden Grove' WHERE id_endereco = 14;
UPDATE enderecos SET estado = 'Virgínia', cidade = 'Long Beach' WHERE id_endereco = 19;
UPDATE enderecos SET cidade = 'Santa Barbara', endereco = 'Suite 8' WHERE id_endereco = 17;
SET SQL_SAFE_UPDATES = 1;
--------------------------------------------------------------------------------------------------------------------

-- updates hospedes
SET SQL_SAFE_UPDATES = 0;
UPDATE hospedes SET primeiro_nome = 'Bee', sobrenome = 'Wetter' WHERE id_hospede = 1;
UPDATE hospedes SET sobrenome = 'Kliemann', primeiro_nome = 'Houliston' WHERE id_hospede = 16;
UPDATE hospedes SET email = 'epoupardg@reverbnation.com', genero = 'Male' WHERE id_hospede = 17;
UPDATE hospedes SET genero = 'Female', data_nascimento = '2023-02-04' WHERE id_hospede = 10;
UPDATE hospedes SET primeiro_nome = 'Hesther', cpf = 036594392 WHERE id_hospede = 4;
UPDATE hospedes SET nome_social = 'Nixie' WHERE id_hospede = 14;
UPDATE hospedes SET data_nascimento = '2022-11-10', nacionalidade = 'United States' WHERE id_hospede = 1;
UPDATE hospedes SET id_responsavel = 6 WHERE id_hospede = 4;
UPDATE hospedes SET cpf = 418628632 WHERE id_hospede = 16;
UPDATE hospedes SET nacionalidade = 'Brazil', nome_social = 'Stillmann' WHERE id_hospede = 11;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- updates quartos 
SET SQL_SAFE_UPDATES = 0;
UPDATE quartos SET num_cama_casal = 2 WHERE id_quarto = 980;
UPDATE quartos SET num_cama_solteiro = 3 WHERE id_quarto = 554;
UPDATE quartos SET nummax_hospedes = 2 WHERE id_quarto = 857;
UPDATE quartos SET preco = 200.00 WHERE id_quarto = 894;
UPDATE quartos SET nummax_hospedes = 3 WHERE id_quarto = 610;
UPDATE quartos SET num_cama_casal = 1 WHERE id_quarto = 129;
UPDATE quartos SET nummax_hospedes  = 1 WHERE id_quarto = 378;
UPDATE quartos SET num_cama_casal = 2 WHERE 278;
UPDATE quartos SET num_cama_casal = 4 WHERE id_quarto = 301;
UPDATE quartos SET num_cama_solteiro = 2 WHERE id_quarto = 178; 
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- updates hospedagens 
SET SQL_SAFE_UPDATES = 0;
UPDATE hospedagens SET data_saida = '2023-10-12' WHERE id_hospedagem = 16 ;
UPDATE hospedagens SET data_saida = '2022-03-10' WHERE id_hospedagem = 17;
UPDATE hospedagens SET data_saida = '2023-08-26' WHERE id_hospedagem = 20;
UPDATE hospedagens SET data_entrada = '2023-08-25' WHERE id_hospedagem = 20;
UPDATE hospedagens SET data_entrada = '2023-08-14' WHERE id_hospedagem = 13;
UPDATE hospedagens SET data_entrada = '2023-04-07' WHERE id_hospedagem = 17;
UPDATE hospedagens SET data_entrada = '2022-07-22' WHERE id_hospedagem = 2;
UPDATE hospedagens SET data_entrada = '2022-08-25' WHERE id_hospedagem = 3;
UPDATE hospedagens SET data_saida = '2023-10-11' WHERE id_hospedagem = 5;
UPDATE hospedagens SET data_entrada = '2023-08-14' WHERE id_hospedagem = 9;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- updates hospede_hospedagem
SET SQL_SAFE_UPDATES = 0;
UPDATE hospede_hospedagem SET id_hospede = 5 WHERE id_hospede_hospedagem = 1;
UPDATE hospede_hospedagem SET id_hospede = 6 WHERE id_hospede_hospedagem = 9;
UPDATE hospede_hospedagem SET id_hospede = 4 WHERE id_hospede_hospedagem = 9;
UPDATE hospede_hospedagem SET id_hospede = 1 WHERE id_hospede_hospedagem = 11;
UPDATE hospede_hospedagem SET id_quarto = 869 WHERE id_hospede_hospedagem = 5;
UPDATE hospede_hospedagem SET id_quarto = 894 WHERE id_hospede_hospedagem = 8;
UPDATE hospede_hospedagem SET id_quarto = 924 WHERE id_hospede_hospedagem = 7;
UPDATE hospede_hospedagem SET id_hospede = 20 WHERE id_hospede_hospedagem = 6;
UPDATE hospede_hospedagem SET id_hospede = 18 WHERE id_hospede_hospedagem = 10;
UPDATE hospede_hospedagem SET id_hospede = 6 WHERE id_hospede_hospedagem = 19;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- updates necessidades_especiais
SET SQL_SAFE_UPDATES = 0;
UPDATE necessidades_especiais SET necessidade_especial = 'Intolerância a Lactose' WHERE id_necessidade = 1;
UPDATE necessidades_especiais SET necessidade_especial = 'Esquizofrinia' WHERE id_necessidade = 7;
UPDATE necessidades_especiais SET necessidade_especial = 'Deficiência visual' WHERE id_necessidade = 2;
UPDATE necessidades_especiais SET necessidade_especial = 'Talidomida' WHERE id_necessidade = 20;
UPDATE necessidades_especiais SET necessidade_especial = 'Transtorno Bipolar' WHERE id_necessidade = 6;
UPDATE necessidades_especiais SET necessidade_especial = 'Paraplegia' WHERE id_necessidade = 14;
UPDATE necessidades_especiais SET necessidade_especial = 'Síndrome de Down' WHERE id_necessidade = 8;
UPDATE necessidades_especiais SET necessidade_especial= 'Intolerância a Sacarose' WHERE id_necessidade = 11;
UPDATE necessidades_especiais SET necessidade_especial = 'Doença Celíaca' WHERE id_necessidade = 9;
UPDATE necessidades_especiais SET necessidade_especial = 'Amputação' WHERE id_necessidade = 16;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- updates necessidades_hospedes
SET SQL_SAFE_UPDATES = 0;
UPDATE  necessidades_hospede SET id_hospede = 20 WHERE id_necessidade_hospede = 14;
UPDATE  necessidades_hospede SET id_necessidade = 2 WHERE id_necessidade_hospede = 13;
UPDATE  necessidades_hospede SET id_hospede = 3 WHERE id_necessidade_hospede = 12;
UPDATE  necessidades_hospede SET id_necessidade = 4 WHERE id_necessidade_hospede = 11;
UPDATE  necessidades_hospede SET id_hospede = 5 WHERE id_necessidade_hospede = 10;
UPDATE  necessidades_hospede SET id_necessidade = 6 WHERE id_necessidade_hospede = 9;
UPDATE  necessidades_hospede SET id_hospede = 7 WHERE id_necessidade_hospede = 8;
UPDATE  necessidades_hospede SET id_necessidade = 8 WHERE id_necessidade_hospede = 7;
UPDATE  necessidades_hospede SET id_hospede = 9 WHERE id_necessidade_hospede = 6;
UPDATE  necessidades_hospede SET id_necessidade = 10 WHERE id_necessidade_hospede = 5;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- updates departamentos
SET SQL_SAFE_UPDATES = 0;
UPDATE departamentos SET nome_departamento = 'Cozinha' WHERE id_departamento = 11;
UPDATE departamentos SET nome_departamento = 'Limpeza' WHERE id_departamento = 12;
UPDATE departamentos SET nome_departamento = 'Manutenção' WHERE id_departamento = 13;
UPDATE departamentos SET nome_departamento = 'Recepção' WHERE id_departamento = 14;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

/*-- updates usuarios_senhas
SET SQL_SAFE_UPDATES = 0;
UPDATE usuarios_senhas SET senha = 'jdl/M<jf' WHERE usuario = 'a';
UPDATE usuarios_senhas SET senha = 'h46fjhwk' WHERE usuario = 'b';
UPDATE usuarios_senhas SET senha = 'gdhvnetr' WHERE usuario = 'c';
UPDATE usuarios_senhas SET senha = 'aj534dtr' WHERE usuario = 'd';
UPDATE usuarios_senhas SET senha = 'oetdgqje' WHERE usuario = 'e';
UPDATE usuarios_senhas SET senha = 'shdncgft' WHERE usuario = 'f';
UPDATE usuarios_senhas SET senha = 'afdnvjgç' WHERE usuario = 'g';
UPDATE usuarios_senhas SET senha = 'mcg45wge' WHERE usuario = 'h';
UPDATE usuarios_senhas SET senha = 'yhwelkft' WHERE usuario = 'i';
UPDATE usuarios_senhas SET senha = 'msnch39t' WHERE usuario = 'j'; 
SET SQL_SAFE_UPDATES = 1;*/

--------------------------------------------------------------------------------------------------------------------

-- updates funcionarios
SET SQL_SAFE_UPDATES = 0;
UPDATE funcionarios SET primeiro_nome = 'Lara' WHERE id_funcionario = 5318;
UPDATE funcionarios SET primeiro_nome = 'Luan' WHERE id_funcionario = 4342;
UPDATE funcionarios SET sobrenome = 'Pereira' WHERE id_funcionario = 5324;
UPDATE funcionarios SET primeiro_nome = 'Lorela' WHERE id_funcionario = 4546;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- updates pedidos
SET SQL_SAFE_UPDATES = 0;
UPDATE pedidos SET id_departamento = 13 WHERE id_pedidos = 11;
UPDATE pedidos SET data = '2023-02-25' WHERE id_pedidos = 20;
UPDATE pedidos SET feito = 1 WHERE id_pedidos = 12;
UPDATE pedidos SET descricao = 'Limpeza' WHERE id_pedidos = 1;
UPDATE pedidos SET feito = 0 WHERE id_pedidos = 8;
UPDATE pedidos SET feito = 1 WHERE id_pedidos = 13;
UPDATE pedidos SET feito = 0 WHERE id_pedidos = 19;
UPDATE pedidos SET feito = 1 WHERE id_pedidos = 15;
UPDATE pedidos SET descricao = 'Trocar toalhas, roupa de cama e tapetes' WHERE id_pedidos = 18;
UPDATE pedidos SET feito = 0 WHERE id_pedidos = 14;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- delete hospede_hospedagem
SET SQL_SAFE_UPDATES = 0;
DELETE FROM hospede_hospedagem WHERE id_hospede = 20;
DELETE FROM hospede_hospedagem WHERE id_hospede = 2;
DELETE FROM hospede_hospedagem WHERE id_hospede = 7;
DELETE FROM hospede_hospedagem WHERE id_hospede = 20;
DELETE FROM hospede_hospedagem WHERE id_hospede = 5;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- delete necessidades_hospede
SET SQL_SAFE_UPDATES = 0; 
DELETE FROM necessidades_hospede WHERE id_hospede = 1;
DELETE FROM necessidades_hospede WHERE id_hospede = 2;
DELETE FROM necessidades_hospede WHERE id_hospede = 7;
DELETE FROM necessidades_hospede WHERE id_hospede = 1;
DELETE FROM necessidades_hospede WHERE id_hospede = 5;
DELETE FROM necessidades_hospede WHERE id_hospede = 20;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- delete pedidos
SET SQL_SAFE_UPDATES = 0; 
DELETE FROM pedidos WHERE id_pedidos = 1;
DELETE FROM pedidos WHERE id_pedidos = 2;
DELETE FROM pedidos WHERE id_pedidos = 17;
DELETE FROM pedidos WHERE id_pedidos = 3;
DELETE FROM pedidos WHERE id_pedidos = 7;
DELETE FROM pedidos WHERE id_pedidos = 5;
DELETE FROM pedidos WHERE id_pedidos = 12;
DELETE FROM pedidos WHERE id_pedidos = 16;
SET SQL_SAFE_UPDATES = 1;

--------------------------------------------------------------------------------------------------------------------

-- delete necessidades_especiais
SET SQL_SAFE_UPDATES = 0;
DELETE FROM necessidades_especiais WHERE id_necessidade = 10;
DELETE FROM necessidades_especiais WHERE id_necessidade = 8;
DELETE FROM necessidades_especiais WHERE id_necessidade = 7;
DELETE FROM necessidades_especiais WHERE id_necessidade = 13;
SET SQL_SAFE_UPDATES =  1;

-------------------------------------------------------------------------------------------------------------------

-- delete hospedagens
SET SQL_SAFE_UPDATES = 0; 
DELETE FROM hospedagens WHERE id_hospedagem = 6;
DELETE FROM hospedagens WHERE id_hospedagem = 20;
DELETE FROM hospedagens WHERE id_hospedagem = 6;
DELETE FROM hospedagens WHERE id_hospedagem = 2;
DELETE FROM hospedagens WHERE id_hospedagem = 1;
SET SQL_SAFE_UPDATES = 1;

-------------------------------------------------------------------------------------------------------------------

-- delete hospedes
SET SQL_SAFE_UPDATES = 0;
DELETE FROM hospedes WHERE id_hospede = 7;
DELETE FROM hospedes WHERE id_hospede = 20;
DELETE FROM hospedes WHERE id_hospede = 2;
DELETE FROM hospedes WHERE id_hospede = 5;
SET SQL_SAFE_UPDATES = 1;

-------------------------------------------------------------------------------------------------------------------

-- delete enderecos
SET SQL_SAFE_UPDATES = 0;
DELETE FROM enderecos WHERE id_endereco = 2;
DELETE FROM enderecos WHERE id_endereco = 5;
DELETE FROM enderecos WHERE id_endereco = 7;
DELETE FROM enderecos WHERE id_endereco = 20;
SET SQL_SAFE_UPDATES = 1;

------------------------------------------------------------------------------------------------------------------

-- delete quartos
SET SQL_SAFE_UPDATES = 0;
DELETE FROM quartos WHERE id_quarto = 924;
DELETE FROM quartos WHERE id_quarto = 533;
DELETE FROM quartos WHERE id_quarto = 378;
DELETE FROM quartos WHERE id_quarto = 980;
SET SQL_SAFE_UPDATES = 1;