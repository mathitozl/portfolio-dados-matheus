# 🛡️ Guia Prático: Governança, Ética e Qualidade de Dados

Resumo estruturado dos conceitos aplicados nos **Cursos 1 a 4** da certificação **Google Data Analytics**, com foco em confiabilidade de dados para tomada de decisão corporativa e financeira.

## 1. Critério ROCCC para Avaliação de Fontes de Dados (Curso 3)
Antes de iniciar qualquer análise de risco, crédito ou comportamento de clientes, a integridade da fonte é validada através do framework **ROCCC**:

* **R — Reliable (Confiável):** A amostra representa a população real sem viés de seleção (*Selection Bias*) ou confirmação.
* **O — Original (Original):** Priorização de dados primários validados internamente em vez de fontes secundárias sem rastreabilidade.
* **C — Comprehensive (Abrangente):** A base contém todas as variáveis críticas necessárias para responder ao problema de negócio.
* **C — Current (Atual):** Os dados refletem o cenário presente; bases defasadas geram distorções em modelos analíticos.
* **C — Cited (Citado/Auditável):** Origem documentada, garantindo conformidade com políticas de Governança e LGPD.

## 2. Checklist de Higienização de Dados (Curso 4)
Principais categorias de "dados sujos" (*dirty data*) tratadas antes da etapa de análise exploratória:

| Tipo de Problema | Impacto no Negócio | Solução Técnica (SQL / Planilhas) |
| :--- | :--- | :--- |
| **Dados Duplicados** | Contagem inflada de clientes ou transações em duplicidade | Uso de `DISTINCT` no SQL ou ferramenta *Remover Duplicatas* |
| **Dados Desatualizados** | Decisões baseadas em perfis de crédito antigos | Filtro temporal (`WHERE`) e atualização cadastral contínua |
| **Dados Incompletos (Nulos)** | Erros matemáticos em médias e indicadores financeiros | Tratamento com `COALESCE()`, `IFNULL()` ou exclusão justificada |
| **Dados Inconsistentes / Tipagem** | Falha em cruzamentos (`JOIN`) e cálculos numéricos | Padronização com `TRIM()`, `UPPER()`, `SUBSTR()` e conversão com `CAST()` |

## 3. Boas Práticas de Documentação (Changelog)
Toda alteração estrutural na base bruta é registrada em um **Changelog** contendo:
1. **Data e responsável** pela higienização;
2. **Anomalia identificada** (ex.: 42 registros com UF contendo espaços em branco);
3. **Regra de negócio aplicada** (ex.: remoção de espaços com `TRIM` e conversão de nulos para zero).
