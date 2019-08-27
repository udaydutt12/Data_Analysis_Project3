
#__Principal Component Analysis__

```{r}
# Create new data for PCA by removing categorial variables
# We are trying to use 'pnum' rather 'phd' as pnum has 5-categories
pcadat<-rdata[c(1,4,5,8,10)]
head(pcadat)
# Standardize/normalize the data 
pnum<-rdata$pnum
pcadat<-cbind(pcadat,pnum)
pcadat <- scale(pcadat)
head(pcadat)
pca.out=prcomp(pcadat, scale=TRUE)
pca.out
names(pca.out)
# Plot the first two principal components
biplot(pca.out, scale=0)
# Principal component loading vectors (Eigen Vectors)
pca.out$rotation
# Principal component score vectors (principal components)
pca.out$x
# Standard deviation of each principal component
pca.out$sdev
# Variance explained by each principal component
pca.var <- pca.out$sdev ^2
pca.var
# Proportion of variance explained by each principal component
pve=pca.var/sum(pca.var )
pve
# plot the PVE explained by each component, as well
#as the cumulative PVE, as follows
plot(pve , xlab="Principal Component", ylab =" Proportion of Variance Explained ", 
     ylim=c(0,1) ,type='b')
plot(cumsum (pve ), xlab=" Principal Component ", ylab ="
       Cumulative Proportion of Variance Explained ", ylim=c(0,1) ,
       type='b')
summary(pca.out)
```
In order to conduct principal component analysis, we have removed categorical variables in our model and made a new data that consists of continuous variables only. 
The PCA plot confirms that the standard deviation and the variance was the highest for PC1, thus most important. 

