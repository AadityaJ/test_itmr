# a list of functions used for scrapping of some of the text to be 
# given to user as dataset along with the package
holmes<-function(){

  # the first dataset is "THE ADVENTURES OF SHERLOCK HOLMES"
  # link is http://www.gutenberg.org/cache/epub/1661/pg1661.txt 
  holmes_text<-readLines("http://www.gutenberg.org/cache/epub/1661/pg1661.txt")
  #cutting and saving of data performed as previous
  val_start<-grep("THE ADVENTURES OF SHERLOCK HOLMES",holmes_text)
  #text start at second value
  val_start<-val_start[2]
  
  
  val_end<- grep("End of the Project",holmes_text)
  #found the start and end of text
  
  #now divide into proper text
  
  scanned_text <- holmes_text[val_start:(val_end-1)]
  
  #store it in a data frame
  Holmes<-data.frame(scanned_text)
  #save the data frame
  
  #data frame of text inserted will be stored in the package as "Holmes"
  save(Holmes,file="Holmes_data.Rda")
  
}

# to load the data : use 
# > load("Holmes_data.Rda")

##similar logic for another data frame :: 
wells<-function(){
  #the second database is "The country of blind and other short stories" by HG Wells
  
  wells_text<-readLines("http://www.gutenberg.org/cache/epub/11870/pg11870.txt")
  
  val_start<-grep("THE COUNTRY OF THE BLIND",wells)
  #text starts at 2nd value
  val_start<-val_start[2]
  
  val_end<-grep("END OF THE PROJECT GUTENBERG",wells)
  
  scanned_text <- wells_text[val_start:(val_end-1)]
  
  Wells<-data.frame(scanned_text)
  
  save(Wells,file="Wells_data.Rda")
}
# to load the data : use 
# > load("Wells_data.Rda")