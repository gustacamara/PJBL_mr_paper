# Mostra apenas os livros que possuem estoque maior que zero.
CREATE VIEW livros_has_venda AS
SELECT livro_id_livro, nome, autor, editora, venda
FROM livros
WHERE venda > 0;

# Mostra os clientes que mais compraram livros na livraria.
CREATE VIEW clientes_que_mais_compram AS
SELECT cliente_id AS nome_cliente, COUNT(*) AS total_compras
FROM vendas
INNER JOIN clientes ON vendas.cliente_id = cliente_id_cliente
GROUP BY nome_cliente
ORDER BY total_compras DESC
LIMIT 10;

# Mostra os livros mais vendidos na livraria.
CREATE VIEW livros_mais_vendidos AS
SELECT livros AS livros, COUNT(*) AS total_vendas
FROM vendas_itens
INNER JOIN livros ON vendas_itens.livro_id = livros.livro_id
GROUP BY livros.titulo
ORDER BY total_vendas DESC
LIMIT 10;