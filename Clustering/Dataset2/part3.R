install.packages("ggplot2")
library(ggplot2)
install.packages("gdata")
library(gdata)
install.packages("gplots")
library(gplots)
install.packages("class")
library(class)
install.packages("datasets")
library(datasets)
install.packages("Matrix")
library(Matrix)
install.packages("MatrixModels")
library(MatrixModels)
install.packages("cluster")
library(cluster)
install.packages("fpc")
library(fpc)
install.packages("e1071")
library(e1071)
install.packages("scatterplot3d")
library(scatterplot3d)
install.packages("MASS")
library(MASS)


datasetCsv=read.csv("dataset2.csv")
dataset <- datasetCsv[,2:6]
# Excluded the cluster label , as it is only given to check performance of our method


#datasetbind<-rbind(dataset$x, dataset$y, dataset$z, dataset$w, dataset$class)
#largecluster<-cmeans(datasetbind,2,20,verbose=FALSE,dist = "euclidean",method="cmeans")
#Cluster found after binding the 4 dimensions given in dataset


largecluster<-cmeans(dataset,2,20,verbose=FALSE,dist = "euclidean",method="cmeans")
print(largecluster)
print(largecluster$size)
#print(largecluster$cluster)




plot(dataset, col=largecluster$cluster)
#2d plot of cluster.
#scatterplot3d(largecluster$membership,color=largecluster$cluster,angle=60, scale.y=0.75)
#This gives 3d plot of cmeans clustering from scatterplot3d package.


#Detaching packages


detach("package:ggplot2", unload=TRUE)
detach("package:gdata", unload=TRUE)
detach("package:cluster", unload=TRUE)
detach("package:gplots", unload=TRUE)
detach("package:Matrix", unload=TRUE)
detach("package:MatrixModels", unload=TRUE)
detach("package:datasets", unload=TRUE)
detach("package:rgl", unload=TRUE)
detach("package:fpc", unload=TRUE)
detach("package:scatterplot3d", unload=TRUE)
detach("package:cluster", unload=TRUE)















