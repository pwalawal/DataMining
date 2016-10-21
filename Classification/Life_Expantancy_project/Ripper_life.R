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



myRipper<-function(train)
{
  
  modelJRip <- JRip(Continent~., train)
  return(modelJRip)
}

myRipperPredictor<-function(modelJRip)        #shows performance on test data...used for final table
{
  predictions <- predict(modelJRip, test[,1:7])
  confusionMatrix(predictions, test$Continent)
}

myRipperTrain<-function(modelJRip)            #shows performance on training data...used to show details of classification
{
  predictions <- predict(modelJRip, train[,1:7])
  confusionMatrix(predictions, train$Continent)
}


divideDataset(read.csv("life_expectancy.csv"))               #calling divide datasets
modelJRip=myRipper(train =train )              #training Ripper model
myRipperPredictor(modelJRip = modelJRip)       #Making prediction on testing data for final table
myRipperTrain(modelJRip = modelJRip)           #Performance of Ripper on Training data.Code is commented,please remove comment to run it.
