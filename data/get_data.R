library(twitteR)
library(googlesheets)
library(dplyr)

source("./data/auth.R")

get_tweets <- function(user, cant) {
  tmp_json <- userTimeline(user, n=cant) 
  twListToDF(tmp_json) %>%
    select(id, screenName, created, text, favoriteCount, retweetCount)
}