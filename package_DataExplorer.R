
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

# Análise Exploratória de Dados com o Pacote -----------------------------------------------------------------------------------------------

install.packages("DataExplorer")
library(DataExplorer)


df %>%
    create_report(
        output_file = paste("Report", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), sep = " - "),
        report_title = "EDA Report - Cardiovascular Disease",
        y = "cardio"
    )

plot_str(df)
plot_bar(df)
plot_bar(df, by = "cardio")
plot_qq(df)
plot_density(df)
plot_correlation(df)
plot_prcomp(df)
