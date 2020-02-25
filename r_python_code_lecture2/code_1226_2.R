prob = read.csv("problem.csv", header=T, stringsAsFactors=F)
head(prob)

# 지역해결정방지 - 방법1
for(i in 1:30) {
  # 0에서 1사이의 값으로 전환
  prob[i] = prob[i] * (1/5)
}
head(prob)

# 정규화 - 방법2
normalize = function(x){
  return((x-min(x))/diff(range(x)))
}

# sigmoid - 방법3 (0.0 ~ 1.0 확률을 리턴하므로 정규화에도 사용가능하다)
sigmoid = function(x){
  return(1/(1+exp(-x)))
}

# 사고를 친 병사는 "1", 아닌 병사는 "0"으로 대체
prob$accident2 = with(prob, ifelse(accident=="suicide" | accident=="violence",1,0))
head(prob)

library(nnet)
prob = prob[-31]
m1 = nnet(accident2~., data=prob, size=10)
r1 = predict(m1, prob)
head(r1)

cbind(prob$accident2, r1>0.5)
sum(as.numeric(r1>0.5) != prob$accident2)

# 같은 방법 다른 패키지
install.packages("neuralnet")
library(neuralnet)
xnam = paste0("ans", 1:30)
fmla = as.formula(paste("accident2~", paste(xnam, collapse="+")))
m2 = neuralnet(fmla, data=prob, hidden=10)
plot(m2)
