library(psych)
#read data file from the remote directory
d<-read.csv('https://github.com/ozt-ca/tjo.hatenablog.samples/raw/master/r_samples/public_lib/DM_sampledata/ch5_3.txt',header=T,sep=' ')
## check data description for various atributes
summary(d)
#draw the plot to checkc if any trend or paatternr is present in the data
plot(d)
#check for the correlation
cor(d)
#use kmean clusteringmethod tocreate clusters
d.km<-kmeans(d,centers=3)
d1<-cbind(d,d.km$cluster)
names(d1)[6]<-'cluster'
res<-with(d1,aggregate(d1[,-6],list(cluster=cluster),mean)) # Summarizing a result of clustering
res
#draw the results of clustering using a histogram
hist(res)
barplot(as.matrix(res[order(res$books),-6]),col=rainbow(5))
