setwd("C:/Rstudy/Part-III")
data = read.csv("one_sample.csv", head=TRUE)
head(data)
x = data$survey
summary(as.factor(x))
table(x)
data$survey = as.factor(data$survey)
summary(data)

install.packages("prettyR")
library(prettyR)
freq(x)
# [양측 검정] H0: 만족비율이 80%이다, H1: 만족비율이 80%가 아니다
# [단측 검정(크다, 작다)] H0: 만족비율이 80%이다, H1: 만족비율이 80% 이상이다

binom.test(c(136,14), p=0.8)

binom.test(c(136,14), p=0.8, alternative = "greater", conf.level = 0.95)
binom.test(c(14,136), p=0.2, alternative = "less", conf.level = 0.95)
