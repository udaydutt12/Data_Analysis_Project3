
#__Logistic Regression__
```{r}
# Classification models [Logistic, LDA,QDA, KNN]
hdata$phd<-factor(hdata$phd)
# Logistic regression
glm.fit=glm(phd~age+ sex+cp+trestbps+chol+fbs+
              restecg+thalach+exang+oldpeak+slope+
              ca+thal, data=hdata,family=binomial)
summary(glm.fit)
glm.probs=predict(glm.fit,type="response") 
glm.probs[1:5]
summary(glm.probs)
# Use a threshold probability value of 0.5 to convert logistic regression
# predictions into the categorical output
threshold <-0.5
glm.pred=ifelse(glm.probs>threshold,1,0)
#attach(hdata)
table(glm.pred,phd)
mean(glm.pred==phd)
# So far we used the complete dataset. Now, make training and test data sets
set.seed(1099)
train=sample(seq(297),212,replace=FALSE)#about 70% data was selected as training data
length(train)

glm.fit=glm(phd~age+ sex+cp+trestbps+chol+fbs+
              restecg+thalach+exang+oldpeak+slope+
              ca+thal, data=hdata,family=binomial)
glm.probs=predict(glm.fit,newdata=hdata[-train,],type="response") 
glm.pred=ifelse(glm.probs >threshold,1,0)
test_data=hdata$phd[-train]
table(glm.pred,test_data)
mean(glm.pred==test_data)
# Using ROC Curve for determining 'threshold'
library(ROCR)
pred_roc <- prediction(glm.probs, test_data)
perf <- performance(pred_roc,"tpr","fpr")
plot(perf)
plot(perf,colorize=TRUE)
perf_spec <- performance(pred_roc, "sens", "spec")
plot(perf_spec)
# Listing threshold cutoff values alongwith fpr and tpr
cutoffs <- data.frame(cut=perf@alpha.values[[1]], fpr=perf@x.values[[1]],                       tpr=perf@y.values[[1]])
cutoffs <- cutoffs[order(cutoffs$tpr, decreasing=TRUE),]
#head(subset(cutoffs, fpr < 0.2))
# Calculating best threshold
best_threshold <- function(predict, response) {
  perf <- ROCR::performance(ROCR::prediction(predict, response), "sens", "spec")
  df <- data.frame(cut = perf@alpha.values[[1]], sens = perf@x.values[[1]], spec = perf@y.values[[1]])
  df[which.max(df$sens + df$spec), "cut"]}
predict<-pred_roc@predictions[[1]]
response<-pred_roc@labels[[1]]
best_cutoff<-best_threshold(predict, response)
# False Positive Rate (fpr) and True Positive Rate(tpr) corresponding to best Cutoff
subset(cutoffs, cut == best_cutoff)
```

Logistic regression performed to predict over phd variable had prediction efficiency of about 86% over total dataset.  From the training data set using about 70% of the total dataset, prediction efficiency was about 81%.  Then ROC curve over the logistic regression indicates true positive rate of about 85%.
