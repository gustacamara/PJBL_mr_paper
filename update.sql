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