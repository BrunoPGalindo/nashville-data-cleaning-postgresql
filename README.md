<img width="838" height="123" alt="image" src="https://github.com/user-attachments/assets/273c09ca-0603-407d-a6e0-8d38d51a9d88" />### **[EN]**

# Housing Data Cleaning with SQL
This project's goal is to performs a Data Cleaning process on a Nashville Housing dataset using SQL. The primary goal is to transform raw, messy data into a standardized format suitable for analysis, format data, deal with missing addresses, and duplicate entries. 
The analysis process involves gathering data from a raw table, data cleaning it(standardizing date formats, populating missing property addresses using self-joins, parsing address strings into individual columns), and removing duplicates using CTEs. 
The information obtained from this project aims to ensure data quality and integrity, simulating a real-world data engineering and preparation task.

# Data
The data source is a table named `nashville_housing`. The raw data is in the database, and it is organized as follows:

**ParcelID**: Unique identifier for the property, used to populate missing addresses.

**PropertyAddress**: The raw address field containing both street and city.

**SaleDate**: The transaction date in a timestamp format requiring standardization.

**SoldAsVacant**: A categorical field indicating vacancy status ('Y', 'N', 'Yes', 'No').

**OwnerAddress**: The owner's address including state information.

# Key Engineered Features:
**SaleDateConverted**: Standardized date format converted from the original timestamp.

**PropertySplitAddress**: The street address extracted from the `PropertyAddress`.

**PropertySplitCity**: The city extracted from the `PropertyAddress`.

**OwnerSplitAddress**: The street address extracted from the `OwnerAddress`.

**OwnerSplitCity**: The city extracted from the `OwnerAddress`.

**OwnerSplitState**: The state extracted from the `OwnerAddress`.

**SoldAsVacant**: Standardized field containing only 'Yes' and 'No' values.

# Personal Contact Details
* **Bruno P. Galindo** [brunopgalindo@hotmail.com](mailto:brunopgalindo@hotmail.com) -- Contact for inquiries regarding data.

# Getting Started
For this analysis project, the queries are contained within a SQL script file. To replicate the analysis:

1) Ensure the `nashville_housing` dataset is imported into your PostgreSQL database.
2) Run the data scripts.
3) Run the visualization cells to generate the results as in the GitHub page.

# Requirements
To run this project, you will need a SQL environment (PostgreSQL recommended) with the following setup:

**Step 1: Open the SQL environment of your choice**

**Step 2: Import the raw data** -- Ensure table `nashville_housing` exists with raw data

**Step 3: Load the scripts and run them all**

# Authors
* Bruno P. Galindo - Personal Project - https://www.linkedin.com/in/brunopgalindo/

# Project Motivation
* The intention of the project is to challenge me and develop critical thinking skills regarding data manipulation, and to ensure data reliability through cleaning.
* This is a public dataset and the only purpose of it is to be used for study. None of the data is sensitive in any way.
* Inspiration: Data cleaning workflows focusing on data quality and preparation for downstream analysis.
---

# **[PT/BR]**

# Limpeza de Dados Imobiliários com SQL
O objetivo deste projeto é realizar um processo de Limpeza de Dados em um conjunto de dados Imobiliários de Nashville usando SQL. O objetivo principal é transformar dados brutos em um formato padronizado adequado para análise, abordando problemas
como formatação de datas, endereços ausentes e entradas duplicadas. O processo de análise envolve a coleta de dados de uma tabela com dados "sujos", limpeza de dados (padronização de formatos de data, preenchimento de endereços de propriedades ausentes usando 
self-joins, análise de strings de endereço em colunas individuais) e remoção de duplicatas usando CTEs. As informações obtidas neste projeto visam garantir a qualidade e integridade dos dados, simulando uma tarefa de engenharia e preparação de dados do mundo real.

# Dados
A fonte de dados é uma tabela chamada nashville_housing. Os dados brutos estão no banco de dados e estão organizados da seguinte forma:

**ParcelID**: Identificador único para a propriedade, usado para preencher endereços ausentes.

**PropertyAddress**: O campo de endereço bruto contendo rua e cidade.

**SaleDate**: A data da transação em um formato timestamp que requer padronização.

**SoldAsVacant**: Um campo categórico indicando o status de vacância ('Y', 'N', 'Yes', 'No').

**OwnerAddress**: O endereço do proprietário, incluindo informações do estado.

## Variáveis Chaves Calculadas:

`SaleDateConverted`: Formato de data padronizado convertido do timestamp original.

`PropertySplitAddress`: O endereço da rua extraído do `PropertyAddress`.

`PropertySplitCity`: A cidade extraída do `PropertyAddress`.

`OwnerSplitAddress`: O endereço da rua extraído do `OwnerAddress`.

`OwnerSplitCity`: A cidade extraída do `OwnerAddress`.

`OwnerSplitState`: O estado extraído do `OwnerAddress`.

`SoldAsVacant`: Campo padronizado contendo apenas valores 'Yes' e 'No'.

# Dados Pessoais para Contato
* **Bruno P. Galindo** [brunopgalindo@hotmail.com](mailto:brunopgalindo@hotmail.com) -- Contato para perguntas relacionadas aos dados.

# Começando
Para este projeto de análise, as consultas estão contidas em um arquivo de script SQL. Para replicar a análise:
1) Garanta que o conjunto de dados `nashville_housing` esteja importado em seu banco de dados PostgreSQL.
2) Execute os scripts de limpeza na sequência mostrada.
3) Após executar tudo, execute uma última vez as consultas de seleção finais para verificar os dados limpos como na página do GitHub.

# Requisitos
Para executar este projeto, você precisará de um ambiente SQL (PostgreSQL recomendado) com a seguinte configuração:

**Passo 1**: Abra o ambiente SQL de sua escolha

**Passo 2: Importe os dados brutos** -- Garanta que a tabela `nashville_housing` exista com dados brutos

**Passo 3: Carregue os scripts e execute todos eles**

# Autores
* Bruno P. Galindo - Projeto Pessoal - https://www.linkedin.com/in/brunopgalindo/

# Motivação do Projeto
* A intenção do projeto é me desafiar e desenvolver habilidades de pensamento crítico em relação à manipulação de dados, e garantir a confiabilidade dos dados através da limpeza.
* Este é um conjunto de dados público e o único propósito dele é ser usado para estudo. Nenhum dos dados é sensível de forma alguma.
* Inspiração: Fluxos de trabalho de limpeza de dados focando na qualidade e preparação de dados para análises posteriores.





