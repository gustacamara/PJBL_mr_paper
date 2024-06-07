-- Detalhes das vendas com informações do cliente
SELECT v.id_venda, v.data_emissao, c.nome AS cliente
FROM venda v
JOIN cliente c ON v.cliente_id_cliente = c.id_cliente;

-- Detalhes das avaliações com informações do livro e do cliente
SELECT a.id_avaliacao, a.estrelas, l.nome AS livro, c.nome AS cliente
FROM avaliacao a
JOIN livro l ON a.livro_id_livro = l.id_livro
JOIN cliente c ON a.cliente_id_cliente = c.id_cliente;

-- Livros e suas editoras correspondentes
SELECT l.nome AS livro, e.nome AS editora
FROM livro l
JOIN livro_has_editora le ON l.id_livro = le.livro_id_livro
JOIN editora e ON le.editora_id_editora = e.id_editora;

-- Vendas com informações de método de pagamento
SELECT v.id_venda, v.data_emissao, m.tipo AS metodo_pagamento
FROM venda v
JOIN metodo_pagamento m ON v.metodo_pagamento_id_metodo_pagamento = m.id_metodo_pagamento;

-- Livros e suas categorias correspondentes
SELECT l.nome AS livro, c.nome AS categoria
FROM livro l
JOIN livro_has_categoria lc ON l.id_livro = lc.livro_id_livro
JOIN categoria c ON lc.categoria_id_categoria = c.id_categoria;

-- Listar livros por preço em ordem decrescente
SELECT nome, preco
FROM livro
ORDER BY preco DESC;

-- Listar clientes pelo número de compras em ordem decrescente
SELECT nome, quantidade_compra
FROM cliente
ORDER BY quantidade_compra DESC;

-- Listar autores por data de nascimento em ordem crescente
SELECT nome, data_nascimento
FROM autores
ORDER BY data_nascimento ASC;

-- Total de livros vendidos por categoria
SELECT c.nome AS categoria, SUM(l.quantidade_vendida) AS total_vendida
FROM livro l
JOIN livro_has_categoria lc ON l.id_livro = lc.livro_id_livro
JOIN categoria c ON lc.categoria_id_categoria = c.id_categoria
GROUP BY c.nome;

-- Quantidade média de livros vendidos por editora
SELECT e.nome AS editora, AVG(l.quantidade_vendida) AS media_vendida
FROM livro l
JOIN livro_has_editora le ON l.id_livro = le.livro_id_livro
JOIN editora e ON le.editora_id_editora = e.id_editora
GROUP BY e.nome;

-- Total de vendas por cliente
SELECT c.nome AS cliente, SUM(v.quantidade_compra) AS total_compras
FROM cliente c
JOIN venda v ON c.id_cliente = v.cliente_id_cliente
GROUP BY c.nome;

-- Avaliação média por livro
SELECT l.nome AS livro, AVG(a.estrelas) AS media_estrelas
FROM livro l
JOIN avaliacao a ON l.id_livro = a.livro_id_livro
GROUP BY l.nome;

-- Número de livros por classificação indicativa
SELECT c.classificacao_indicativa, COUNT(l.id_livro) AS total_livros
FROM livro l
JOIN livro_has_categoria lc ON l.id_livro = lc.livro_id_livro
JOIN categoria c ON lc.categoria_id_categoria = c.id_categoria
GROUP BY c.classificacao_indicativa;

-- Listar todos os livros e suas quantidades em estoque
SELECT nome, quantidade_estoque
FROM livro;

-- Listar todos os autores com suas biografias
SELECT nome, biografia
FROM autores;

-- Listar todos os clientes com seus e-mails
SELECT nome, email
FROM cliente;

-- Listar todas as editoras com suas datas de fundação
SELECT nome, data
FROM editora;

-- Listar todas as avaliações com suas datas
SELECT estrelas, data
FROM avaliacao;

-- Listar todos os métodos de pagamento disponíveis
SELECT tipo, parcelas
FROM metodo_pagamento;

-- Listar todas as vendas com a data de emissão
SELECT id_venda, data_emissao
FROM venda;


-- EXTRAS
-- -- nome do livro, nome do avaliador de cada livro e qual sua avaliação
-- SELECT av.livro_id_livro AS "id livro", l.nome AS "Nome livro", av.estrelas, av.avaliador
-- FROM mrpaper.avaliacao av 
-- INNER JOIN mrpaper.livro l ON av.livro_id_livro = l.id_livro
-- GROUP BY av.livro_id_livro, av.estrelas, av.avaliador;

-- -- NOME DO CLIENTE E QUAL A MEDIA DE ESTRELAS ELE DA PARA OS LIVROS QUE ELE LEU(na ordem de menor pra maior media).
-- SELECT cl.nome, avg(av.estrelas) AS "avaliacao media"
-- FROM mrpaper.cliente cl 
-- INNER JOIN mrpaper.avaliacao av ON cl.id_cliente = av.cliente_id_cliente
-- GROUP BY cl.id_cliente
-- ORDER BY avg(av.estrelas) asc;

-- -- quais editoras possuem livros avaliados por ordem de estrelas
-- SELECT ed.id_editora, ed.nome, av.estrelas 
-- FROM mrpaper.editora ed 
-- INNER JOIN mrpaper.livro_has_editora lhe ON ed.id_editora = lhe.editora_id_editora
-- JOIN mrpaper.livro li ON lhe.livro_id_livro = li.id_livro
-- JOIN mrpaper.avaliacao av ON li.id_livro = av.livro_id_livro
-- GROUP BY li.id_livro, ed.id_editora, av.estrelas
-- ORDER BY av.estrelas desc;

-- -- quais autores possuem venda
-- SELECT lhve.livro_id_livro, au.nome
-- FROM mrpaper.autores au
-- INNER JOIN mrpaper.livro_has_autores lha ON au.id_autores = lha.autores_id_autores
-- JOIN mrpaper.livro li ON lha.livro_id_livro = li.id_livro
-- JOIN mrpaper.livro_has_venda lhve ON li.id_livro = lhve.livro_id_livro
-- GROUP BY li.id_livro, lha.autores_id_autores;

-- -- quais os metodos de pagamento mais usador por ordem dos mais utilizados
-- SELECT mp.tipo, count(ve.metodo_pagamento_id_metodo_pagamento)AS "quantidade"
-- FROM mrpaper.metodo_pagamento mp
-- INNER JOIN mrpaper.venda ve ON ve.metodo_pagamento_id_metodo_pagamento = mp.id_metodo_pagamento
-- GROUP BY ve.metodo_pagamento_id_metodo_pagamento
-- ORDER BY count(ve.metodo_pagamento_id_metodo_pagamento) desc;
