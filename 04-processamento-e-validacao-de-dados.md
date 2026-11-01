# Anotações do Curso 4: Processar os dados para limpá-los (Em andamento)

Resumo do quarto curso da certificação do Google no Coursera. Atualmente estou no **Módulo 3**, aprendendo como identificar e corrigir "dados sujos" (*dirty data*) usando tanto Planilhas (Excel / Google Sheets) quanto consultas em **SQL**.

## 1. Integridade dos dados e tamanho da amostra (Módulo 1)
Antes de começar a limpar uma planilha ou tabela, aprendi que é preciso checar se temos dados suficientes para a análise fazer sentido:

* **Tamanho da amostra:** Se analisarmos poucos clientes, o resultado pode não refletir a realidade da empresa toda.
* **Margem de erro e Nível de confiança:** Indicam o quanto os resultados da nossa amostra podem variar em relação ao público total.
* **Principais problemas de "dados sujos":**
  * Linhas duplicadas (ex.: o mesmo cliente cadastrado duas vezes).
  * Dados incompletos ou células em branco (`NULL`).
  * Dados inconsistentes (ex.: estados escritos como `"SP"`, `"sp"` e `"São Paulo"` na mesma coluna).
  * Números ou datas salvos como texto, que impedem fazer contas.

## 2. Limpeza de dados em Planilhas — Excel e Google Sheets (Módulo 2)
Ferramentas e fórmulas que pratiquei para limpar tabelas antes de analisar:

* **Remover duplicatas:** Ferramenta nativa das planilhas para apagar linhas repetidas.
* **`ARRUMAR()` / `TRIM()`:** Tira espaços em branco que foram digitados sem querer antes ou depois das palavras.
* **`EXT.TEXTO()` / `MID()` e Dividir texto em colunas:** Útil para separar informações que vieram juntas na mesma célula (como separar o código da agência do número da conta, ou separar nome e sobrenome).
* **`PROCV()` / `VLOOKUP()` junto com `SEERRO()` / `IFERROR()`:** Para buscar informações em outra aba da planilha e avisar de forma clara quando algum código não for encontrado.
* **Formatação condicional:** Destacar com cor as células vazias ou valores fora do padrão para facilitar a revisão visual.

## 3. Limpeza de dados com SQL no BigQuery (Módulo 3 — Estudando atualmente)
Quando a tabela é grande demais para abrir no Excel, fazemos a mesma limpeza usando comandos de SQL:

* **`DISTINCT`:** Traz apenas valores únicos no `SELECT`, ignorando linhas repetidas.
* **`TRIM()`:** Remove espaços extras no começo ou no fim do texto.
* **`LENGTH()`:** Conta quantos caracteres existem no campo (muito útil para conferir se um código, UF ou CPF tem a quantidade certa de dígitos).
* **`SUBSTR()`:** Extrai apenas um pedaço do texto (ex.: pegar só as 2 primeiras letras da sigla do estado).
* **`CAST()`:** Converte o tipo da coluna (por exemplo, transformar um valor financeiro que veio como texto `STRING` em número decimal `FLOAT64`, ou transformar texto em data `DATE`).
* **`COALESCE()`:** Substitui campos vazios (`NULL`) por um valor padrão (como 
