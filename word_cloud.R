library(wordcloud)
wordcloud(words = names(word.freq), freq = word.freq, min.freq = 3, 
    random.order = F, colors = pal)

