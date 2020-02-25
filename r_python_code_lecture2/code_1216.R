# 1
m = lm(dist~speed, data=cars)
summary(m)

par(mfrow=c(2,2), mar=c(3,3,3,3))
plot(m)

install.packages("lmtest")
library(lmtest)
dwtest(m) # 더빈-왓슨 test / d=2(p=0:상관 관계 없음), 보통 d=1~3 정상

# 2 로지스틱 회귀 분석
data(iris)
d = subset(iris, Species=='virginica' | Species=='versicolor')
str(d)
m = glm(Species~., data=d, family='binomial')
summary(m)
m
fitted(m)[c(1:5, 51:55)] #  versicolor 5개 / virginica 5개
as.numeric(d$Species)

f = fitted(m) # 0~1 (실패확률 대비 성공확률)
# P(Y=1): 
fm = ifelse(f>.5, 1, 0)
head(fm)

# versicolor=2, virginica=3으로 레이블 된 상태에서,
# versicolor=0, virginica=1로 만들어 주는 과정
is_correct = (ifelse(f>.5, 1, 0) == (as.numeric(d$Species)-2))
head(is_correct)
sum(is_correct) # 98% 확률로 정확하다는 의미
