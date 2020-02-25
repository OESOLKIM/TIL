# 1
setwd("C:/Rstudy/MLData")
drink = read.csv("drink.csv", header=T)
str(drink)
View(drink)
library(class)
m = glm(지각여부 ~ 나이+결혼여부+자녀여부+체력+주량+직급+성별, family=binomial(link="logit"), data=drink) 
m
summary(m)

# 오즈비 해석
predict(m, drink, type="response") >= 0.5
table(drink$지각여부, predict(m, drink, type="response") >= 0.5)

# 2
install.packages("aod")
library(aod)
library(ggplot2)
# view the first few rows of the data
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata) 
# 데이터의 대략적인 분포 확인
summary(mydata) 
# 데이터 구조 확인
str(mydata) 
# 변수별 표준편차 확인
sapply(mydata, sd)
# contingency table : xtabs(~ x + y, data) [교차 도수분포표]
xtabs(~admit+rank, data=mydata)

mydata$rank <- factor(mydata$rank)
# rank는 factor형이어야만 제대로 된 의미를 갖기 때문에 바꿔줌

mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family =
                   "binomial")
summary(mylogit)
exp(coef(mylogit))

# 3
install.packages("foreign")
install.packages("nnet")
library(foreign)
library(nnet)
library(ggplot2)
library(reshape2)

ml <- read.dta("https://stats.idre.ucla.edu/stat/data/hsbdemo.dta")

