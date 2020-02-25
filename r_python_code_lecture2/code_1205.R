setwd("C:/Rstudy/Part-III")
# 단일 집단 검정
data = read.csv("one_sample.csv", header = TRUE)
head(data)

x = data$time
summary(x)
mean(x, na.rm=T)
x1 = na.omit(x)
summary(x1)

shapiro.test(x1) # 정규성을 따른다는 것이 '귀무가설'
hist(x1)
qqnorm(x1)

t.test(x1, mu=5.2)

t.test(x1, mu=5.2, alter="greater",conf.level = 0.95)

# 두 집단 검정
data2 = read.csv("two_sample.csv", header = TRUE)
head(data2)

x = data2$method
y = data2$survey

table(x)
table(y)
table(x,y,useNA='ifany')

prop.test(c(110,135),c(150,150))

result = subset(data2, !is.na(score), c(method, score)) 
# subset은 행을 추출하는 함수
head(result)

length(result$score)
a = subset(result, method==1)
b = subset(result, method==2)
a1 = a$score
b1 = b$score
length(a1)
length(b1)
mean(a1)
mean(b1)

var.test(a1,b1) # 분산 동질성 검사
t.test(a1,b1,var.equal = T) # 평균 차이 분석

t.test(a1,b1,var.equal = F)

data3 = read.csv("paired_sample.csv", header=TRUE)
head(data3)
summary(data3) # 결측치 확인

result = subset(data3, !is.na(after), c(before,after))
head(result)

x = result$before
y = result$after

mean(x)
mean(y)

var.test(x,y,paired=TRUE)

t.test(x,y,paired=TRUE) # 동질 집단에 대한 t.test


