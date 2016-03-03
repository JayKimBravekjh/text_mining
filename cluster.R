tdm2 <- removeSparseTerms(tdm, sparse = 0.95)
m2 <- as.matrix(tdm2)
# cluster terms 
distMatrix <- dist(scale(m2))
fit <- hclust(distMatrix, method = "ward")
plot(fit)
rect.hclust(fit, k = 6)  # cut tree into 6 clusters

m3 <- t(m2) # transpose the matrix to cluster documents (tweets)
set.seed(122)  # set a fixed random seed
k <- 6   # number of clusters
kmeansResult <- kmeans(m3, k)
round(kmeansResult$centers, digits = 3)  # cluster centers

## analysis application big book computational data example
## 1 0.136 0.076 0.136 0.015 0.061 1.015 0.030
## 2 0.026 0.154 0.154 0.256 0.026 1.487 0.231
## 3 0.857 0.000 0.000 0.000 0.000 0.048 0.095
## 4 0.078 0.026 0.013 0.052 0.052 0.000 0.065
## 5 0.083 0.024 0.000 0.048 0.107 0.024 0.274
## 6 0.091 0.061 0.152 0.000 0.000 0.515 0.000
## mining network package position r research slides social
## 1 0.409 0.000 0.015 0.076 0.197 0.030 0.091 0.000
## 2 1.128 0.000 0.205 0.000 0.974 0.026 0.051 0.000
## 3 0.095 0.952 0.095 0.190 0.286 0.048 0.095 0.810
## 4 0.104 0.013 0.117 0.039 0.000 0.013 0.104 0.013
## 5 0.107 0.036 0.190 0.000 1.190 0.000 0.167 0.000
## 6 0.091 0.000 0.000 0.667 0.000 0.970 0.000 0.121
## tutorial university use
## 1 0.076 0.030 0.015
## 2 0.000 0.000 0.231
## 3 0.190 0.048 0.095

for (i in 1:k) { 
    cat(paste("cluster ", i, ":   ", sep = ""))
    s <- sort(kmeansResult$centers[i, ], decreasing = T)
    cat(names(s)[1:5], "\n")
    # print the tweets of every cluster
    # print (tweets[which(kmeansResult&cluster==i))
}

## cluster 1: data mining r analysis big
## cluster 2: data mining r book example
## cluster 3: network analysis social r position
## cluster 4: package mining slides university analysis
## cluster 5: r example package slides use
## cluster 6: research position data university big

