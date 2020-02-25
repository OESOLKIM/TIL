install.packages("kernlab") # 가우시안 커널을 기본으로 사용한다
library(kernlab)

m = ksvm(Species~., data=iris)
m

head(predict(m, newdata=iris))

library(e1071) # tune() 함수를 담고 있음
# 그리드 탐색을 사용한 파라미터 튜닝을 실행한다
# 그리드 탐색: 인자로 주어진 모든 가능한 경우에 대해 테스트해보는 방식
tune.svm(Species~., data=iris, gamma=2^(-1:1), cost=2^(2:4))
