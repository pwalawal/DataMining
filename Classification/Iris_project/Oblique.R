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

install.packages("oblique.tree")
library(oblique.tree)
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


myOblique<-function(train)
{
  
  modelOblique <- oblique.tree(Species~., data = train ,oblique.splits = 
                                 "on")
  summary(modelOblique)
  textplot(modelOblique)
  text(modelOblique)
  return(modelOblique)
}

myObliquePredictor<-function(modelOblique)
{
  
  predictionsOblique <- predict(modelOblique, test)
  summary(predictionsOblique)
  #confusionMatrix(predictionsOblique,test[,5])
  
  
}

myObliqueTrain<-function(modelOblique)
{
  predictions <- predict(modelOblique, train)
  summary(predictions)
  
#confusionMatrix(predictions,train)
}

  
  divideDataset(iris)      #calling divide datasets
  
  modelOblique=myOblique(train =train) #training Oblique model
  myObliquePredictor(modelOblique = modelOblique)       #Making prediction on testing data for final table
  myObliqueTrain(modelOblique = modelOblique)           #Performance of Oblique on Training data.Code is commented,please remove comment to run it.
  