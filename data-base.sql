-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Mar-2021 às 17:58
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.3.21
use piads;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Banco de dados: `phpmoney`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(9) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `usuarios_id` int(9) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamentos`
--

CREATE TABLE `lancamentos` (
  `id` int(9) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `usuarios_id` int(9) NOT NULL,
  `categorias_id` int(9) NOT NULL,
  `valor` decimal(8,2) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `notificar_por_email` tinyint(1) NOT NULL DEFAULT 2 COMMENT 'Indica se será enviado um email de notificação quando o lançamento vencer. 1 => SIM; 2 => NÃO',
  `consolidado` tinyint(1) NOT NULL DEFAULT 2 COMMENT 'Indica se o lançamento entrará nos cálculos de saldo. 1 => SIM; 2 => NÃO',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metodos`
--

CREATE TABLE `metodos` (
  `id` int(9) NOT NULL,
  `nome_amigavel` varchar(255) NOT NULL,
  `nome_metodo` varchar(100) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `paginas_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `metodos`
--

INSERT INTO `metodos` (`id`, `nome_amigavel`, `nome_metodo`, `chave`, `paginas_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Visualizar', 'index', '51dd2c85e9606ebbff49ce4a27cbeabd', 1, '2020-07-17 20:46:39', '2020-07-17 20:46:39', NULL),
(2, 'Visualizar', 'index', '4d78fa7788bfacf2f69d488524410f0e', 2, '2020-07-17 20:47:06', '2020-07-17 20:47:06', NULL),
(3, 'Novo', 'create', '7089a0f0439b5ac7845ff827c9e9349e', 2, '2020-07-17 20:47:06', '2020-07-17 20:47:06', NULL),
(4, 'Salvar', 'store', '44affff42c7310755dc48676e46d4b33', 2, '2020-07-17 20:47:06', '2020-07-17 20:47:06', NULL),
(5, 'Editar', 'edit', '09a06017df6ef44a3dafe7b24996bb29', 2, '2020-07-17 20:47:06', '2020-07-17 20:47:06', NULL),
(6, 'Apagar', 'delete', 'cc3355f04d0e361aff65f623cc475eb4', 2, '2020-07-17 20:47:06', '2020-07-17 20:47:06', NULL),
(7, 'Visualizar', 'index', '8dabb08a4173bd3ca75bc203fef8277b', 3, '2020-07-17 20:50:11', '2020-07-17 20:50:11', NULL),
(8, 'Novo', 'create', 'ba9a3160116ab0e480e29fd3e8301d93', 3, '2020-07-17 20:50:11', '2020-07-17 20:50:11', NULL),
(9, 'Salvar', 'store', '9c99ff9bf495baef2a56db6c9d9f3485', 3, '2020-07-17 20:50:11', '2020-07-17 20:50:11', NULL),
(10, 'Editar', 'edit', '8425afe03deab784e4e11a270804f9bb', 3, '2020-07-17 20:50:11', '2020-07-17 20:50:11', NULL),
(11, 'Apagar', 'delete', '1095662a5fafd59cfe029b796b8885e1', 3, '2020-07-17 20:50:11', '2020-07-17 20:50:11', NULL),
(12, 'Visualizar', 'index', '12dabbda6651a46f1d63f7d661007f5a', 4, '2020-07-17 20:50:24', '2020-07-17 20:50:24', NULL),
(13, 'Novo', 'create', 'affe0819cb1b8783634a3b8c6c52c672', 4, '2020-07-17 20:50:24', '2020-07-17 20:50:24', NULL),
(14, 'Salvar', 'store', '41f872aeb3d574cc0aec1ba82050c7c5', 4, '2020-07-17 20:50:24', '2020-07-17 20:50:24', NULL),
(15, 'Editar', 'edit', 'd117e7bb3e2e89854fb1af2aeb91f49d', 4, '2020-07-17 20:50:24', '2020-07-17 20:50:24', NULL),
(16, 'Apagar', 'delete', '4849c33b92809df36140587abf8d20f4', 4, '2020-07-17 20:50:24', '2020-07-17 20:50:24', NULL),
(17, 'Visualizar', 'index', 'e40605be68cb3acb17735552fa5ca8ce', 5, '2020-07-17 20:50:32', '2020-07-17 20:50:32', NULL),
(18, 'Gerar Relatório', 'getDados', '9d1022ef5521371c9267a8dc07c0c5d8', 5, '2020-07-17 20:50:32', '2020-07-17 20:50:32', NULL),
(19, 'Visualizar', 'index', 'ffee4fe1220364d5a3bad5e7fbfe4059', 6, '2020-07-17 20:50:44', '2020-07-17 20:50:44', NULL),
(20, 'Novo', 'create', '301ed25e6c59e25baf7cd3d7e2dcfc19', 6, '2020-07-17 20:50:44', '2020-07-17 20:50:44', NULL),
(21, 'Editar', 'edit', 'ef043c9561d8be574278a8f0db303d48', 6, '2020-07-17 20:50:44', '2020-07-17 20:50:44', NULL),
(22, 'Salvar', 'store', '413f923f4e138f7162fed02f082f6b15', 6, '2020-07-17 20:50:44', '2020-07-17 20:50:44', NULL),
(23, 'Apagar', 'delete', '3265fe0dc182a4cc981ba65be1a7a91f', 6, '2020-07-17 20:50:44', '2020-07-17 20:50:44', NULL),
(24, 'Visualizar', 'index', 'dbc09556816ad3959836349f87a71a8f', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(25, 'Novo', 'create', '2f8a25a24bc5631b00bf0d992efaa883', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(26, 'Salvar', 'store', 'd3c6ce07279861898040721fc4048d46', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(27, 'Editar', 'edit', '1956513894e3013f41eaa907628e9ac5', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(28, 'Visualizar QRCode Google Auth', 'googleAuth', '18c6ad9be5bc34c8637dd2422a3f0da5', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(29, 'Habilitar autenticação em 2 fatores', 'storeGoogleAuth', '0f15d71c102c5cc665a291c31575e58e', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(30, 'Desativar autenticação em 2 fatores', 'desativaAuth2Fatores', '3df2fef843c72f67ea4cfb1e5e48954e', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(31, 'Criar Códigos de Backup', 'createBackupCodes', '3d04f18bd0ce4113e48811fd4727c661', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(32, 'Ver Foto', 'getFoto', '30c9b34a0d447fb81284c839eae11dbc', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(33, 'Apagar', 'delete', '3a630f6b58ed5ffd03bb7038dc641ea7', 7, '2020-07-17 20:51:02', '2020-07-17 20:51:02', NULL),
(34, 'Salvar', 'store', 'afc821f973480a09815716a037dd9637', 8, '2020-07-17 20:51:12', '2020-07-17 20:51:12', NULL),
(35, 'Recuperar', 'get', '9a595bfe3f92a4057ee5e6d2e8f72b0a', 8, '2020-07-17 20:51:12', '2020-07-17 20:51:12', NULL),
(36, 'Gráfico por Ano', 'getPorAno', '13eb59711ea505e93857a6a171aeb6b4', 9, '2020-07-17 20:51:22', '2020-07-17 20:51:22', NULL),
(37, 'Gráfico Por Categoria', 'getPorCategoria', 'bd24101d1d3bfe7df3e19761e5945d1c', 9, '2020-07-17 20:51:22', '2020-07-17 20:51:22', NULL),
(38, 'Grava Foto', 'storeFoto', '861baebc094b9442e81f6c8db89c2a51', 10, '2020-07-17 20:51:28', '2020-07-17 20:51:28', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentos`
--

CREATE TABLE `orcamentos` (
  `id` int(9) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `usuarios_id` int(9) NOT NULL,
  `categorias_id` int(9) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(8,2) UNSIGNED NOT NULL,
  `notificar_por_email` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paginas`
--

CREATE TABLE `paginas` (
  `id` int(9) NOT NULL,
  `nome_amigavel` varchar(200) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `nome_classe` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `paginas`
--

INSERT INTO `paginas` (`id`, `nome_amigavel`, `chave`, `nome_classe`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Home', '26cf40c6e789a11d55011900da0fe1c5', 'Home', '2020-06-17 13:50:14', '2020-06-17 13:50:18', NULL),
(2, 'Lançamentos', '6f5e39b199a255b7397332eebc66a486', 'Lancamento', '2020-06-17 13:50:28', '2020-06-17 13:50:38', NULL),
(3, 'Categorias', '4e758d3087ffe133270883ec4912f5d8', 'Categoria', '2020-06-17 13:50:57', '2020-07-17 20:50:11', NULL),
(4, 'Orçamentos', '467e6a6e01e7ee7e3c3be2eadfcc8d34', 'Orcamento', '2020-06-17 13:51:14', '2020-07-17 20:50:24', NULL),
(5, 'Relatório', '5cd86bd5ef1243fe8c36cf2ca3f0227f', 'Relatorio', '2020-06-17 13:51:33', '2020-07-17 20:50:32', NULL),
(6, 'Perfis', '35d1fc432b0dfb5363b9eeb3449e2052', 'Perfil', '2020-06-17 13:51:55', '2020-07-17 20:50:44', NULL),
(7, 'Usuários', '256da99f09904a4d0d30912931ca8afa', 'Usuario', '2020-06-17 13:52:11', '2020-07-17 20:51:02', NULL),
(8, 'Categorias Ajax', 'abcdfcd77f7bff8710769de3794ce968', 'Ajax\\Categoria', '2020-06-17 13:52:39', '2020-07-17 20:51:12', NULL),
(9, 'Grafico Ajax', '887598053f0eeb7f85c92aab2a2baf20', 'Ajax\\Grafico', '2020-06-23 15:16:04', '2020-07-17 20:51:22', NULL),
(10, 'Usuário Ajax', '2c1832fcee45dbb0a2849f40f8fa7fe2', 'Ajax\\Usuario', '2020-07-05 19:24:06', '2020-07-17 20:51:28', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfis`
--

CREATE TABLE `perfis` (
  `id` int(9) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `usuarios_id` int(9) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `id` int(9) NOT NULL,
  `regras` varchar(200) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `perfis_id` int(11) NOT NULL,
  `paginas_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recovery_codes`
--

CREATE TABLE `recovery_codes` (
  `id` int(9) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `usuarios_id` int(9) NOT NULL,
  `usado` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `token_redefinicao_senha`
--

CREATE TABLE `token_redefinicao_senha` (
  `id` int(9) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(9) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `chave` varchar(255) NOT NULL,
  `perfis_id` int(9) DEFAULT NULL,
  `usuario_pai` int(9) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_confirmado` tinyint(1) NOT NULL DEFAULT 0,
  `foto` varchar(255) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `token_confirmacao_email` varchar(255) DEFAULT NULL,
  `token_criado_em` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `admin` tinyint(1) DEFAULT 0,
  `secret_google_auth` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorias_usuarios_id_foreign` (`usuarios_id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lancamentos_categorias_id_foreign` (`categorias_id`),
  ADD KEY `lancamentos_usuarios_id_foreign` (`usuarios_id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `metodos`
--
ALTER TABLE `metodos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `metodos_paginas_id_foreign` (`paginas_id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orcamentos_categorias_id_foreign` (`categorias_id`),
  ADD KEY `orcamentos_usuarios_id_foreign` (`usuarios_id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `perfis`
--
ALTER TABLE `perfis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfis_usuarios_id_foreign` (`usuarios_id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissoes_paginas_id_foreign` (`paginas_id`),
  ADD KEY `permissoes_perfis_id_foreign` (`perfis_id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `recovery_codes`
--
ALTER TABLE `recovery_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recovery_codes_usuarios_id_foreign` (`usuarios_id`);

--
-- Índices para tabela `token_redefinicao_senha`
--
ALTER TABLE `token_redefinicao_senha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token_redefinicao_senha_usuarios_id_foreign` (`usuarios_id`),
  ADD KEY `chave` (`chave`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chave` (`chave`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `metodos`
--
ALTER TABLE `metodos`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `perfis`
--
ALTER TABLE `perfis`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `permissoes`
--
ALTER TABLE `permissoes`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `recovery_codes`
--
ALTER TABLE `recovery_codes`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `token_redefinicao_senha`
--
ALTER TABLE `token_redefinicao_senha`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD CONSTRAINT `lancamentos_categorias_id_foreign` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `lancamentos_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `metodos`
--
ALTER TABLE `metodos`
  ADD CONSTRAINT `metodos_paginas_id_foreign` FOREIGN KEY (`paginas_id`) REFERENCES `paginas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `orcamentos`
--
ALTER TABLE `orcamentos`
  ADD CONSTRAINT `orcamentos_categorias_id_foreign` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `orcamentos_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perfis`
--
ALTER TABLE `perfis`
  ADD CONSTRAINT `perfis_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD CONSTRAINT `permissoes_paginas_id_foreign` FOREIGN KEY (`paginas_id`) REFERENCES `paginas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `permissoes_perfis_id_foreign` FOREIGN KEY (`perfis_id`) REFERENCES `perfis` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `recovery_codes`
--
ALTER TABLE `recovery_codes`
  ADD CONSTRAINT `recovery_codes_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `token_redefinicao_senha`
--
ALTER TABLE `token_redefinicao_senha`
  ADD CONSTRAINT `token_redefinicao_senha_usuarios_id_foreign` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;
use piads;
select * from categorias;

insert into usuarios (nome, chave, email, senha, ativo) values ('Fulano', '93284u823u', 'fulano@email.com', '123mudar', 1);
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Mercado', '89sad70f9a87fd0', 1, 'd');
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Salário', '89sad70f9a87fd1', 1, 'r');
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Manutenção', '89sad70f9a87fd2', 1, 'd');
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Lazer', '89sad70f9a87fd3', 1, 'r');
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Viagens', '89sad70f9a87fd4', 1, 'd');
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Manutenção', '89sad70f9a87fd5', 1, 'd');
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Luz', '89sad70f9a87fd6', 1, 'd');
insert into categorias (descricao, chave, usuarios_id, tipo) values ('Água', '89sad70f9a87fd7', 1, 'd');
update categorias set tipo = 'r' where descricao = 'salário';
delete from categorias where id = 7;

use piads;
delete from orcamentos;
insert into orcamentos (chave, usuarios_id, categorias_id, descricao, valor) values ('89sad70f9a87f01', 1, 2, 'Gastos com mercado', 600.00);
insert into orcamentos (chave, usuarios_id, categorias_id, descricao, valor) values ('89sad70f9a87f02', 1, 4, 'Gastos com mecanico', 5000.00);
update orcamentos set descricao = '

