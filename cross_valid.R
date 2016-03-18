## the following function performs the famous leave-one-out cross validation
## algorithm : for each observation : the module itself becomes test set and the rest
## becomes training set
## the sum of all such test set results are the averaged over.
## the algorithm is more useful when data is small in size
validate<-function(dat,av_index){
  print ("Training set is : ")
  train_dat=dat[-1*av_index,]
  test_dat=dat[av_index,]
  print (train_dat)
  print("Test set is :")
  print(test_dat)
  print("   ")
  print("   ")
}
for(i in 1:length(dat$mpg)){
  validate(dat,i)  
}
