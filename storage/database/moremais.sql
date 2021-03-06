-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: moremais
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contraproposta`
--

DROP TABLE IF EXISTS `contraproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `contraproposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prop_orc` int(11) NOT NULL,
  `id_usr` int(11) NOT NULL,
  `id_usr_alter` int(11) NOT NULL,
  `novo_valor` int(11) NOT NULL,
  `mensagem` text,
  `aceita` tinyint(1) NOT NULL DEFAULT '0',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultima_alter` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_prop_orc` (`id_prop_orc`),
  KEY `id_usr` (`id_usr`),
  KEY `id_usr_alter` (`id_usr_alter`),
  CONSTRAINT `contraProposta_ibfk_1` FOREIGN KEY (`id_prop_orc`) REFERENCES `propostadeorcamento` (`id`),
  CONSTRAINT `contraProposta_ibfk_2` FOREIGN KEY (`id_usr`) REFERENCES `usuario` (`id`),
  CONSTRAINT `contraProposta_ibfk_3` FOREIGN KEY (`id_usr_alter`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contraproposta`
--

LOCK TABLES `contraproposta` WRITE;
/*!40000 ALTER TABLE `contraproposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `contraproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedoresorcamento`
--

DROP TABLE IF EXISTS `fornecedoresorcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `fornecedoresorcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orcamento` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_orcamento` (`id_orcamento`),
  CONSTRAINT `fornecedoresOrcamento_ibfk_1` FOREIGN KEY (`id_orcamento`) REFERENCES `orcamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedoresorcamento`
--

LOCK TABLES `fornecedoresorcamento` WRITE;
/*!40000 ALTER TABLE `fornecedoresorcamento` DISABLE KEYS */;
INSERT INTO `fornecedoresorcamento` VALUES (1,1,5),(2,2,5),(3,2,6),(4,2,8),(5,2,9);
/*!40000 ALTER TABLE `fornecedoresorcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `aberto` tinyint(1) NOT NULL,
  `vigencia_inicio` datetime NOT NULL,
  `vigencia_fim` datetime NOT NULL,
  `id_usr_cad` int(11) NOT NULL,
  `id_usr_alter` int(11) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultima_alter` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usr_cad` (`id_usr_cad`),
  KEY `id_usr_alter` (`id_usr_alter`),
  CONSTRAINT `orcamento_ibfk_1` FOREIGN KEY (`id_usr_cad`) REFERENCES `usuario` (`id`),
  CONSTRAINT `orcamento_ibfk_2` FOREIGN KEY (`id_usr_alter`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (1,'Casa do Thales',1,'2019-04-06 16:40:38','2019-04-07 18:20:17',7,NULL,'2019-04-06 19:41:23','2019-04-06 19:41:23'),(2,'Reforma CCH',0,'2019-05-05 14:46:33','2019-04-07 17:59:40',7,NULL,'2019-04-07 17:48:05','2019-04-07 17:48:05');
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordensdeorcamento`
--

DROP TABLE IF EXISTS `ordensdeorcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `ordensdeorcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orcamento` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_orcamento` (`id_orcamento`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `ordensDeOrcamento_ibfk_1` FOREIGN KEY (`id_orcamento`) REFERENCES `orcamento` (`id`),
  CONSTRAINT `ordensDeOrcamento_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordensdeorcamento`
--

LOCK TABLES `ordensdeorcamento` WRITE;
/*!40000 ALTER TABLE `ordensdeorcamento` DISABLE KEYS */;
INSERT INTO `ordensdeorcamento` VALUES (1,1,1,100),(2,1,5,50),(3,1,6,12),(4,2,4,5),(5,2,1,20);
/*!40000 ALTER TABLE `ordensdeorcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordensdeproposta`
--

DROP TABLE IF EXISTS `ordensdeproposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `ordensdeproposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prop_orc` int(11) NOT NULL,
  `id_ord_orc` int(11) NOT NULL,
  `valor` double(10,2) NOT NULL,
  `aceita` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_prop_orc` (`id_prop_orc`),
  KEY `id_ord_orc` (`id_ord_orc`),
  CONSTRAINT `ordensDeProposta_ibfk_1` FOREIGN KEY (`id_prop_orc`) REFERENCES `propostadeorcamento` (`id`),
  CONSTRAINT `ordensDeProposta_ibfk_2` FOREIGN KEY (`id_ord_orc`) REFERENCES `ordensdeorcamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordensdeproposta`
--

LOCK TABLES `ordensdeproposta` WRITE;
/*!40000 ALTER TABLE `ordensdeproposta` DISABLE KEYS */;
INSERT INTO `ordensdeproposta` VALUES (1,6,1,100.00,0),(2,6,2,10.00,0),(3,6,3,100.00,0),(4,8,4,800.00,0),(5,8,5,35.00,0),(6,9,4,700.00,0),(7,9,5,60.00,0),(8,10,4,750.00,0),(9,10,5,45.00,0),(10,11,4,500.00,0),(11,11,5,40.00,0);
/*!40000 ALTER TABLE `ordensdeproposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `id_und_medida` int(11) NOT NULL,
  `id_usr_cad` int(11) NOT NULL,
  `id_usr_alter` int(11) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultima_alter` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_und_medida` (`id_und_medida`),
  KEY `id_usr_cad` (`id_usr_cad`),
  KEY `id_usr_alter` (`id_usr_alter`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_und_medida`) REFERENCES `undmedida` (`id`),
  CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`id_usr_cad`) REFERENCES `usuario` (`id`),
  CONSTRAINT `produto_ibfk_3` FOREIGN KEY (`id_usr_alter`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Cimento','',1,15,1,NULL,'2019-03-23 21:03:03','2019-03-23 21:03:03'),(4,'Tijolo Argila tipo 1','',1,14,1,NULL,'2019-03-23 22:40:44','2019-03-23 22:40:44'),(5,'Ceramica','',1,12,1,NULL,'2019-04-06 19:37:05','2019-04-06 19:37:05'),(6,'Barra de ferro','',1,11,1,NULL,'2019-04-06 19:37:23','2019-04-06 19:37:23'),(7,'Concreto Usinado','',1,2,7,NULL,'2019-04-07 17:43:45','2019-04-07 17:43:45'),(8,'Prego 17×27','',1,16,7,NULL,'2019-04-07 17:44:01','2019-04-07 17:44:01'),(9,'Telha Portuguesa reforçada','',1,7,7,NULL,'2019-04-07 17:45:09','2019-04-07 17:45:09'),(10,'Arame Galvanizado','',1,11,7,NULL,'2019-04-07 17:45:24','2019-04-07 17:45:24'),(11,'Tela p/ Reboco','',1,16,7,NULL,'2019-04-07 17:46:10','2019-04-07 17:46:10'),(12,'Pintura da porta','',1,9,7,NULL,'2019-04-07 17:46:27','2019-04-07 17:46:27');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propostadeorcamento`
--

DROP TABLE IF EXISTS `propostadeorcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `propostadeorcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orcamento` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `aberto` tinyint(1) NOT NULL,
  `aceita` tinyint(1) NOT NULL DEFAULT '0',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_orcamento` (`id_orcamento`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `propostaDeOrcamento_ibfk_1` FOREIGN KEY (`id_orcamento`) REFERENCES `orcamento` (`id`),
  CONSTRAINT `propostaDeOrcamento_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propostadeorcamento`
--

LOCK TABLES `propostadeorcamento` WRITE;
/*!40000 ALTER TABLE `propostadeorcamento` DISABLE KEYS */;
INSERT INTO `propostadeorcamento` VALUES (6,1,5,0,1,'2019-04-06 20:05:25'),(8,2,9,0,0,'2019-04-07 18:04:55'),(9,2,8,0,0,'2019-04-07 19:11:56'),(10,2,5,0,0,'2019-04-07 19:12:24'),(11,2,6,0,1,'2019-04-07 19:13:33');
/*!40000 ALTER TABLE `propostadeorcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `nivel_acesso` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Administrador do sistema',10,'Possui nivel de acesso máximo e pode usufruir de todas as funcionalidades do sistema'),(2,'Funcionario',5,'Não possui acessos a relatórios gerenciais e não pode criar outros usuários'),(3,'Fornecedor Ativo',3,'Possui acesso a relatórios pertinentes a fornecedores e é capaz de fazer propostas a orçamentos ativos'),(4,'Fornecedor Desativado',1,'Possui acesso apenas a editar seu perfil e ver os orcamentos ativos');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undmedida`
--

DROP TABLE IF EXISTS `undmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `undmedida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unidade` varchar(15) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undmedida`
--

LOCK TABLES `undmedida` WRITE;
/*!40000 ALTER TABLE `undmedida` DISABLE KEYS */;
INSERT INTO `undmedida` VALUES (1,'BARRA','BARRA'),(2,'BLOCO','BLOCO'),(3,'CJ','CONJUNTO'),(4,'CM','CENTIMETRO'),(5,'CM2','CENTIMETRO QUADRADO'),(6,'CX','CAIXA'),(7,'CENTO','CENTO'),(8,'GALAO','GALÃO'),(9,'LATA','LATA'),(10,'LITRO','LITRO'),(11,'M','METRO'),(12,'M2','METRO QUADRADO'),(13,'M3','METRO CÚBICO'),(14,'MILHEI','MILHEIRO'),(15,'KG','QUILOGRAMA'),(16,'UNID','UNIDADE'),(17,'MWH','MEGAWATT HORA');
/*!40000 ALTER TABLE `undmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `UF` varchar(3) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `ultimo_acesso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_login` (`login`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipousuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'matheuspaixao','12345','Matheus Paixão de Oliveira','matheus.tec3@gmail.com','(88) 99259-4124',1,'063.685.703-42','CPF',NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-07 16:28:24'),(2,'hugofirmino','12345','Hugo Firmino Damasceno','teste1@teste.com','(88) 90000-0000',1,'000.000.000-00','CPF',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-23 19:18:05'),(3,'franciscodaniel','12345','Francisco Daniel Freitas Martins','teste2@teste.com','(88) 90000-0000',1,'000.000.000-00','CPF',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-23 19:18:05'),(4,'thalesandrade','12345','Thales Andrade','teste3@teste.com','(88) 90000-0000',1,'000.000.000-00','CPF',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-23 19:18:05'),(5,'mouraconstrucao','12345','Moura Construcao','teste@teste.com','(88) 88888-8888',3,'00.000.000/0000-00','CNPJ','Av. da Universidade',1,'SOBRAL','CE','62040-419','2019-04-06 16:38:36','2019-04-07 18:21:39'),(6,'pontodocimento','12345','Ponto do Cimento','teste@teste.com','(00) 00000-0000',3,'00.000.000/0000-00','CNPJ','Av. da Universidade',1,'SOBRAL','CE','62040-419','2019-04-06 16:39:17','2019-04-07 16:13:19'),(7,'joaozinho','12345','Joaozinho dos Anzois','teste@teste.com','(99) 99999-9999',2,'000.000.000-00','CPF','Av. da Universidade',1,'SOBRAL','CE','62040-419','2019-04-06 16:40:00','2019-04-07 15:07:41'),(8,'apiguana','12345','Apiguana ','teste@teste.com','(00) 00000-0000',3,'00.000.000/0000-00','CNPJ','Comandante Maurocélio Rocha Pontes, Derby Clube',1,'Sobral','CE','62042-280','2019-04-07 14:39:45','2019-04-07 15:11:56'),(9,'hecon','12345','Hecon','teste@teste.com','(00) 00000-0000',3,'00.000.000/0000-00','CNPJ','Comandante Maurocélio Rocha Pontes, Derby Clube',1,'Sobral','CE','62042-280','2019-04-07 14:40:28','2019-04-07 15:07:52'),(10,'magazineluiza','12345','Magazine Luiza','teste@teste.com','(99) 99999-9999',3,'00.000.000/0000-00','CNPJ','Comandante Maurocélio Rocha Pontes, Derby Clube',1,'Sobral','CE','62042-280','2019-04-07 14:41:23',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-07 19:05:54




DROP PROCEDURE IF EXISTS `getOrcamentoByIdAndFornecedora`;

delimiter //

CREATE PROCEDURE `getOrcamentoByIdAndFornecedora`(orcamentoId INT, fornecedorId INT)
BEGIN
	
    IF (SELECT COUNT(*) FROM propostadeorcamento WHERE id_orcamento = orcamentoId AND id_fornecedor = fornecedorId) > 0 THEN
    
		SELECT 
		  O.id AS idOrc,
		  O.nome AS nomeOrc,
		  CASE WHEN O.vigencia_fim > NOW() THEN 1 ELSE 0 END AS abertoOrc,
		  Ordem.id AS idOrdemOrc,
		  P.nome AS nomeProd,
		  und.unidade AS undProd,
		  Ordem.quantidade AS qtdProd,
		  prop.id AS idPropOrc,
		  ordProp.id AS idOrdProp,
		  ordProp.valor AS valorProposto,
		  COUNT(prop.id) AS houveProposta
		FROM 
		  orcamento O
		INNER JOIN ordensdeorcamento Ordem
		  ON O.id = Ordem.id_orcamento
		INNER JOIN produto P
		  ON Ordem.id_produto = P.id
		INNER JOIN undmedida und
		  ON P.id_und_medida = und.id
		LEFT JOIN propostadeorcamento prop
		  ON O.id = prop.id_orcamento
		LEFT JOIN ordensdeproposta ordProp
		  ON prop.id = ordProp.id_prop_orc
		  AND Ordem.id = ordProp.id_ord_orc
		WHERE 
		  O.id = orcamentoId
		  AND (prop.id IS NULL OR prop.id_fornecedor = fornecedorId)
		GROUP BY
		  O.id,
		  O.nome,
		  O.vigencia_fim,
		  Ordem.id,
		  P.nome,
		  und.unidade,
		  Ordem.quantidade,
		  prop.id,
		  ordProp.id,
		  ordProp.valor;
	
	ELSE 
    
		SELECT 
		  O.id AS idOrc,
		  O.nome AS nomeOrc,
		  CASE WHEN O.vigencia_fim > NOW() THEN 1 ELSE 0 END AS abertoOrc,
		  Ordem.id AS idOrdemOrc,
		  P.nome AS nomeProd,
		  und.unidade AS undProd,
		  Ordem.quantidade AS qtdProd,
		  null AS idPropOrc,
		  null AS idOrdProp,
		  null AS valorProposto,
		  0 AS houveProposta
		FROM 
		  orcamento O
		INNER JOIN ordensdeorcamento Ordem
		  ON O.id = Ordem.id_orcamento
		INNER JOIN produto P
		  ON Ordem.id_produto = P.id
		INNER JOIN undmedida und
		  ON P.id_und_medida = und.id
		WHERE 
		  O.id = orcamentoId
		GROUP BY
		  O.id,
		  O.nome,
		  O.vigencia_fim,
		  Ordem.id,
		  P.nome,
		  und.unidade,
		  Ordem.quantidade;
        
	END IF;
    
END //

delimiter ;