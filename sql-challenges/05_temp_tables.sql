-- =================================================================
-- Categorias: Tabelas Temporárias & Categorização
-- Ficheiro: 05_temp_tables.sql
-- =================================================================

-- Exercício 1: Tabela temporária para avaliação de desempenho
-- Conceitos: CREATE TEMP TABLE, CASE WHEN
CREATE TEMP TABLE temp_performace AS
SELECT categoria, SUM(valor) AS soma_total
FROM pedidos
GROUP BY categoria;

SELECT 
    categoria, 
    soma_total,
    CASE
        WHEN soma_total > 1000 THEN 'OURO'
        WHEN soma_total BETWEEN 500 AND 1000 THEN 'PRATA'
        ELSE 'BRONZE'
    END AS status
FROM temp_performace;
