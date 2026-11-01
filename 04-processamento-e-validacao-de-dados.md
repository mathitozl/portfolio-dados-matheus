# 🔍 Curso 4: Processamento, Integridade Estatística e Validação de Dados

Síntese prática aplicada no **Curso 4 (Processar os Dados para Limpá-los)** da certificação **Google Data Analytics**, cobrindo desde a validação estatística de amostras até a documentação final (*Changelog*) pós-higienização.

## 1. Integridade Estatística e Amostragem (Módulo 1)
Antes de processar uma base (especialmente quando não há acesso a 100% da população de clientes), a representatividade dos dados é validada por quatro indicadores:

* **Tamanho da Amostra (*Sample Size*):** Volume mínimo de registros necessário para que o comportamento observado represente a carteira real de clientes.
* **Nível de Confiança (*Confidence Level*):** Probabilidade de que a amostra reflita com precisão a população total (padrão de mercado: **95%** ou **99%** em análises de risco).
* **Margem de Erro (*Margin of Error*):** Intervalo máximo de variação aceitável nos resultados em relação ao valor real da população.
* **Poder Estatístico (*Statistical Power*):** Probabilidade de identificar um efeito ou diferença real na análise quando ele de fato existe (mínimo recomendado de **0,8** ou **80%**).

## 2. Simulação de Auditoria: Antes vs. Depois da Limpeza (Módulos 2 e 3)
Exemplo de transformação aplicada em uma base bruta de clientes bancários utilizando **SQL (`TRIM`, `UPPER`, `SUBSTR`, `CAST`, `COALESCE`)** e **Planilhas**:

### Base Bruta (*Dirty Data*)
| id_cliente | nome_cliente | estado_uf | renda_mensal_texto | saldo_conta_corrente |
| :--- | :--- | :--- | :--- | :--- |
| `  10492 ` | `carlos eduardo silva` | `sp - capital` | `"8500.50"` | `NULL` |
| `10492` | `CARLOS EDUARDO SILVA` | `SP` | `"8500.50"` | `NULL` |
| ` 20881` | `fernanda oliveira ` | `rj` | `NULL` | `3240.00` |

### Base Higienizada (*Clean Data*)
| id_cliente_limpo | nome_cliente_padronizado | uf_padronizada | renda_mensal (FLOAT64) | saldo_atual (FLOAT64) | status_qualidade_cadastro |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `10492` | `CARLOS EDUARDO SILVA` | `SP` | `8500.50` | `0.00` | `Cadastro Validado` |
| `20881` | `FERNANDA OLIVEIRA` | `RJ` | `NULL` | `3240.00` | `Cadastro Pendente de Atualização` |

## 3. Registro de Alterações (*Changelog* — Módulo 4)
Documentação técnica para rastreabilidade e auditoria da equipe de dados:

* **[v1.0.1] — Remoção de Duplicidades:** Exclusão de registros duplicados para o `id_cliente = 10492` via cláusula `DISTINCT` após padronização de caixa alta (`UPPER`) e espaços (`TRIM`).
* **[v1.0.2] — Padronização Geográfica:** Extração dos 2 primeiros caracteres da coluna `estado_uf` via `SUBSTR(TRIM(estado_uf), 1, 2)`, corrigindo entradas como `"sp - capital"` para `"SP"`.
* **[v1.0.3] — Conversão de Tipagem e Nulos:** Conversão de `renda_mensal_texto` para `FLOAT64` via `CAST()` e substituição de saldos `NULL` por `0.00` com `COALESCE()` para evitar distorções em cálculos de liquidez.
