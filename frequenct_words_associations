idx <- which(dimnames(tdm)$Terms == "r")
inspect(tdm[idx + (0:5), 101:110])

## <<TermDocumentMatrix (terms: 6, documents : 10)>>
## Non-/sparse entries : 4/56
## Sparsity : 93 %
## Maximal term length : 12
## Weighting : term frequency (tf)
## Docs
##Terms       101 102 103 104 105 106 107 108 109 110
## r            0   1   1   0   0   0   0   0   1   1
## ramachandran 0   0   0   0   0   0   0   0   0   0
## random       0   0   0   0   0   0   0   0   0   0
## ranked       0   0   0   0   0   0   0   0   0   0
## rann         0   0   0   0   0   0   0   0   0   0
## rapidmining  0   0   0   0   0   0   0   0   0   0

# inspect frequent words 
freq.terms <- findFreqTerms(tdm, lowfreq = 15)

## [1] "analysis"       "application"     "big"
## [4] "book"           "code"            "computational"
## [7] "data"           "example"         "group"
## [10]"introduction"   "mining"          "network"
## [13]"package"        "position"        "r"
## [16]"research"       "see"             "slides"
## [19]"social"         "tutorial"        "university"
## [22]"use"    

term.freq <- rowSums(as.matrix(tdm))
term.freq <- subset(term.freq, term.freq >=15)
df <- data.frame(term = names(term.freq), freq = term.freq)

library(ggplot2)
ggplot(df, aes(x = term, y = freq)) + geom_bar(stat="identity") + xlab("Terms") + ylab("Count") + coord_flip()

# which words are associated with 'r'? 
findAssocs(tdm, "r", 0.2)

##            r
## example 0.33
## code    0.29

# which words are associated with 'mining'?
findAssocs(tdm, "mining", 0.25)

##                 mining
## data              0.48         
## mahout            0.30
## recommendation    0.30
## sets              0.30
## supports          0.30
## frequent          0.27
## itemset           0.26


library(graph)
library(Rgraphviz)
plot(tdm, term = freq.terms, corThreshold = 0.1, weighting = T)

