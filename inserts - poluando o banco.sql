-- INSERT

-- Tabela livro
INSERT INTO `MrPaper`.`livro` (`nome`, `preco`, `quantidade_estoque`, `quantidade_vendida`, `data`)
VALUES
('Livro 1', 10.00, 10, 0, '2024-04-01'),
('Livro 2', 20.00, 15, 0, '2024-04-01'),
('Livro 3', 30.00, 20, 0, '2024-04-01'),
('Livro 4', 40.00, 25, 0, '2024-04-01'),
('Livro 5', 50.00, 30, 0, '2024-04-01'),
('Livro 6', 60.00, 35, 0, '2024-04-01');

-- Tabela cliente
INSERT INTO `MrPaper`.`cliente` (`nome`, `login`, `senha`, `cpf`, `email`, `quantidade_compra`)
VALUES
('Cliente 1', 'login1', 'senha1', 123456789, 'cliente1@example.com', 0),
('Cliente 2', 'login2', 'senha2', 987654321, 'cliente2@example.com', 0),
('Cliente 3', 'login3', 'senha3', 912345678, 'cliente3@example.com', 0),
('Cliente 4', 'login4', 'senha4', 876543219, 'cliente4@example.com', 0),
('Cliente 5', 'login5', 'senha5', 765432198, 'cliente5@example.com', 0),
('Cliente 6', 'login6', 'senha6', 654321987, 'cliente6@example.com', 0);

-- Tabela avaliacao
INSERT INTO `MrPaper`.`avaliacao` (`estrelas`, `data`, `avaliador`, `livro_id_livro`, `cliente_id_cliente`)
VALUES
(5, '2024-04-01', 'Avaliador 1', 1, 1),
(4, '2024-04-01', 'Avaliador 2', 2, 2),
(3, '2024-04-01', 'Avaliador 3', 3, 3),
(2, '2024-04-01', 'Avaliador 4', 4, 4),
(1, '2024-04-01', 'Avaliador 5', 5, 5),
(5, '2024-04-01', 'Avaliador 6', 6, 6);

-- Tabela editora
INSERT INTO `MrPaper`.`editora` (`id_editora`, `data`, `nome`, `exemplares vendidos`)
VALUES
(1, '2024-04-01', 'Editora 1', 0),
(2, '2024-04-01', 'Editora 2', 0),
(3, '2024-04-01', 'Editora 3', 0),
(4, '2024-04-01', 'Editora 4', 0),
(5, '2024-04-01', 'Editora 5', 0),
(6, '2024-04-01', 'Editora 6', 0);

-- Tabela Categoria
INSERT INTO `MrPaper`.`categoria` (`nome`, `classificacao_indicativa`)
VALUES
('Categoria 1', 10),
('Categoria 2', 12),
('Categoria 3', 14),
('Categoria 4', 16),
('Categoria 5', 18),
('Categoria 6', 0);

-- Tabela autores
INSERT INTO `MrPaper`.`autores` (`nome`, `data_nascimento`, `biografia`)
VALUES
('Autor 1', '2024-04-01', 'Biografia 1'),
('Autor 2', '2024-04-01', 'Biografia 2'),
('Autor 3', '2024-04-01', 'Biografia 3'),
('Autor 4', '2024-04-01', 'Biografia 4'),
('Autor 5', '2024-04-01', 'Biografia 5'),
('Autor 6', '2024-04-01', 'Biografia 6');


-- Tabela metodo_pagamento
INSERT INTO `MrPaper`.`metodo_pagamento` (`parcelas`, `tipo`)
VALUES
(12, 'Cartão de Credito'),
(1, 'Cartão de Debito'),
(1, 'Pix'),
(1, 'Boleto'),
(1, 'pagamento'),
(1, 'pagamento');

-- Tabela venda
INSERT INTO `MrPaper`.`venda` (`data_emissao`, `metodo_pagamento_id_metodo_pagamento`,`quantidade_compra`, `cliente_id_cliente`)
VALUES
('2024-04-01', 1, 1, 1),
('2024-04-01', 2, 2, 2),
('2024-04-01', 3, 3, 3),
('2024-04-01', 4, 4, 4),
('2024-04-01', 5, 5, 5),
('2024-04-01', 6, 6, 6);

-- Tabela livro_has_venda
INSERT INTO `MrPaper`.`livro_has_venda` (`livro_id_livro`, `venda_id_venda`, `quantidade`, `preco`)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6);

-- Tabela livro_has_editora
INSERT INTO `MrPaper`.`livro_has_editora` (`livro_id_livro`, `editora_id_editora`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- Tabela livro_has_categoria
INSERT INTO `MrPaper`.`livro_has_categoria` (`livro_id_livro`, `categoria_id_categoria`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- Tabela livro_has_autores
INSERT INTO `MrPaper`.`livro_has_autores` (`livro_id_livro`, `autores_id_autores`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- UPDATE

UPDATE `MrPaper`.`livro` SET
    `nome` = 'Novo Livro 1',
    `preco` = 15.00,
    `quantidade_estoque` = 5,
    `quantidade_vendida` = 2,
    `data` = '2024-04-02'
WHERE `id_livro` = 1;

UPDATE `MrPaper`.`cliente` SET
    `nome` = 'Novo Cliente 1',
    `login` = 'novo_login1',
    `senha` = 'nova_senha1',
    `email` = 'novo_cliente1@example.com',
    `quantidade_compra` = 1
WHERE `id_cliente` = 1;


UPDATE `MrPaper`.`avaliacao` SET
    `estrelas` = 3,
    `data` = '2024-04-02',
    `avaliador` = 'Novo Avaliador 1',
    `livro_id_livro` = 2,
    `cliente_id_cliente` = 2
WHERE `id_avaliacao` = 1;

UPDATE `MrPaper`.`editora` SET
    `nome` = 'Nova Editora 1',
    `data` = '2024-04-02',
    `exemplares vendidos` = 5
WHERE `id_editora` = 1;

UPDATE `MrPaper`.`autores` SET
    `nome` = 'Novo Autor 1',
    `data_nascimento` = '2024-04-02',
    `biografia` = 'Nova Biografia 1'
WHERE `id_autores` = 1;

UPDATE `MrPaper`.`venda` SET
    `data_emissao` = '2024-04-02',
    `metodo_pagamento_id_metodo_pagamento` = 6,
    `cliente_id_cliente` = 6
WHERE `id_venda` = 1;

-- DEELETE

SET FOREIGN_KEY_CHECKS = 0; -- Desativar a verificação de chaves estrangeiras

-- Excluir 5 registros da tabela livro
DELETE FROM `mrpaper`.`livro` WHERE id_livro > 5;

-- Excluir 5 registros da tabela cliente
DELETE FROM `mrpaper`.`cliente` WHERE id_cliente > 5;

-- Excluir 5 registros da tabela avaliacao
DELETE FROM `mrpaper`.`avaliacao` WHERE id_avaliacao > 5;

-- Excluir 5 registros da tabela editora
DELETE FROM `mrpaper`.`editora` WHERE id_editora > 5;

-- Excluir 5 registros da tabela categoria
DELETE FROM `mrpaper`.`categoria` WHERE id_categoria > 5;

-- Excluir 5 registros da tabela autores
DELETE FROM `mrpaper`.`autores` WHERE id_autores > 5;

-- Excluir 5 registros da tabela metodo_pagamento
DELETE FROM `mrpaper`.`metodo_pagamento` WHERE id_metodo_pagamento > 5;

-- Excluir 5 registros da tabela venda
DELETE FROM `mrpaper`.`venda` WHERE id_venda > 5;

SET FOREIGN_KEY_CHECKS = 1; -- Reativar a verificação de chaves estrangeiras