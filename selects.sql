-- nome do livro, nome do avaliador de cada livro e qual sua avaliação
SELECT av.livro_id_livro AS "id livro", l.nome AS "Nome livro", av.estrelas, av.avaliador
FROM mrpaper.avaliacao av 
INNER JOIN mrpaper.livro l ON av.livro_id_livro = l.id_livro
GROUP BY av.livro_id_livro, av.estrelas, av.avaliador;

-- NOME DO CLIENTE E QUAL A MEDIA DE ESTRELAS ELE DA PARA OS LIVROS QUE ELE LEU(na ordem de menor pra maior media).
SELECT cl.nome, avg(av.estrelas) AS "avaliacao media"
FROM mrpaper.cliente cl 
INNER JOIN mrpaper.avaliacao av ON cl.id_cliente = av.cliente_id_cliente
GROUP BY cl.id_cliente
ORDER BY avg(av.estrelas) asc;

-- quais editoras possuem livros avaliados por ordem de estrelas
SELECT ed.id_editora, ed.nome, av.estrelas 
FROM mrpaper.editora ed 
INNER JOIN mrpaper.livro_has_editora lhe ON ed.id_editora = lhe.editora_id_editora
JOIN mrpaper.livro li ON lhe.livro_id_livro = li.id_livro
JOIN mrpaper.avaliacao av ON li.id_livro = av.livro_id_livro
GROUP BY li.id_livro, ed.id_editora, av.estrelas
ORDER BY av.estrelas desc;

-- quais autores possuem venda
SELECT lhve.livro_id_livro, au.nome
FROM mrpaper.autores au
INNER JOIN mrpaper.livro_has_autores lha ON au.id_autores = lha.autores_id_autores
JOIN mrpaper.livro li ON lha.livro_id_livro = li.id_livro
JOIN mrpaper.livro_has_venda lhve ON li.id_livro = lhve.livro_id_livro
GROUP BY li.id_livro, lha.autores_id_autores;

-- quais os metodos de pagamento mais usador por ordem dos mais utilizados
SELECT mp.tipo, count(ve.metodo_pagamento_id_metodo_pagamento)AS "quantidade"
FROM mrpaper.metodo_pagamento mp
INNER JOIN mrpaper.venda ve ON ve.metodo_pagamento_id_metodo_pagamento = mp.id_metodo_pagamento
GROUP BY ve.metodo_pagamento_id_metodo_pagamento
ORDER BY count(ve.metodo_pagamento_id_metodo_pagamento) desc;
