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


myC45<-function(train)
{
  
   mode <- J48(Species~., train)
   return(mode)
}

myC45Predictor<-function(mode)
{
  predictions <- predict(mode, test[,1:4])
  confusionMatrix(predictions, test$Species)
}

myC45Train<-function(mode)
{
  predictions <- predict(mode, train[,1:4])
  confusionMatrix(predictions, train$Species)
}


divideDataset(iris)               #calling divide datasets
mode=myC45(train =train )         #training C45 model

myC45Predictor(mode = mode)       #Making prediction on testing data for final table
myC45Train(mode = mode)           #Performance of C45 on Training data.Code is commented,please remove comment to run it.
