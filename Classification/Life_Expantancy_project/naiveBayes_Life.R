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

#reading datasets and dividing into training and testing sets
divideDataset<-function(data)
{
  set.seed(5469)
  data = read.csv("life_expectancy.csv")
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
  model <- naiveBayes(train[,1:7], train[,8])
  
  return(model)
}

myNaiveBayesPredictor<-function(model)  #shows performance on test data...used for final table
{
  predictions <- predict(model, test[,1:7])
  confusionMatrix(predictions, test$Continent)
}

myNaiveBayesPredictorTrain<-function(model)  #shows performance on training data...used to show details of classification
{
  predictions <- predict(model, train[,1:7])
  confusionMatrix(predictions, train$Continent)
}

  
  divideDataset(read.csv("life_expectancy.csv"))     #calling divide datasets
  model=myNaiveBayes(train =train )         #training naiveBayes model
  myNaiveBayesPredictor(model = model)       #Making prediction on testing data for final table
  myNaiveBayesPredictorTrain(model = model)  #Performance of naiveBayes on Training data