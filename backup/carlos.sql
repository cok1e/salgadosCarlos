-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Ago-2022 às 15:36
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `carlos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `idAgenda` int(11) NOT NULL,
  `diaEntrega` datetime NOT NULL,
  `fkVenda` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `pago` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `fkendereco` int(11) NOT NULL,
  `numerocasa` decimal(3,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `fkendereco`, `numerocasa`) VALUES
(1, 'ronaldo', 1, '82'),
(2, 'josiel', 2, '23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `logradouro`, `bairro`, `cidade`, `complemento`) VALUES
(1, 'rua antonio', 'parque das flores', 'guara', NULL),
(2, 'avenida adamante', 'parque das flores', 'guara', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingredientes`
--

CREATE TABLE `ingredientes` (
  `idIngredientes` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `quantidade` decimal(4,0) NOT NULL,
  `ValorMercado` float NOT NULL,
  `qtdMinima` decimal(4,0) NOT NULL,
  `dataCompra` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ingredientes`
--

INSERT INTO `ingredientes` (`idIngredientes`, `nome`, `quantidade`, `ValorMercado`, `qtdMinima`, `dataCompra`) VALUES
(1, 'farinha', '5000', 13, '2000', 20220800000000),
(2, 'frango', '7000', 20, '500', 20220800000000),
(3, 'oleo', '2000', 10, '1000', 20220800000000),
(4, 'carne moida', '2000', 25.6, '1000', 20220800000000),
(5, 'trigo', '2500', 10, '1000', 20220800000000),
(6, 'trigo', '2500', 10, '1000', 20220800000000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensingredientes`
--

CREATE TABLE `itensingredientes` (
  `idItensIngredientes` int(11) NOT NULL,
  `qtdUsada` decimal(4,0) NOT NULL,
  `fkIngredientes` int(11) NOT NULL,
  `fkProduTosProntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itensingredientes`
--

INSERT INTO `itensingredientes` (`idItensIngredientes`, `qtdUsada`, `fkIngredientes`, `fkProduTosProntos`) VALUES
(3, '1000', 1, 1),
(4, '450', 2, 1),
(5, '1500', 3, 1),
(6, '1500', 3, 2),
(7, '500', 4, 2),
(8, '500', 5, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensvendidos`
--

CREATE TABLE `itensvendidos` (
  `idItensVendidos` int(11) NOT NULL,
  `quantidade` decimal(5,0) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `valorVenda` float NOT NULL,
  `fkVenda` int(11) NOT NULL,
  `fkprodutosProntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itensvendidos`
--

INSERT INTO `itensvendidos` (`idItensVendidos`, `quantidade`, `descricao`, `valorVenda`, `fkVenda`, `fkprodutosProntos`) VALUES
(1, '200', NULL, 60, 1, 1),
(2, '200', NULL, 60, 1, 2),
(3, '100', NULL, 30, 2, 1),
(4, '100', NULL, 30, 2, 1),
(5, '100', NULL, 30, 3, 1),
(6, '100', NULL, 30, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtosprontos`
--

CREATE TABLE `produtosprontos` (
  `idProdutosProntos` int(11) NOT NULL,
  `quantidade` decimal(4,0) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `qtdMinima` decimal(4,0) NOT NULL,
  `ValorVenda` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtosprontos`
--

INSERT INTO `produtosprontos` (`idProdutosProntos`, `quantidade`, `nome`, `qtdMinima`, `ValorVenda`) VALUES
(1, '500', 'coxinha', '200', 30),
(2, '500', 'kibe', '200', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `idTelefone` int(11) NOT NULL,
  `ddd` decimal(2,0) NOT NULL,
  `numeroTelefone` decimal(9,0) NOT NULL,
  `fkcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`idTelefone`, `ddd`, `numeroTelefone`, `fkcliente`) VALUES
(1, '12', '995959596', 1),
(2, '12', '656145325', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `ValorTotal` float NOT NULL,
  `fkCliente` int(11) NOT NULL,
  `diaVenda` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idVenda`, `ValorTotal`, `fkCliente`, `diaVenda`) VALUES
(1, 120, 1, '2022-08-09 11:11:50'),
(2, 60, 1, '2022-08-09 11:23:34'),
(3, 60, 2, '2022-08-09 11:34:42');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`idAgenda`),
  ADD KEY `fkVenda` (`fkVenda`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fkendereco` (`fkendereco`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Índices para tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`idIngredientes`);

--
-- Índices para tabela `itensingredientes`
--
ALTER TABLE `itensingredientes`
  ADD PRIMARY KEY (`idItensIngredientes`),
  ADD KEY `fkIngredientes` (`fkIngredientes`),
  ADD KEY `fkProduTosProntos` (`fkProduTosProntos`);

--
-- Índices para tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  ADD PRIMARY KEY (`idItensVendidos`),
  ADD KEY `fkVenda` (`fkVenda`),
  ADD KEY `fkprodutosProntos` (`fkprodutosProntos`);

--
-- Índices para tabela `produtosprontos`
--
ALTER TABLE `produtosprontos`
  ADD PRIMARY KEY (`idProdutosProntos`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`idTelefone`),
  ADD KEY `fkcliente` (`fkcliente`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `fkCliente` (`fkCliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `idAgenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEndereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `idIngredientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `itensingredientes`
--
ALTER TABLE `itensingredientes`
  MODIFY `idItensIngredientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  MODIFY `idItensVendidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produtosprontos`
--
ALTER TABLE `produtosprontos`
  MODIFY `idProdutosProntos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `telefone`
--
ALTER TABLE `telefone`
  MODIFY `idTelefone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`fkVenda`) REFERENCES `venda` (`idVenda`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`fkendereco`) REFERENCES `endereco` (`idEndereco`);

--
-- Limitadores para a tabela `itensingredientes`
--
ALTER TABLE `itensingredientes`
  ADD CONSTRAINT `itensingredientes_ibfk_1` FOREIGN KEY (`fkIngredientes`) REFERENCES `ingredientes` (`idIngredientes`),
  ADD CONSTRAINT `itensingredientes_ibfk_2` FOREIGN KEY (`fkProduTosProntos`) REFERENCES `produtosprontos` (`idProdutosProntos`);

--
-- Limitadores para a tabela `itensvendidos`
--
ALTER TABLE `itensvendidos`
  ADD CONSTRAINT `itensvendidos_ibfk_1` FOREIGN KEY (`fkVenda`) REFERENCES `venda` (`idVenda`),
  ADD CONSTRAINT `itensvendidos_ibfk_2` FOREIGN KEY (`fkprodutosProntos`) REFERENCES `produtosprontos` (`idProdutosProntos`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`fkcliente`) REFERENCES `cliente` (`idCliente`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`fkCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
