/*
===============================================================================
PROJETO PRÁTICO: Higienização de Base de Clientes e Transações Bancárias
AUTOR: Matheus
CONTEXTO: Curso 4 (Módulo 3) - Processar os Dados para Limpá-los (Google / Coursera)
OBJETIVO: Garantir a qualidade e integridade dos dados antes da análise de crédito,
          corrigindo espaços extras, padronizando códigos de agência/UF, tratando
          valores nulos e convertendo tipos de dados (strings para numérico/data).
===============================================================================
*/

-- 1. AUDITORIA INICIAL: Identificar registros únicos de clientes (remoção de duplicatas)
SELECT 
    DISTINCT id_cliente,
    nome_cliente,
    cpf
FROM 
    `projeto_banco.bruto.cadastro_clientes`;


-- 2. VALIDAÇÃO DE COMPRIMENTO: Identificar CPFs e siglas de Estado (UF) fora do padrão
-- O CPF limpo deve conter exatamente 11 dígitos e a UF exatamente 2 caracteres
SELECT 
    id_cliente,
    cpf,
    LENGTH(TRIM(cpf)) AS tamanho_cpf,
    estado_uf,
    LENGTH(TRIM(estado_uf)) AS tamanho_uf
FROM 
    `projeto_banco.bruto.cadastro_clientes`
WHERE 
    LENGTH(TRIM(cpf)) <> 11 
    OR LENGTH(TRIM(estado_uf)) <> 2;


-- 3. QUERY DE LIMPEZA E PADRONIZAÇÃO (Tabela Limpa para Análise)
-- Aplicação de TRIM, UPPER, SUBSTR, CAST, COALESCE e CASE WHEN
SELECT
    -- Remove espaços em branco acidentais no ID
    TRIM(id_cliente) AS id_cliente_limpo,
    
    -- Padroniza o nome do cliente em letras maiúsculas e sem espaços extras
    UPPER(TRIM(nome_cliente)) AS nome_cliente_padronizado,
    
    -- Extrai apenas os 2 primeiros caracteres da UF e padroniza em maiúsculas
    UPPER(SUBSTR(TRIM(estado_uf), 1, 2)) AS uf_padronizada,
    
    -- Extrai os 4 primeiros dígitos do código da agência
    SUBSTR(TRIM(codigo_agencia), 1, 4) AS agencia_padronizada,
    
    -- Converte o valor de renda mensal de texto (STRING) para decimal (FLOAT64)
    CAST(renda_mensal_texto AS FLOAT64) AS renda_mensal,
    
    -- Converte a data de abertura da conta de texto para formato DATE
    CAST(data_abertura_texto AS DATE) AS data_abertura_conta,
    
    -- Substitui saldo nulo por 0.00 para evitar erros em cálculos de média
    COALESCE(saldo_conta_corrente, 0.00) AS saldo_atual,
    
    -- Classifica o perfil de atendimento com base na consistência cadastral
    CASE 
        WHEN renda_mensal_texto IS NULL THEN 'Cadastro Pendente de Atualização'
        ELSE 'Cadastro Validado'
    END AS status_qualidade_cadastro

FROM 
    `projeto_banco.bruto.cadastro_clientes`
WHERE 
    id_cliente IS NOT NULL;
