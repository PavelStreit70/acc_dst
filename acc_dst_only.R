
###########

#Načíst data, vybrat parametry a postupně jednotlivé hodnoty transportovat
#do GraphPadu

library(readr)
data <- read_csv("~/FIMTrack_data/Rko/acc_dst/250324_1.csv")
View(data)

#Knihovny

library(readxl)
library(dplyr)
library(tidyr)
library(lme4) #lmer
library(lmerTest)
library(multcomp) #Attaching package: ‘MASS’, dplyr::select masked
library(emmeans) #emmeans
library(effects) #allEffects
library(ggplot2)
library(nortest)  #normality testing 
library(car)   #Levene test
library(ggprism) #aby to vypadalo podobně jako když se používá Prism
library (psych)

#Vyhledání konkrétních parametrů


#Vypsat celkovou uraženou vzdálenost acc_dist

####Ještě jednou

# Načti knihovnu pro práci s daty
library(dplyr)

# Načti data
data <- read.csv("~/FIMTrack_data/Rko/acc_dst/250324_1.csv", check.names = FALSE)

# Přejmenuj první sloupec na 'parameter'
colnames(data)[1] <- "parameter"

# Vyfiltruj řádky s acc_dst
acc_dst_rows <- data %>% filter(grepl("acc_dst", parameter))

# Funkce na získání poslední nenulové / ne-NA hodnoty ve sloupci
get_last_valid <- function(column) {
  rev_column <- rev(column)
  last_value <- rev_column[!is.na(rev_column) & rev_column != 0][1]
  return(last_value)
}

# Aplikuj funkci na každý sloupec kromě 'parameter'
last_valid_values <- sapply(acc_dst_rows[ , -1], get_last_valid)

# Výpis
print(last_valid_values)