##division of data into test and training data on a random basis
##as given on the idea page dataset division is to be performed as
##a part of the Supervised lda model.
##I could have used createDataPartition function in the caret package
##for a more complete approach but that would increase the requiremnets 
##of the package itself.
#####################################################################
data_split<-function(data,split.val=0.75,seed=12){
  #data is asked from the user which is split
  #split ratio covers how much of data will be training(the rest is test)
  #i've seen that by default its best to provide a moderately larger training
  #then test
  #default split ratio is 3:1 i.e training is 0.75 of data and test is 0.25
  #also by default seed is set to 12 and also can be changed
  #if split.val given by user is 1 or exceeds that value throw an error
  try(if(split.val>=1 || split.val<=0)stop("Split value provided should be between 0 and 1"));
  
  ##check and set the sample size of the data
  sample_size <- floor(split.val*nrow(mtcars))
  
  
  #set seed to produce the same output
  set.seed(seed)
  
  ##generate random index for training set
  train_ind <- sample(seq_len(nrow(data)), size = sample_size)
  #store it as train
  train <- data[train_ind, ]
  #store the rest as test
  test <- data[-train_ind, ]
  #since R doesnt allow mutiple return parameters
  
  new_list<-list("train"=train,"test"=test)
  
  #return this list now
  
  new_list
  
  
  
}

##to run this 
#data(mtcars)
#mt_spit<-data_split(mtcars,split.val=0.70,seed=0)
#mt_split
#now to work on the independently 
#View(mt_split$train)
#View(mt_split$test)