# 첫 프로그래밍
2 + 3
"Hello World"
X <- 3
X * X


# R의 연산
3 + 2
X + 2
X %% 2 == 0 & X %% 3 == 0
X > 2
X == 3

# R 데이터 타입연습

A <- 3
A <- 4.5
A <- "안녕"
A <- c(1,2,3)
A <- c("사과","바나나","배")
A <- matrix(c(1,2,3,4), nrow=2)
A <- data.frame(숫자=c(1,2,3),과일= c("사과","바나나","배"))

# 벡터 생성

A <- c(1,2,3,4,5)
A <- 1:5
A <- seq(1,5,2)
A <- rep(5,5)

# 벡터 원소 추출
A <- 1:10 
A[3]
A[1:3] 
A[5:10]
A[1:2]
A[-1]
A[-(1:3)]

# 벡터 값 기반 추출
A <- c(1,3,5,3,2,5,3)
A == 3
A[A==3]
A[A>3]
A %in% c(3,5)
A[A %in% c(3,5)]

# 행렬 생성
V <- c(1,2,3,4)
A <- matrix(V, nrow=2, byrow=2)

# 1~25사이 숫자 생성 및 5*5 행렬 생성
V <- 1:25
A <- matrix(V, nrow=5) # matrix(데이터(벡터), 행,열)
A[3,3] 
A[1:3,4:5] 
A[,4:5]
A[-1,]  
A[,-(2:3)]

A <- data.frame(숫자=c(1,2,3),과일= c("사과","바나나","배"))
A[1:2,1:2] # 1~2행, 1~2열
A[1:3,] # 1~3행 추출
A[-1,] # 1행 제외 추출
A[,-c(2,3)] #2~3열 제외 추출
A$과일 
A[,'과일'] # 과일열 추출
A$과일[2]

# List
L <- list(x = 1:3, y = c("A","B","C"))
L$x
L[1]
L[[1]]
L[[1]] <- 1:5

# factor

A <- c("바나나","사과","오렌지")
A[3] <- "Hello"
A[3] <- "오렌지"

A <- data.frame(숫자=c(1,2,3),과일= c("사과","바나나","배"))
A <- data.frame(숫자=c(1,2,3),과일= c("사과","바나나","배"),stringsAsFactors=FALSE)

# 대입 연산자

A <- 1:10
A[1] <- 4
A[1:3] <- 4 # Broadcasting
A[1:3] <- 3:5

A <- matrix(1:8,nrow=2)
A[,2] <- c(4,1)
A[1:2,1:2] <- 2
A[1:2,1:2] <- matrix(c(1,2,3,4),nrow=2)

X <- 7
if(X>0){
  cat("양수")
} else if(X==0){
  cat("0")
} else{
  cat("음수")
}

# 성적판단 (80이하 미)
X <- as.integer(readline("Input : "))

if(X> 90){
  cat("수")
} else if(X>80){
  cat("우")
} else{
  cat("미")
}

# For문
fruits <- c('사과','배','귤','참외','자두')
for(fruit in fruits){
  print(fruit)
}

# 1~100까지의 합

sum <- 0
for(i in 1:100)
{
   sum <- sum + i
}
print(sum)


for(i in 1:9){
  for(j in 1:9){
    #print(paste(i, "*", j, "=", i*j,sep=""))
    cat(i, "*", j, "=", i*j,"\n",sep="")
  }
}


# 1~10 까지 출력
i <- 1
sum <- 0
while (i <= 100){
  sum <- sum + i 
  i <- i + 1
}
print(sum)


# 구구단 (while)

i <- 1
while (i <= 9){
  j <- 1
  while (j <= 9){
    cat(i, "*", j, "=", i*j,"\n",sep="")
    j <- j + 1
  }
  i <- i + 1
}

# break

for(i in 1:10){
  if(i %% 2 == 0){
    break
  }
  print(i)
}

# next
for(i in 1:10){
  if(i %% 2 == 0)
    next  
  print(i)
}

# "exit”가 입력될 때 까지 무한 루프를 수행하는 코드
while(1)
{
  input <- readline("Input : ")
  if(input == "exit")
    break
}

sum <- 0 
N <- 1
while(1)
{
  sum <- sum + N
  if(sum > 150)
    break
  N <- N + 1
}
print(N)

#(1+16)*8+17

# 1~9 세 제곱합 출력

sum <- 0
for(i in 1:9){
#sum <- sum + (i*i*i)
 sum <- sum + (i^3)
}

# 2개의 값을 입력 받아 평균을 내는 함수

ave_two <- function(n1,n2)
{
  return (n1 + n2)
}

# 2개의 값을 입력 받아 큰 수 출력하는 함수 구현

max_two <- function(n1,n2)
{
  if(n1 > n2){
    return (n1)
  }
  else{
    return (n2)
  }
}

max_two(3,5)

# 2개의 값을 입력 받아 그 사이에 해당하는 값을 더해주는 함수 구현

sum_bw <- function(n1,n2)
{
  sum <- 0
  for(i in n1:n2){
    sum <- sum + i
  }
  return (sum)
}

sum_bw(2,5)

# 3개의 값을 입력 받아 1번째 수 + 2번째 수 – 3번째 수를 수행하는 함수 구현


calc_three_num <- function(n1,n2,n3)
{
  return (n1 + n2 - n3)
}

calc_three_num(2,3,2)

# 그외 주요 내용

v <- c(1,2,3)
names(v) <- c("바나나","사과","귤")
v["바나나"]

# colnames/rownames
m <- matrix(c(1,2,3,4),nrow=2)
colnames(m) <- c("A","B")
m[,"A"]
rownames(m) <- c("C","D")
m["C",]
m["C","A"]

# NULL/NA (NA는 NULL포함)
v <- c(1,2,3,4,NA,5,NA)
v[!is.na(v)]
v <- c(1,2,3,4,NULL,5,NULL)
v[!is.null(v)]

# which
v <- c(5,2,1,4,5)
v == 1
which(v == 1)

# paste 

paste("apple", "banana", "orange",sep=" ")

# sort 
v <- c(4,3,5,1,2)
sort(v)
sort(v,decreasing = TRUE)

# order
v <- c(4,3,5,1,2)
order(v)
v[order(v)]

# R 통계량 연습문제
score <- c(90,95,80,70,70)
names(score) <- c("kor","math","hist","ps","music")
mean(score)
median(score)
sd(score)
names(score)[score == max(score)]

# apply 함수 실습

a <- matrix(1:12,nrow=3)
apply(a,1,max)
rowSums(a)
apply(a,2,max)
colSums(a)

# R통계량 연습문제 (행렬)

#m <- matrix(1:25,nrow=5,byrow=T)
m <- matrix(1:25,nrow=5,byrow=T)
apply(m,1,sum)
apply(m,2,sum)
apply(m,2,mean)
apply(m,2,mean)
apply(m,2,max)
apply(m,2,max)



# R시각화

x <- c(1,2,3,4,5)
y <- c(1,4,3,5,9)
plot(x,y)
plot(x,y,main="title")
plot(x,y,font=3, main="title")
plot(x,y,font.main=3, main="title")
plot(x,y,xlim=c(1,5),main="title")
plot(x,y,font.main=3,xlim=c(1,5),main="title",ann=FALSE)

# Scatter
x <- c(1,2,3,4,5)
y <- c(1,4,3,5,9)
plot(x,y,xlab="")

title(main="title")
title(xlab="num")
text(3,3,"Hello")

# Histogram

A <- round(runif(100, min = 0,max = 100),0)
hist(A)
hist(A,main="")
title(main="Histogram")
text()

# Boxplot
A <- round(runif(100, min = 0,max = 100),0)
boxplot(A)
title(main="boxplot")
title(xlab="Hello")
axis(4)
lines(c(1,1),c(30,50))


