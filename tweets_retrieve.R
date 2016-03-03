## Option 1: retrieve tweets from Twitter
library(twitteR)
tweets <- userTimeline("RDataMining", n = 3200)

## Option 2: download @RDataMining tweets from RDataMining.com 
url <- "http://www.rdatamining.com/data/rdmTweets-201306.RData"
download.file(url, destfile = "./data/rdmTweets-201306.RData")

## load tweets into R
load(file = "./data/rdmTweets-201306.RData")
(n.tweet <- length(tweets))

## [1] 321

# convert tweets to a data frame
tweets.df <- twListToDF(tweets)
dim(tweets.df)

## [1] 320  14 

for (i in c(1:2, 320)){
     cat(paste0("[", i, "] "))
     writeLines(strwrap(tweets.df$text[i], 60))
}

## [1] Examples on calling Java code from R http://t.co/Yg1Aiv...
## [2] Simulating Map-Reduce in R for Big Data Analysis Using 
## Flights Data http://t.co/uIAh6PgvQv via @rbloggers
## [320] An R Reference Card for Data Mining is now available on 
## CRAN. It lists many useful R functions and packages for 
## data mining applications. 



