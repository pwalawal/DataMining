# install and load packages


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

#reading datasets and dividing into training and testing sets
divideDataset<-function(data("iris"))
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

myNaiveBayes(train)
{
model <- naiveBayes(train[,1:4], train[,5])

return(model)
}

myNaiveBayesPredictor(model)
{
predictions <- predict(model, test[,1:4])
confusionMatrix(predictions, test$Species)
}

