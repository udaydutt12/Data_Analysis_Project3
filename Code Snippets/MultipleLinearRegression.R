#__Multiple Linear Regression__

```{r}
#------------------------------------------------------------
# Multipple Linear Regression to Predict 'phd' for absence or presence of heart disease
# Multiple regression model is not justified for 'pnum' which has five levels.
# Thus, MLR is developed for 'phd' having two levels.
#Remove 'pnum' variable as the responce variable 'phd' has been created from it
hdata$pnum<-NULL
# make 'phd' response variable as a non-categorical variable for running regression
hdata$phd<-NULL
phd<-rdata$phd
hdata<-data.frame(hdata,phd)
mlr.fit <- lm(phd~age+sex+cp+trestbps+chol+fbs+
            restecg+thalach+exang+oldpeak+slope+ca+
            +thal, data=hdata)
summary(mlr.fit) # show results
summary(fitted(mlr.fit)) # predicted values
# Looking at the summary of predicted values,it contains values less than
# zero and higher than 1 wheraes as the predictor 'phd' values ranges from 0 to 1 only.
# Thus, for this problem use of classification model is more appropriate.
summary(residuals(mlr.fit)) # residuals
anova(mlr.fit) # anova table 
vcov(mlr.fit) # covariance matrix for model parameters 
#influence(mlr.fit) # regression diagnostics
# diagnostic plots 
plot(mlr.fit)
#-------------------------------------------------------
# It can be noticed several predictors were having poor t-values, indcating
# this model can be improved by selecting more appropriate variables.
```
The summary of linear regression explains that there are few significant predictive variables that are useful. However, R squared value explains only 50% of variations in this model.  Also the summary of predicted values indicates that there are values less than zero and greater than one, which reveals that it is not a good model since phd variables only contain values from zero to one. 

For residual analysis, we plotted fitted values versus residuals of the model. As we expected, the residual plot explains that this is a poor method of predicting responsive variables. A residual plot of a good model indicates a random and dispersed patterns of dots; however, our graph shows some patterns, which explain that some of the variables have poor t values. Thus, other models such as classification is more appropriate for this data. 

