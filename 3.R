##finding out all the verbs as VB
##uses inbuilt stringr library
##no use of sneaky one line functions . Making the code as readable as posssible 
##verb is VB source :: http://www.martinschweinberger.de/blog/part-of-speech-tagging-with-r/
library(stringr)
print_verb<-function(txtTag){
  ##word(strsplit(txtTag$POStagged,"/VB")[[1]][6],-1)
  
  list<-word(strsplit(txtTag$POStagged,"/VB")[[1]],-1)
  ##list has the set of verbs now
  ##last word is vestigal . Removing it
  list[1:(length(list)-1)]
}
