-- Livros e suas Editoras
CREATE VIEW LivrosEditoras AS
SELECT l.nome AS nome_livro, e.nome AS nome_editora
FROM livro l
JOIN livro_has_editora le ON l.id_livro = le.livro_id_livro
JOIN editora e ON le.editora_id_editora = e.id_editora;

-- Clientes e suas Compras
CREATE VIEW ClientesCompras AS
SELECT c.nome AS nome_cliente, SUM(vd.quantidade) AS total_compras
FROM cliente c
JOIN venda v ON c.id_cliente = v.cliente_id_cliente
JOIN livro_has_venda vd ON v.id_venda = vd.venda_id_venda
GROUP BY c.nome;

-- Avaliações dos Livros
CREATE VIEW AvaliacoesLivros AS
SELECT l.nome AS nome_livro, AVG(a.estrelas) AS media_avaliacoes
FROM livro l
JOIN avaliacao a ON l.id_livro = a.livro_id_livro
GROUP BY l.nome;

-- Testar LivrosEditoras
SELECT * FROM LivrosEditoras;
-- Testar ClientesCompras
SELECT * FROM ClientesCompras;
-- Testar AvaliacoesLivros
SELECT * FROM AvaliacoesLivros;



-- EXTRA
-- -- Mostra apenas os livros que possuem estoque maior que zero.
-- CREATE VIEW livros_has_venda AS
-- SELECT livro_id_livro, nome, autor, editora, venda
-- FROM livros
-- WHERE venda > 0;

-- -- Mostra os clientes que mais compraram livros na livraria.
-- CREATE VIEW clientes_que_mais_compram AS
-- SELECT cliente_id AS nome_cliente, COUNT(*) AS total_compras
-- FROM vendas
-- INNER JOIN clientes ON vendas.cliente_id = cliente_id_cliente
-- GROUP BY nome_cliente
-- ORDER BY total_compras DESC
-- LIMIT 10;

-- -- Mostra os livros mais vendidos na livraria.
-- CREATE VIEW livros_mais_vendidos AS
-- SELECT livros AS livros, COUNT(*) AS total_vendas
-- FROM vendas_itens
-- INNER JOIN livros ON vendas_itens.livro_id = livros.livro_id
-- GROUP BY livros.titulo
-- ORDER BY total_vendas DESC
-- LIMIT 10;