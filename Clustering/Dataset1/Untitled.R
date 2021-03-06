install.packages("ggplot2")
library(ggplot2)
install.packages("gdata")
library(gdata)
install.packages("gplots")
library(gplots)
install.packages("ROCR")
library(ROCR)
install.packages("caret")
library(caret)
install.packages("class")
library(class)
install.packages("cluster")
library(cluster)
install.packages("datasets")
library(datasets)
install.packages("e1071")
library(e1071)
install.packages("klaR")
library(klaR)
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



datasetCsv=read.csv("dataset1.csv")
dataset <- datasetCsv[,1:3]
# Excluded the cluster label , as it is only given to check performance of our method


# Average Heirarchial Clustering for distance based clustering
distanceMatrix <- dist(dataset, method = "euclidean") 
# calculating distance matrix for distance based clustering
distanceCluster <- hclust(distanceMatrix, method="average") 

plot(distanceCluster) 
# display dendogram for centroid heirarchial clustering


rect.hclust(distanceCluster, k=8, border="blue")
# display dendogram for centroid heirarchial clustering with respect to 8 cluster



hcluster <- cutree(distanceCluster, k=8) 
# 8 clusters as given in data

plot3d(dataset$x,dataset$y,dataset$z, col=hcluster, main="dataset cluster")
#This gives 3d plot of cluster from rgl package

scatterplot3d(datasetCsv, color=datasetCsv$cluster)
#This gives 3d plot of of original dataset with given cluster label from scatterplot3d package.
scatterplot3d(dataset,color=hcluster)
#This gives 3d plot of average hierarchail clustering from scatterplot3d package.


#Detaching packages
detach("package:e1071", unload=TRUE)
detach("package:caret", unload=TRUE)
detach("package:ggplot2", unload=TRUE)
detach("package:gdata", unload=TRUE)
detach("package:klaR", unload=TRUE)
detach("package:class", unload=TRUE)
detach("package:cluster", unload=TRUE)
detach("package:ROCR", unload=TRUE)
detach("package:gplots", unload=TRUE)
detach("package:Matrix", unload=TRUE)
detach("package:MatrixModels", unload=TRUE)
detach("package:datasets", unload=TRUE)
detach("package:rgl", unload=TRUE)
detach("package:fpc", unload=TRUE)
detach("package:scatterplot3d", unload=TRUE)
detach("package:cluster", unload=TRUE)















