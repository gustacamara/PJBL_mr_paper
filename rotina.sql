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

CALL atualizar_vendas();