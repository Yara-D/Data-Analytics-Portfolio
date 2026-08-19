-- =================================================================
-- Categorias: Funções de Janela (Window Functions)
-- Ficheiro: 04_window_functions.sql
-- =================================================================

-- Exercício 1: Variação percentual de aumento salarial
-- Conceitos: LAG(), OVER (PARTITION BY ... ORDER BY ...)
WITH funcionario AS (
    SELECT
        salario,
        nome,
        data_aumento,
        funcionario_id,
        LAG(salario) OVER (PARTITION BY funcionario_id ORDER BY data_aumento) AS salario_anterior
    FROM historico_salario
)
SELECT
    nome,
    salario,
    data_aumento,
    salario_anterior,
    ((salario - salario_anterior) / salario_anterior) AS aumento
FROM funcionario
WHERE ((salario - salario_anterior) * 1.0 / salario_anterior) > 0.10;


-- Exercício 2: Média móvel de 3 períodos e identificação de picos
-- Conceitos: AVG() OVER (ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
WITH MediaMovel AS (
    SELECT 
        produto,
        valor,
        AVG(valor) OVER (
            PARTITION BY produto
            ORDER BY data_venda
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS media_3_periodos
    FROM vendas_historico
)
SELECT produto, valor, media_3_periodos
FROM MediaMovel
WHERE valor > (media_3_periodos * 1.20);
