# Hierachichal Clustering

clust.dat<-rdata[c(1,4,5,8,10)] # Create new data for KMEAN by removing categorial variables.
clust.dat <- scale(clust.dat) # Standardize/normalize the data 
clust.complete=hclust(dist(clust.dat),method="complete") # Use Complete cluster method
plot(clust.complete)

# Cut off the tree at the desired number of clusters using cutree
clusterCut <- cutree(clust.complete, 3)
table(clusterCut, rdata$thal)

# Cut off the tree at 2 clusters.
clusterCut <- cutree(clust.complete, 2)
table(clusterCut, rdata$phd)

# Can we improve using a different linkage method?
clust.average=hclust(dist(clust.dat),method="average")
plot(clust.average)

# Use cutree to bring it down to 3 clusters
clusterCut <- cutree(clust.average, 3)
table(clusterCut, rdata$thal)

# Use cutree to bring it down to 2 clusters
clusterCut <- cutree(clust.average, 2)
table(clusterCut, rdata$phd)

# Try whether one can improve using a different linkage method
clust.single=hclust(dist(clust.dat),method="single")
plot(clust.single)

# Use cutree to bring it down to 3 clusters
clusterCut <- cutree(clust.single, 3)
table(clusterCut, rdata$thal)

# Use cutree to bring it down to 2 clusters
clusterCut <- cutree(clust.single, 2)
table(clusterCut, rdata$phd)

# In order to see if there are some subgroups in this dataset, we conducted hierarchical 
# clustering using three types of linkages: complete, single, and average. It is 
# difficult to see relationships of variables from dendrograms. Complete linkage seems to have
# the most organized and simple dendrogram, but the confusion matrix shows too many mismatches.
# Even after cutting off the tree down to 2 clusters, it still had mismatches. The average and single 
# linkage had disorganized dendrograms, but they had less mismatches than the complete linkage had. 

