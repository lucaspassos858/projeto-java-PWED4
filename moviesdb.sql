-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Out-2020 às 20:50
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `moviesdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `descricao`) VALUES
(1, 'Filme'),
(2, 'Série');

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

CREATE TABLE `post` (
  `idPost` int(11) NOT NULL,
  `titulo` varchar(300) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `dataPublicacao` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `autor` varchar(50) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `post`
--

INSERT INTO `post` (`idPost`, `titulo`, `img`, `descricao`, `dataPublicacao`, `autor`, `idCategoria`) VALUES
(3, 'Batman é adiado para 2022 pela Warner Bros.', 'https://cdn.ome.lt/nBv6NMQJHi212ZsoC0Dinm1on3M=/987x0/smart/uploads/conteudo/fotos/CAPA-the-batman.png', 'A Warner Bros. adiou a estreia de Batman para 2022. O filme de Matt Reeves originalmente estava previsto para 1? de outubro de 2021, mas agora só chega aos cinemas norte-americanos em 4 de março de 2022.', '7 de out de 2020 11:53:14', 'Teste', 1),
(6, 'Maior anime esportivo desde Slam Dunk: por que ver Haikyu', 'https://cdn.ome.lt/nqXiaacIaoeHeR6xQ9AUR5707Xc=/987x0/smart/uploads/conteudo/fotos/hodor-2.jpg', 'A quarta temporada de Haikyu começou com tudo e não deixou dúvidas: estamos diante de um dos melhores animes de esporte em muito tempo.', '7 de out de 2020 19:33:42', 'Teste', 2),
(8, 'A Rede Social - Aaron Sorkin diz que gostaria de escrever sequência', 'https://cdn.ome.lt/IGs7s8I6xNCWmKOwG11O19alTYk=/480x360/smart/extras/conteudos/redesocialsequencia.jpg', 'Premiado com um Oscar de Melhor Roteiro Adaptado por seu trabalho em A Rede Social, de 2010, Aaron Sorkin está disposto a escrever uma sequência para o longa que conta a história por trás da fundação do Facebook.', '8 de out de 2020 10:48:03', 'admin', 1),
(9, 'GLOW é cancelada pela Netflix após três temporadas', 'https://cdn.ome.lt/AUqYCSTQfPHmLugscHgBrNF9HF8=/480x360/smart/filer_public/67/80/6780a1db-88e5-4cee-9afc-040d60f6294b/glo.jpg', 'A Netflix cancelou GLOW após três temporadas. Mesmo tendo renovado a série para seu quarto ano ainda em 2019, o streaming voltou atrás devido a pandemia do coronavírus.', '8 de out de 2020 11:00:46', 'admin', 2),
(10, 'Produção de Jurassic World 3 é paralisada após testes positivos para covid-19', 'https://cdn.ome.lt/7sw8_87f_vueMWCMX_1sGGxhHIs=/987x0/smart/uploads/conteudo/fotos/Jurassic_Park_-_Dominion.jpg', 'A produção do filme Jurassic World: Dominion precisou ser interrompida após membros da equipe testarem positivo para a covid-19. A informação foi dada pelo diretor Colin Trevorrow.', '8 de out de 2020 11:39:46', 'admin', 1),
(11, 'The Prom - Meryl Streep e James Corden se divertem nas primeiras imagens', 'https://cdn.ome.lt/mrifTUdoNTZpGBTc1VIyHp0nVX4=/987x0/smart/uploads/conteudo/fotos/the-prom-0.jpg', 'The Prom conta a história de um grupo de atores veteranos da Broadway que, buscando publicidade, vai sem aviso a uma festa de final de ano de uma escola que não permitiu que uma de suas alunas fosse ao baile acompanhada de sua namorada. A estreia está marcada para 11 de dezembro.', '8 de out de 2020 11:40:29', 'admin', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `idNivelUsuario` tinyint(4) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `token` varchar(25) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idNivelUsuario`, `nome`, `email`, `senha`, `token`, `created_date`) VALUES
(23, 0, 'Teste Teste', 'guilherme@gmail.com', 'teste', '', '2020-09-05 02:33:11'),
(26, 1, 'admin', 'admin@admin.com', 'admin', '', '2020-10-08 02:42:25'),
(27, 0, 'Guilherme', 'guilherme.costa@aluno.ifsp.edu.br', 'teste', '9Wy6WpHbY376Xa43@DAe', '2020-10-08 18:47:15');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Índices para tabela `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idPost`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `post`
--
ALTER TABLE `post`
  MODIFY `idPost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
