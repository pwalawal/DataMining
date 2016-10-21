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

install.packages("oblique.tree")
library(oblique.tree)



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



"myOblique<-function(train)
{
  
  modelOblique <- oblique.tree(Continent~., data = test ,oblique.splits = 
                                 only)
  
  return(modelOblique)
}
"
"myObliquePredictor<-function(modelOblique)
{
  plot(modelOblique,test)
  tree(modelOblique, test)
  predictions <- predict(modelOblique, test)
  table(predictions)
  summary(predictions)
  text(predictions)
  #confusionMatrix(predictions,test)
  
  
}"

"myObliqueTrain<-function(modelOblique)
{
  predictions <- predict(modelOblique, train)
  summary(predictions)
  # confusionMatrix(predictions,train)
}"



#divideDataset(read.csv("life_expectancy.csv"))      #calling divide datasets

#modelOblique=myOblique(train =train) #training Oblique model
#myObliquePredictor(modelOblique = modelOblique)       #Making prediction on testing data for final table
#myObliqueTrain(modelOblique = modelOblique)        #Performance of Oblique on Training data.Code is commented,please remove comment to run it.
