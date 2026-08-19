-- =================================================================
-- Categorias: Limpeza e Tratamento de Dados
-- Ficheiro: 03_data_cleansing.sql
-- =================================================================

-- Exercício 1: Tratamento de nomes e contactos ("Base Suja")
-- Conceitos: INITCAP, TRIM, REPLACE, LEFT
SELECT 
    INITCAP(TRIM(nome_completo)) AS nome_limpo,
    LEFT(telefone_formatado, 2) AS codigo_area,
    REPLACE(REPLACE(REPLACE(telefone_formatado, '.', ''), '-', ''), ' ', '') AS telefone_limpo
FROM clientes_iniciais;


-- Exercício 2: Extração de código composto e classificação condicional
-- Conceitos: SUBSTRING, POSITION, SPLIT_PART, CASE WHEN
WITH tabela_limpa AS (
    SELECT 
        SUBSTRING(codigo_venda FROM 1 FOR POSITION('-' IN codigo_venda) - 1) AS regiao,
        SPLIT_PART(codigo_venda, '-', 2) AS categoria,
        SPLIT_PART(codigo_venda, '-', 3)::numeric AS valor_venda
    FROM vendas_brutas
)
SELECT 
    regiao,
    categoria,
    valor_venda,
    CASE
        WHEN valor_venda < 300 THEN 'Venda Baixa'
        WHEN valor_venda >= 300 AND valor_venda < 1000 THEN 'Venda Media'
        ELSE 'Venda Alta'
    END AS classificacao_risco
FROM tabela_limpa;
