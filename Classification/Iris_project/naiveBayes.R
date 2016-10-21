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
  data = data
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

myNaiveBayes<-function(train)
{
model <- naiveBayes(train[,1:4], train[,5])

return(model)
}

myNaiveBayesPredictor<-function(model)
{
predictions <- predict(model, test[,1:4])
confusionMatrix(predictions, test$Species)
}

myNaiveBayesPredictorTrain<-function(model)
{
  predictions <- predict(model, train[,1:4])
 confusionMatrix(predictions, train$Species)
}


divideDataset(iris)     #calling divide datasets
model=myNaiveBayes(train =train )         #training naiveBayes model
myNaiveBayesPredictor(model = model)       #Making prediction on testing data for final table
 myNaiveBayesPredictorTrain(model = model)  #Performance of naiveBayes on Training data