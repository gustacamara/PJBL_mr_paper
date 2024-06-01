-- PROCEDURE

-- PROCEDURE ATUALIZAR VENDAS
DELIMITER //
CREATE PROCEDURE atualizar_vendas()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_livro_id INT;
    DECLARE v_quantidade SMALLINT;
    DECLARE v_quantidade_vendida INT;
    DECLARE v_quantidade_estoque INT;
    
    DECLARE cur CURSOR FOR
        SELECT livro_id_livro, quantidade
        FROM livro_has_venda;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_livro_id, v_quantidade;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Atualizar a quantidade vendida e em estoque
        SELECT quantidade_vendida, quantidade_estoque INTO v_quantidade_vendida, v_quantidade_estoque
        FROM livro
        WHERE id_livro = v_livro_id;
        
        SET v_quantidade_vendida = v_quantidade_vendida + v_quantidade;
        SET v_quantidade_estoque = v_quantidade_estoque - v_quantidade;
        
        UPDATE livro
        SET quantidade_vendida = v_quantidade_vendida,
            quantidade_estoque = v_quantidade_estoque
        WHERE id_livro = v_livro_id;
    END LOOP;
    
    CLOSE cur;
END //

DELIMITER ;

-- PROCEDURE GERAR RELATORIO VENDAS POR DATA
DELIMITER //

CREATE PROCEDURE gerar_relatorio_vendas_por_data(
    IN p_data DATE
)
BEGIN
    SELECT 
        v.data_emissao AS Data,
        COUNT(v.id_venda) AS Total_Vendas,
        SUM(lv.preco * lv.quantidade) AS Receita_Total
    FROM 
        venda v
        JOIN livro_has_venda lv ON v.id_venda = lv.venda_id_venda
    WHERE 
        v.data_emissao = p_data
    GROUP BY 
        v.data_emissao;
END //

DELIMITER ;


-- PROCEDURE ATUALIZAR DADOS DO CLIENTE
DELIMITER //

CREATE PROCEDURE atualizar_dados_cliente(
    IN p_id_cliente INT,
    IN p_nome VARCHAR(50),
    IN p_login VARCHAR(20),
    IN p_senha VARCHAR(20),
    IN p_email VARCHAR(50)
)
BEGIN
    -- Verificar se o cliente existe
    IF (SELECT COUNT(*) FROM cliente WHERE id_cliente = p_id_cliente) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cliente não encontrado';
    ELSE
        -- Atualizar dados do cliente
        UPDATE cliente
        SET nome = p_nome,
            login = p_login,
            senha = p_senha,
            email = p_email
        WHERE id_cliente = p_id_cliente;
    END IF;
END //

DELIMITER ;

CALL atualizar_vendas();
CALL gerar_relatorio_vendas_por_data('2024-04-01');
CALL atualizar_dados_cliente(1, 'Nome 1', 'Login 1', 'Senha 1', 'Email 1');

-- FUNCTION

-- FUNCTION OBTER PRECO LIVRO
DELIMITER //

CREATE FUNCTION obter_preco_livro(p_livro_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE preco_livro DECIMAL(10,2);

    SELECT preco INTO preco_livro
    FROM livro
    WHERE id_livro = p_livro_id;

    RETURN preco_livro;
END //

DELIMITER ;

-- FUNCTION CALCULAR TOTAL VENDA
DELIMITER //

CREATE FUNCTION calcular_total_venda(p_venda_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_venda DECIMAL(10,2);

    SELECT SUM(lv.preco * lv.quantidade) INTO total_venda
    FROM livro_has_venda lv
    WHERE lv.venda_id_venda = p_venda_id;

    RETURN total_venda;
END //

DELIMITER ;

-- FUNCTION OBTER TOTAL LIVROS VENDIDOS POR AUTOR
DELIMITER //

CREATE FUNCTION obter_total_livros_vendidos_autor(p_autor_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_vendidos INT;

    SELECT SUM(lv.quantidade) INTO total_vendidos
    FROM livro_has_venda lv
    INNER JOIN livro l ON lv.livro_id_livro = l.id_livro
    INNER JOIN livro_has_autores la ON l.id_livro = la.livro_id_livro
    WHERE la.autores_id_autores = p_autor_id;

    RETURN total_vendidos;
END //

DELIMITER ;


CALL obter_preco_livro(1);
CALL calcular_total_venda(1);
CALL obter_total_livros_vendidos_autor(1);

-- Trigger para inseririr uma nova venda quando um cliente for inserido

DELIMITER //

CREATE TRIGGER after_cliente_insert
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    -- Inserir uma nova venda quando um cliente é inserido
    INSERT INTO venda (data_emissao, metodo_pagamento_id_metodo_pagamento, cliente_id_cliente)
    VALUES (NOW(), 1, NEW.id_cliente);
END;
//

DELIMITER ;