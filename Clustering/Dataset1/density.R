install.packages("ggplot2")
library(ggplot2)
install.packages("gdata")
library(gdata)
install.packages("gplots")
library(gplots)
install.packages("cluster")
library(cluster)
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
install.packages("rgl")
library(rgl)
install.packages("scatterplot3d")
library(scatterplot3d)
install.packages("dbscan")
library(dbscan)


datasetCsv=read.csv("dataset1.csv")
dataset <- datasetCsv[,1:3]
# Excluded the cluster label , as it is only given to check performance of our method

distanceMatrix <- dist(dataset, method = "euclidean") 
densitycluster<-dbscan(distanceMatrix, eps=1 , MinPts = 3,method = "dist", showplot = 1)
# print(densitycluster) gives summary information  about dbscan

newdataset <- data.frame(dataset, densitycluster$cluster)
# Appending Clusters to dataset to get clear plots of cluster

plot(newdataset, col = densitycluster$cluster)
#displaying clusters of graph
clusplot(newdataset, densitycluster$cluster, color=TRUE, shade=TRUE, lines=0)
#This gives 2d plot of dbscan clustering

scatterplot3d(datasetCsv, color=datasetCsv$cluster)
#This gives 3d plot of of original dataset with given cluster label from scatterplot3d package.
scatterplot3d(newdataset,color=densitycluster$cluster)
#This gives 3d plot of dbscan clustering from scatterplot3d package.


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
detach("package:spa", unload=TRUE)
detach("package:dbscan", unload=TRUE)
