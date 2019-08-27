
#__Quadratic Discriminant Analysis__

```{r}
## Quadratic Discriminant Analysis
qda.fit=qda(phd~age+ sex+cp+trestbps+chol+fbs+
              restecg+thalach+exang+oldpeak+slope+
              ca+thal, data=hdata, subset=train)
qda.fit
qda.pred=predict(qda.fit,newdata=hdata[-train,])
data.frame(qda.pred)[1:5,]
table(qda.pred$class,test_data)
mean(qda.pred$class==test_data)
# Using ROC Curve for determining 'threshold'
library(ROCR)
pred_roc <- prediction(qda.pred$posterior [ ,2], test_data)
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
#-----------------------------------------------------
```
