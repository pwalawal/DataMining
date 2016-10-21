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
  
  #dataset<-list(train,test)
  cell_data <-c('train','test') 
  dataset <- factor(cell_data) 
  
  return(dataset)
}

mykNN<-function(train,test)    #kNN classifier
{
  
  modelkNN <- IBk(Continent~.,train,control = Weka_control(K = 20, X = TRUE))     #k is taken as 3. Can be taken as 4, 5, 6 etc.

  return(modelkNN)
}

mykNNPredictor<-function(modelkNN)       #shows performance on test data...used for final table
{
  kNNpred<-predict(modelkNN,test)
  summary(kNNpred)
  
  confusionMatrix(kNNpred,test$Continent)
  
}




mykNNPredictorTrain<-function(modelkNNTrain)    #shows performance on training data...used to show details of classification
{
  
  kNNpred<-predict(modelkNN,train)
  summary(kNNpred)
  
  confusionMatrix(kNNpred,train$Continent)
  
}



divideDataset(read.csv("life_expectancy.csv"))     #calling divide datasets
modelkNN=mykNN(train =train,test =test )        #training kNN model
mykNNPredictor(modelkNN =modelkNN )             #Making prediction on testing data for final table
 mykNNPredictorTrain(modelkNNTrain =  modelkNNTrain)       #Performance of kNN on Training data.Please remove comments from code to run