-- Anotações práticas do Curso 4 (Módulo 3): Limpeza de dados com SQL
-- Praticando os comandos vistos nas aulas do Coursera

-- 1. DISTINCT: Usado para não trazer linhas repetidas na consulta
SELECT DISTINCT
    id_cliente,
    nome_cliente
FROM
    tabela_clientes;


-- 2. LENGTH e TRIM:
-- TRIM tira espaços em branco digitados sem querer antes ou depois do texto
-- LENGTH conta quantos caracteres tem (bom para checar se o estado tem só 2 letras ou se o CPF tem 11 números)
SELECT
    nome_cliente,
    estado,
    LENGTH(TRIM(estado)) AS quantidade_letras
FROM
    tabela_clientes
WHERE
    LENGTH(TRIM(estado)) > 2;


-- 3. SUBSTR (ou SUBSTRING): Pega só uma parte do texto
-- Exemplo: pegar só as 2 primeiras letras da coluna estado (começando na posição 1, pegando 2 letras)
SELECT
    id_cliente,
    SUBSTR(estado, 1, 2) AS uf_corrigida
FROM
    tabela_clientes;


-- 4. CAST: Converte um tipo de dado em outro
-- Exemplo da aula: quando um valor numérico ou data vem salvo como texto (STRING) e precisamos transformar em número (FLOAT64)
SELECT
    id_cliente,
    CAST(valor_compra AS FLOAT64) AS valor_convertido
FROM
    tabela_vendas;


-- 5. COALESCE: Substitui valores vazios (NULL) por um valor padrão para não dar erro na conta
SELECT
    id_cliente,
    COALESCE(saldo, 0) AS saldo_sem_nulos
FROM
    tabela_clientes;
