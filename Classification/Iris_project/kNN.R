# install and load packages
# if not install , select the packages from packages tab in bottom right corner

install.packages("caret")
library(caret)
install.packages("e1071")
library(e1071)
install.packages("klaR")
library(klaR)
install.packages("RWeka")
library(RWeka)
install.packages("class")
library(class)
install.packages("cluster")
library(cluster)
install.packages("ROCR")
library(ROCR)
#reading datasets and dividing into training and testing sets
divideDataset<-function(data)
{
  set.seed(5469)
  data = iris
  dim(data) 
  
  indexes = sample(1:nrow(data), size=0.8*nrow(data))
  
  # Split data into train and test
  train = data[indexes,]
  dim(train) 
  test = data[-indexes,]
  dim(test)
  
  dataset<-list(train,test)
  return(dataset)
}

mykNN<-function(train,test)    #kNN classifier
{
  
  modelkNN <- knn(train=train[,1:4],test=test[,1:4],cl=train[,5],k=3,prob = TRUE)     #k is taken as 3. Can be taken as 4, 5, 6 etc.
  return(modelkNN)
}

mykNNPredictor<-function(modelkNN)
{
  
  confusionMatrix(modelkNN, test$Species)
}


mykNNTrain<-function(train,test)
 {
  
 modelkNNTrain <- knn(train=train[,1:4],test=train[,1:4],cl=train[,5],k=3,prob = TRUE)
   return(modelkNNTrain)
 }

mykNNPredictorTrain<-function(modelkNNTrain)
{
  
  confusionMatrix(modelkNNTrain, train$Species)
  
}



divideDataset(iris)     #calling divide datasets
modelkNN=mykNN(train =train,test =test )        #training kNN model
mykNNPredictor(modelkNN =modelkNN )             #Making prediction on testing data for final table

modelkNNTrain=mykNNTrain(train =train,test =test )        #training kNN model for train dataset.Please remove comments from code to run.
mykNNPredictorTrain(modelkNNTrain =  modelkNNTrain)       #Performance of kNN on Training data.Please remove comments from code to run