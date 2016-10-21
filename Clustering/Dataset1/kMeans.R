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
install.packages("rgl")
library(rgl)
install.packages("scatterplot3d")
library(scatterplot3d)
install.packages("graphics")
library(graphics)


datasetCsv=read.csv("dataset1.csv")
dataset <- datasetCsv[,1:3]
# Excluded the cluster label , as it is only given to check performance of our method



# K-Means Cluster Analysis
kMeansCluster <- kmeans(dataset, 8) 
# Cluster are 8 as given in dataset

# append cluster assignment
newdataset <- data.frame(dataset, kMeansCluster$cluster)

plot(newdataset, col = kMeansCluster$cluster)
#displaying clusters of graph
clusplot(newdataset, kMeansCluster$cluster, color=TRUE, shade=TRUE, lines=0)
#This gives 2d plot of k means clustering


scatterplot3d(datasetCsv, color=datasetCsv$cluster)
#This gives 3d plot of of original dataset with given cluster label from scatterplot3d package.
scatterplot3d(newdataset,color=kMeansCluster$cluster)
#This gives 3d plot of average hierarchail clustering from scatterplot3d package.


#Detaching packages


detach("package:ggplot2", unload=TRUE)
detach("package:graphics", unload=TRUE)
detach("package:cluster", unload=TRUE)
detach("package:gplots", unload=TRUE)
detach("package:Matrix", unload=TRUE)
detach("package:MatrixModels", unload=TRUE)
detach("package:datasets", unload=TRUE)
detach("package:rgl", unload=TRUE)
detach("package:fpc", unload=TRUE)
detach("package:scatterplot3d", unload=TRUE)
detach("package:cluster", unload=TRUE)















