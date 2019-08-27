#__Best Subset Selection__
```{r}
#Best Subset Regression
#Load package `leaps` to evaluate all best-subset models.
library(leaps)
regfit.full=regsubsets( phd~.,data=hdata)
summary(regfit.full)
#It gives by default best-subsets up to size 8; 
#lets increase that to 13 predictsors.
regfit.full=regsubsets(phd~.,data=hdata, nvmax=13)
reg.summary=summary(regfit.full)
names(reg.summary)
plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp")
which.min(reg.summary$cp)
points(11,reg.summary$cp[10],pch=20,col="red")#Point out the Minima
#Alternatively there is a plot method for the `regsubsets`  object
plot(regfit.full,scale="Cp")
coef(regfit.full,11)
```

Best Subset Selection, Forward stepwise selection, Backward stepwise selection
Through the best subset selection, the number of variables with lowest cp value was 11, which were sex1, cp4, trestbps, thalach, exang1, oldpeak, slope2, ca1, ca2, ca3, and thal7. 

