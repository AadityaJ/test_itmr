library(NLP)
library(openNLP)
##uses part-of-speech modules of openNLP
##useful link :: http://www.martinschweinberger.de/blog/part-of-speech-tagging-with-r/
##for all of the division

tagPOS <-  function(dat, ...) {
  st <- as.String(dat)
  ##using functions from Apache openNLP
  ##for documentation and working https://opennlp.apache.org/
  word_token_annotator <- Maxent_Word_Token_Annotator()
  
  
  a2 <- Annotation(1L, "sentence", 1L, nchar(st))
  
  a2 <- annotate(st, word_token_annotator, a2)
  
  a3 <- annotate(st, Maxent_POS_Tag_Annotator(), a2)
  ## "word"
  a3w <- a3[a3$type == "word"]
  POStags <- unlist(lapply(a3w$features, `[[`, "POS"))
  
  POStagged <- paste(sprintf("%s/%s", st[a3w], POStags), collapse = " ")
  ##return list
  list(POStagged = POStagged, POStags = POStags)
}

##to test

str <- "this is a the first sentence."
tagged_str <-  tagPOS(str)


## end