dtm <- as.DocumentTermMatrix(tdm)
library(topicmodels)
lda <- LDA(dtm, k = 8)  # find 8 topics
term <- terms(lda, 6)  # first 6 terms of every topic

##      Topic 1     Topic 2        Topic 3   Topic 4   Topic 5 ....
## [1,] "r"         "data"         "mining"  "r"       "data"  ....
## [2,] "example"   "introduction" "r"       "package" "mining"....
## [3,] "code"      "big"          "data"    "use"     "application"....
## [4,] "mining"    "analysis"     "text"    "group"   "r" ....
## [5,] "data"      "slides"       "package" "example" "use" ....
## [6,] "rule"      "mining"       "time"    "cluster" "due" ....

##      Topic 6     Topic 7       Topic 8    
## [1,] "data"      "research"    "analysis"
## [2,] "r"         "position"    "r"
## [3,] "job"       "data"        "network"
## [4,] "mining"    "university"  "computational"
## [5,] "lecture"   "analytics"   "tutorial"
## [6,] "university""scientist"   "slides"

term <- apply(term, MARGIN = 2, paste, collapse = ", ")

# first topic identified for every document (tweet)
topic <- topics(lda, 1)
topics <- data.frame(data=as.IDate(tweets.df$created), topic)
qplot(date, ..count.., data=topics, geom="density",
      fill=term[topic], position="stack")
      
