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



myC45<-function(train)
{
  
  mode <- J48(Continent~., train)
  return(mode)
}

myC45Predictor<-function(mode)     #shows performance on test data...used for final table
{
  predictions <- predict(mode, test[,1:7])
  confusionMatrix(predictions, test$Continent)
}

myC45Train<-function(mode)          #shows performance on training data...used to show details of classification
{
  predictions <- predict(mode, train[,1:7])
  confusionMatrix(predictions, train$Continent)
}


divideDataset(read.csv("life_expectancy.csv"))                #calling divide datasets
mode=myC45(train =train )         #training C45 model

myC45Predictor(mode = mode)       #Making prediction on testing data for final table
myC45Train(mode = mode)           #Performance of C45 on Training data.Code is commented,please remove comment to run it.
