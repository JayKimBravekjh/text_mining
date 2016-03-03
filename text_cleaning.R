library(tm)
# build a corpus, and specify the source to be character vectors 
myCorpus <- Corpus(VectorSource(tweets.df$text))

# convert to lower case
# tm v0.6
myCorpus <- tm_map(myCorpus, content_transformer(tolower))
# tm v0.5-10
# myCorpus <- tm_map(myCorpus, tolower)

# remove URLs
removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
# tm v0.6
myCorpus <- tm_map(myCorpus, content_transformer(removeURL))
# tm v0.5-10
# myCorpus <- tm_map(myCorpus, removeURL)
# remove anything other than English letters or space 
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
myCorpus <- tm_map(myCorpus, content_transformer(removeNumPunct))

# remove punctuation 
# myCorpus <- tm_map(myCorpus, removePunctuation)
# remove numbers
# myCorpus <- tm_map(myCorpus, removeNumbers)

# add two extra stop words: "available" and "via"
myStopwords <- c(stopwords('english'), "available", "via")
# remove "r" and "big" from stopwords
myStopwords <- setdiff(myStopwords, c("r", "big"))
# remove stopwords from corpus
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)

# remove extra whitespace 
myCorpus <- tm_map(myCorpus, stripWhitespace)

# keep a copy of corpus to use later as a dictionary for stem completion
myCorpusCopy <- myCorpus
# stem words
myCorpus <- tm_map(myCorpus, stemDocument)


# inspect the first 5 documents (tweets)
# inspect(myCorpus[1:5])
# The code below is used for to make text fit for paper width
for (i in c(1:2, 320)){
    cat(paste0("[", i, "] "))
    writeLines(strwrap(as.character(myCorpus[[i]]), 60))
}

stemCompletion2 <- function(x, dictionary){
    x <- unlist(strsplit(as.character(x), " "))
    x <- x[x != ""]
    x <- stemCompletion(x, dictionary=dictionary)
    x <- paste(x, sep="", collapse= " ")
    PlainTextDocument(stripWhitespace(myCorpus))
    
miningCases <- lapply(myCorpusCopy, 
    function(x) { grep(as.character(x), pattern = "\\<mining")})
sum(unlist(miningCases))

## [1] 82

# count frequency of "miner"
minerCases <- lapply(myCorpusCopy, 
     function(x) {grep(as.character(x), pattern = "\\<miner")
sum(unlist(minerCases))

## [1] 5

# replace "miner" with "mining"
myCorpus <- tm_map(myCorpus, content_transformer(gsub),
                  pattern = "miner", replacement = "mining")
tdm <- TermDocumentMatrix(myCorpus, 
                            control = list(wordLengths = c(1, Inf)))

tdm

## <<TermDocumentMatrix (terms: 822, documents : 320)>>
## Non-/space entries: 2460/260580
## Sparsity : 99%
## Maximal term length : 27
## Weighting : term frequency (tf)


