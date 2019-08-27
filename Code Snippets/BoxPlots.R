#---------------------------------------------------------------
#Box Plots of contineous variables wr.to 'pnum'
ggplot(hdata, aes(x = pnum, y = age, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = pnum, y = trestbps, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = pnum, y = chol, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = pnum, y = thalach, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = pnum, y = oldpeak, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
#------------------------------------------------------------
#Box Plots of contineous variables wr.to 'phd'
ggplot(hdata, aes(x = phd, y = age, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = phd, y = trestbps, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = phd, y = chol, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = phd, y = thalach, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
ggplot(hdata, aes(x = phd, y = oldpeak, fill = sex)) +
  geom_boxplot(outlier.size = 1.5)
```