-- MySQL Workbench Synchronization
-- Generated: 2024-04-08 18:44
-- Model: New Model
-- Version: 1.0
-- Project: Mr Paper
-- Author: Gusta, Thony, Rafaella

CREATE SCHEMA IF NOT EXISTS `MrPaper` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `MrPaper`.`livro` (
    `id_livro` INT(11) NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `preco` FLOAT(10) UNSIGNED NOT NULL,
    `quantidade_estoque` INT(10) UNSIGNED,
    `quantidade_vendida` SMALLINT(5) UNSIGNED,
    `data` DATE NOT NULL,
    PRIMARY KEY (`id_livro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`cliente` (
  `id_cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `login` VARCHAR(20) NOT NULL,
  `senha` VARCHAR(20) NOT NULL,
  `cpf` INT(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `quantidade_compra` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`avaliacao` (
  `id_avaliacao` INT(11) NOT NULL AUTO_INCREMENT,
  `estrelas` TINYINT(1) UNSIGNED NOT NULL,
  `data` DATE NOT NULL,
  `avaliador` VARCHAR(50) NOT NULL,
  `livro_id_livro` INT(11) NOT NULL,
  `cliente_id_cliente` INT(11) NOT NULL,
  PRIMARY KEY (`id_avaliacao`),

  CONSTRAINT `fk_avaliacao_livro1`
    FOREIGN KEY (`livro_id_livro`)
    REFERENCES `MrPaper`.`livro` (`id_livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avaliacao_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `MrPaper`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`editora` (
  `id_editora` INT(11) NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `exemplares vendidos` INT(10),
  PRIMARY KEY (`id_editora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`categoria` (
  `id_categoria` INT(10) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `classificacao_indicativa` TINYINT(18) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`autores` (
  `id_autores` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `biografia` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_autores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `MrPaper`.`metodo_pagamento` (
  `id_metodo_pagamento` INT(11) NOT NULL AUTO_INCREMENT,
  `parcelas` TINYINT(2) UNSIGNED NOT NULL,
  `tipo` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`id_metodo_pagamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`venda` (
  `id_venda` INT(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` DATE NOT NULL,
  `metodo_pagamento_id_metodo_pagamento` INT(11) NOT NULL,
  `quantidade_compra`  INT(11) NOT NULL,
  `cliente_id_cliente` INT(11) NOT NULL,
  PRIMARY KEY (`id_venda`),
  CONSTRAINT `fk_venda_metodo_pagamento1`
    FOREIGN KEY (`metodo_pagamento_id_metodo_pagamento`)
    REFERENCES `MrPaper`.`metodo_pagamento` (`id_metodo_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `MrPaper`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`livro_has_autores` (
  `livro_id_livro` INT(11) NOT NULL,
  `autores_id_autores` INT(11) NOT NULL,
  PRIMARY KEY (`livro_id_livro`, `autores_id_autores`),
  CONSTRAINT `fk_livro_has_autores_livro`
    FOREIGN KEY (`livro_id_livro`)
    REFERENCES `MrPaper`.`livro` (`id_livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_has_autores_autores1`
    FOREIGN KEY (`autores_id_autores`)
    REFERENCES `MrPaper`.`autores` (`id_autores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`livro_has_venda` (
  `livro_id_livro` INT(11) NOT NULL,
  `venda_id_venda` INT(11) NOT NULL,
  `quantidade` SMALLINT(5) UNSIGNED NOT NULL,
  `preco` FLOAT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`livro_id_livro`, `venda_id_venda`),
  CONSTRAINT `fk_livro_has_venda_livro1`
    FOREIGN KEY (`livro_id_livro`)
    REFERENCES `MrPaper`.`livro` (`id_livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_has_venda_venda1`
    FOREIGN KEY (`venda_id_venda`)
    REFERENCES `MrPaper`.`venda` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`livro_has_editora` (
  `livro_id_livro` INT(11) NOT NULL,
  `editora_id_editora` INT(11) NOT NULL,
  PRIMARY KEY (`livro_id_livro`, `editora_id_editora`),
  CONSTRAINT `fk_livro_has_editora_livro1`
    FOREIGN KEY (`livro_id_livro`)
    REFERENCES `MrPaper`.`livro` (`id_livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_has_editora_editora1`
    FOREIGN KEY (`editora_id_editora`)
    REFERENCES `MrPaper`.`editora` (`id_editora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `MrPaper`.`livro_has_categoria` (
  `livro_id_livro` INT(11) NOT NULL,
  `categoria_id_categoria` INT(10) NOT NULL,
  PRIMARY KEY (`livro_id_livro`, `categoria_id_categoria`),
  CONSTRAINT `fk_livro_has_categoria_livro1`
    FOREIGN KEY (`livro_id_livro`)
    REFERENCES `MrPaper`.`livro` (`id_livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_has_categoria_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `MrPaper`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
