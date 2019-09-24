#Best Subset Selection

library(leaps) #Load package `leaps` to evaluate all best-subset models.
regfit.full=regsubsets( phd~.,data=hdata)
summary(regfit.full) # By default, it gives the top 8 best-subsets;

#let's increase that to 13 predictsors.
regfit.full=regsubsets(phd~.,data=hdata, nvmax=13)
reg.summary=summary(regfit.full)
names(reg.summary)
plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp")
which.min(reg.summary$cp)
points(11,reg.summary$cp[10],pch=20,col="red") # Point out the Minima

#Alternatively, there is a plot method for the `regsubsets`  object
plot(regfit.full,scale="Cp")
coef(regfit.full,11)

# Through the best subset selection, the number of variables with lowest cp value was 11. 
# These 11 variables are: 
# *sex1
# *cp4 
# *trestbps
# *thalach
# exang1
# oldpeak
# slope2
# ca1
# ca2
# ca3
# thal7

