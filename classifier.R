classify_tweets <- function(tweets){
  #TODO: replace with ML model
  is_clickbait <- rbinom(n = nrow(tweets), size = 1, prob = 0.15)
  
  tweets$is_clickbait <- is_clickbait
  
  tweets
}