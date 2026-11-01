# Anotações do Curso 3: Preparar os dados para exploração

Resumo do terceiro curso da certificação do Google no Coursera. Aqui aprendi como os dados são gerados e organizados dentro das empresas, como avaliar se uma base é confiável e dei os primeiros passos em bancos de dados com **SQL** no Google BigQuery.

## 1. Tipos e formatos de dados que vimos nas aulas
* **Quantitativos vs. Qualitativos:** Dados quantitativos são números que podemos medir ou contar (ex.: valor de uma transferência, idade). Dados qualitativos são características ou categorias (ex.: nome do cliente, cidade, avaliação de atendimento).
* **Estruturados vs. Não estruturados:** Dados estruturados ficam organizados em linhas e colunas (como planilhas de Excel e tabelas de SQL). Dados não estruturados não têm formato de tabela (como e-mails, áudios, fotos ou comentários abertos).
* **Dados de primeira parte ( internos) vs. terceira parte (externos):** Dados internos são os que a própria empresa coleta dos seus sistemas; dados externos vêm de pesquisas de mercado ou órgãos públicos (como o IBGE).

## 2. Como saber se uma base de dados é boa (Regra ROCCC)
Antes de confiar em uma tabela para fazer uma análise, o curso ensina a checar 5 pontos (**ROCCC**):

* **R (Reliable / Confiável):** Os dados estão completos e sem tendência (viés)?
* **O (Original):** Sabemos de onde os dados vieram originalmente?
* **C (Comprehensive / Abrangente):** A tabela tem todas as colunas que precisamos para responder à pergunta?
* **C (Current / Atual):** Os dados são recentes ou já ficaram desatualizados?
* **C (Cited / Citado):** A fonte é conhecida e oficial?

## 3. Evitando erros de interpretação (Viés de Dados)
* **Viés de amostragem:** Quando analisamos apenas uma parte do público que não representa o todo (ex.: fazer uma pesquisa só com clientes que usam o aplicativo no celular e esquecer quem vai à agência).
* **Viés de confirmação:** Quando olhamos os números procurando apenas o que confirma a nossa opinião inicial.

## 4. Introdução a Bancos de Dados e SQL (BigQuery)
Neste curso comecei a entender como funcionam os bancos de dados relacionais:
* **Chave Primária (*Primary Key*):** Coluna que identifica cada linha sem repetir (ex.: `id_cliente`).
* **Chave Estrangeira (*Foreign Key*):** Coluna que conecta uma tabela à outra (ex.: `id_agencia` dentro da tabela de clientes).
* **Metadados:** São as informações que explicam os dados (quem criou a tabela, quando foi atualizada e o que significa cada coluna).
* **Estrutura básica do SQL:**
  * `SELECT`: escolhe quais colunas queremos ver.
  * `FROM`: indica de qual tabela os dados estão vindo.
  * `WHERE`: filtra apenas as linhas que atendem a uma condição (ex.: `WHERE estado = 'SP'`).

## 5. Ética e Privacidade
* Importância de proteger informações pessoais dos clientes (como CPF, endereço e telefone), usando apenas os dados necessários para a análise e mantendo a segurança dos arquivos.
