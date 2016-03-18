## the following function performs the famous leave-one-out cross validation
## algorithm : for each observation : the module itself becomes test set and the rest
## becomes training set
## the sum of all such test set results are the averaged over.
## the algorithm is more useful when data is small in size
validate<-function(dat,av_index){
  ## normally each of the splitting will do certian task (finding feature coefficients)
  ## for example in the case of linear regression
  ## but here I am just print test and training cases
  print ("Training set is : ")
  train_dat=dat[-1*av_index,]
  ## do the respective algorithm
  test_dat=dat[av_index,]
  ## similar plan for test case
    print (train_dat)
  print("Test set is :")
  print(test_dat)
  print("   ")
  print("   ")
}
lv_one_cv<-function(data){
  ## the following is a leave-one-out cross validation
  for(i in 1:nrow(data)){
    validate(data,i)  
  }
}

## for demo : 
## lv_one_cv(mtcars)