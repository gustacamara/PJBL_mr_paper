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
