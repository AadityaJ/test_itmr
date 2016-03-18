## the following function performs the famous k cross validation
## algorithm : for each observation : the k modules itself becomes test set and the rest
## becomes training set
## the sum of all such test set results are the averaged over.
## the algorithm is more useful when data is small in size
k_validate<-function(dat,av_index,k){
  ## normally each of the splitting will do certian task (finding feature coefficients)
  ## for example in the case of linear regression
  ## but here I am just print test and training cases
  print ("Training set is : ")
  train_dat=dat[-(1*av_index):(-1*(av_index+k)),]
  ## do the respective algorithm
  test_dat=dat[av_index:(av_index+k-1),]
  ## similar plan for test case
  ## for k-cross validation k has to be divisible by total length
  ## else na's have to be removed 
  test_dat=na.omit(test_dat)
  print (train_dat)
  print("Test set is :")
  print(test_dat)
  print("   ")
  print("   ")
}
k_cv<-function(data,k=10){
  ## the following is a leave-one-out cross validation
  i<-0
  while(i <= nrow(data)){
    k_validate(data,i,k)  
    i<-i+k+1
  }
}

## to run k_cv(mtcars,10)