scrape_mv<-function(){
    ##loading documents using readLines from Base 
    mer_text <- readLines("http://www.gutenberg.org/cache/epub/2243/pg2243.txt")
    ## document starts ad :: "The Merchant of Venice"
    ## documents ends as :: "FINIS"
    val_start <- grep("The Merchant of Venice",mer_text)
    ##using grep from Base for complete String or Pattern Matching
    val_end<- grep("FINIS",mer_text)
    
    
    ##take third index of start and last of end : : in case there is repetition
    ##third index is taken for our particular case.
    val_start <- val_start[3]
    val_end <- val_end[length(val_end)]
    
    ##value in val is the point of termination
    mer_text <- mer_text[val_start:val_end]
    
    ##done cleaning
    
    
    mer_text
}