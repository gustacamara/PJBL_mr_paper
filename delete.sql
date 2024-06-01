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