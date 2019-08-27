#Load the required library
library(cvTools)
library(MASS)
library(car)
library(leaps)
library(ggplot2)

load('originaldata.RData')

# Read data in comma-delimited file
#setwd(work_dir) 
#rdata <- read.csv(srcFile, header=T)
# Remove rows having missing values
#rdata<-na.omit(rdata)
#nrow(rdata)
# Creating a new responce variable for presence of heart disease (phd) 
# phd = 0 for absence and phd = 1 for presence 
#phd<-ifelse(rdata$pnum>=1,1,0)
#rdata<-data.frame(rdata,phd)
#Save the data into a new dataframe "hdata'
hdata<-rdata
# Define categorical data
hdata$pnum<-factor(hdata$pnum)
hdata$sex<-factor(hdata$sex)
hdata$cp<-factor(hdata$cp)
hdata$fbs<-factor(hdata$fbs)
hdata$restecg<-factor(hdata$restecg)
hdata$exang<-factor(hdata$exang)
hdata$slope<-factor(hdata$slope)
hdata$ca<-factor(hdata$ca)
hdata$thal<-factor(hdata$thal)
hdata$phd<-factor(hdata$phd)


#__Original Dataset__
```{r}
str(rdata)
dim(rdata)
head(hdata)
```

#__New Dataset__
```{r}
str(hdata)
dim(hdata)
head(hdata)
```