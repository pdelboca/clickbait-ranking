# main.R
# This script executes a data pipeline that:
# 1. Gets last N tweets from defined twitter accounts
# 2. Classify them into Clickbaits or Not
# 3. Stores in a database 

library(dplyr)
library(purrr)

source("./data/get_data.R")
source("classifier.R")
source("dbConnect.R")

# medios <- c("clarincom", "todonoticias", "c5n", "pagina12", "LANACION", "LAVOZcomar", "lmdiariocomar", "latintacba", "lagenfm")
medios <- c("clarincom", "todonoticias", "c5n", "pagina12")
medios %>% 
  map_df(get_tweets, 2) %>% 
  classify_tweets() %>% 
  save_tweets()