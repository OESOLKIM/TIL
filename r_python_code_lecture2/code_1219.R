# 1 

library(party)
str(airquality)
summary(airquality)

# ctree: 조건부 추론 나무 (conditional tree)
air_ctree = ctree(Temp ~ Solar.R + Wind + Ozone, data=airquality)
air_ctree
plot(air_ctree)

# 2

install.packages("randomForest")
library(randomForest)
rf = randomForest(Species ~ ., data=iris)
rf
# 변수의 중요도 평가
rf3 = randomForest(Species~., data=iris, importance=TRUE)
importance(rf3)

# 파라미터 튜닝
# ntree를 10,100,200으로 mtry를 3,4로 바꿔가면서 조합한 예
grid = expand.grid(ntree=c(10,100,200),mtry=c(3,4))
grid
