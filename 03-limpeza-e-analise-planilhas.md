# 📈 Limpeza e Tratamento de Dados em Planilhas (Excel / Google Sheets)

Documentação das principais rotinas e fórmulas aplicadas nos **Cursos 2, 3 e 4** da certificação **Google Data Analytics** para auditoria, cruzamento e higienização de relatórios financeiros.

## 1. Principais Funções Aplicadas na Higienização

| Função (PT-BR / EN) | Objetivo Prático | Exemplo de Uso em Base Financeira |
| :--- | :--- | :--- |
| `ARRUMAR()` / `TRIM()` | Remove espaços extras antes, depois ou duplicados no texto | `=ARRUMAR(B2)` para corrigir nomes de correntistas importados de sistemas legados |
| `EXT.TEXTO()` / `MID()` | Extrai um trecho específico de um código padronizado | `=EXT.TEXTO(C2; 1; 4)` para isolar o código da agência a partir do identificador completo |
| `PROCV()` / `XLOOKUP()` | Cruza informações entre duas tabelas usando uma chave única | `=PROCV(A2; Base_Agencias!A:C; 3; FALSO)` para buscar a regional de cada conta |
| `SEERRO()` / `IFERROR()` | Trata erros de cruzamento sem quebrar o cálculo do painel | `=SEERRO(PROCV(...); "Cadastro Não Localizado")` para identificar pendências cadastrais |
| `CONT.SE()` / `COUNTIF()` | Conta ocorrências específicas para auditoria de duplicidades | `=CONT.SE($A$2:$A$5000; A2)` para sinalizar se um mesmo CPF aparece mais de uma vez |
| `SOMASES()` / `SUMIFS()` | Soma valores financeiros aplicando múltiplos critérios | `=SOMASES(D:D; B:B; "SP"; C:C; "Ativo")` para somar o volume transacionado por UF e status |

## 2. Fluxo de Auditoria antes da Análise (Checklist em Planilhas)

1. **Remoção de Duplicatas e Espaços:** Aplicação da ferramenta nativa *Remover Duplicatas* combinada com `ARRUMAR()` nas chaves primárias (`ID_Cliente` e `CPF`).
2. **Validação de Dados e Formatação Condicional:** Regras visuais para destacar células em branco, valores negativos inesperados ou datas fora do período contábil analisado.
3. **Tabelas Dinâmicas (Pivot Tables):** Agrupamento rápido por agência, faixa de renda e status cadastral para identificar *outliers* antes de exportar a base limpa.
