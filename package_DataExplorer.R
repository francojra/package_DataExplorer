
# Pacote DataExplorer ----------------------------------------------------------------------------------------------------------------------------
# Referência: R Descomplicado --------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 21/02/22 ---------------------------------------------------------------------------------------------------------------------------


# Sobre o pacote ---------------------------------------------------------------------------------------------------------------------------

## O DataExplorer simplifica e automatiza as análises exploratórias de dados. O
## pacote automaticamente escaneia a performance e o perfil de cada variável. Ele
## Também oferece várias funções que geram diferentes gráficos de variáveis 
## discretas ou contínuas.

## De forma interessante, p pacote também gera um documento HTML com a ajuda
## da função create_report.

# Carregar dados e observar primeiras linhas -----------------------------------------------------------------------------------------------

# install.packages("tidyverse")
library(dplyr)
library(readr)

# read csv file
df <- read.csv("cardio_train.csv", sep = ";")
view(df)

# pre-processing
df <- 
  # remove the id
  select(df, -id) %>%
  # age: days -> years
  mutate(age = round(age / 365))
df

# observe first rows
head(df)

# Métrica do banco de dados ---------------------------------------------------------------------------------------------------------------

summary(df)
df$cardio <- as.factor(df$cardio)
df$gender <- as.factor(df$gender)
df$cholesterol <- as.factor(df$cholesterol)
df$gluc <- as.factor(df$gluc )
df$smoke <- as.factor(df$smoke)
df$alco <- as.factor(df$alco)
df$active <- as.factor(df$active)

# Análise Exploratória de Dados com o Pacote -----------------------------------------------------------------------------------------------

## Baixar pacote

install.packages("DataExplorer")
library(DataExplorer)

## Gerar relatório com todas as Análises Exploratórias dos Dados

df %>%
    create_report(
        output_file = paste("Report", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), sep = " - "),
        report_title = "EDA Report - Cardiovascular Disease",
        y = "cardio"
    )

## Gráficos

plot_str(df) # Gráfico com estrutura dos dados
plot_bar(df) # Gráficos de barras para cada variável discreta
plot_bar(df, by = "cardio") # Gráficos de barras agrupados em relação a uma variável discreta
plot_qq(df) # Gráficos quantile-quantile para variáveis contínuas
plot_density(df) # Gráficos de densidade para as variáveis contínuas
plot_correlation(df) # Mapa de correlação entre variáveis
plot_prcomp(df) # Performa a Principal Component Analysis (PCA) e indica a porcentagem
# de variância explicada por cada componente principal
