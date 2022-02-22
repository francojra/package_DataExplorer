
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
df <- read.csv("C:\\Users\\jeann\\OneDrive\\Área de Trabalho\\cardio_train.csv", 
               sep = ";")
df

# pre-processing
df <- 
  # remove the id
  select(df, -id) %>%
  # age: days -> years
  mutate(age = round(age / 365))


# observe first rows
head(df)
