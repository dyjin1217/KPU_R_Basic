summary(mtcars$mpg) # mtcars의 mpg의 요약을 조회한다.

plot(mtcars$wt, mtcars$mpg) # mtcars의 wt, mpg로 차트를 그려본다.

mean(mtcars$mpg) 
median(mtcars$mpg)

colSums(mtcars)
rowSums(mtcars)

apply(mtcars,2,mean)
apply(mtcars,2,median)
apply(mtcars,2,max)
apply(mtcars,2,sd)

# bivariate analysis (이변수 분석)

cars_auto = subset(mtcars, am == 0)
cars_manual = subset(mtcars, am == 1)

plot(mtcars$hp, mtcars$mpg, type = "n", main = "mpg vs hp") 
points(cars_auto$hp, cars_auto$mpg, col = "red", pch = 20)
points(cars_manual$hp, cars_manual$mpg, col = "blue", pch = 20)

legend("topright", pch = 20, col = c("red", "blue"), legend = c("auto", "manual")) # add legend
model1_auto = lm(mpg ~ hp, data = cars_auto)
model1_manu = lm(mpg ~ hp, data = cars_manual)
abline(model1_auto, col = "red", lwd = 2)
abline(model1_manu, col = "blue", lwd = 2)
abline(v = 175, lty = 2)


# network 분석
c_mat <- cor(mtcars)
diag(c_mat) <- 0

temp_mat <- c_mat
thres1 <- quantile(c_mat,0.8)
thres2 <- quantile(c_mat,0.2)
c_mat[] <- 0
c_mat[temp_mat>thres1] <- 1
c_mat[temp_mat<=thres2] <- 1

# 그래프 시각화
library(igraph)
g <- graph.adjacency(c_mat, mode="undirected", weighted=NULL)


# 노드 컬러 조정
node_col <- rep("orange",ncol(mtcars))
node_col[2] <- "green"
V(g)$color <- node_col

# 레이블 조정 
label <- V(g)$name
label[3] <- "H"
V(g)$label <- label


# 노드 크기 조정 (중심성)
V(g)$size<- degree(g)*5

idx <- which(degree(g) ==5)
node_col[idx] <- "skyblue"
V(g)$color <- node_col

# 엣지 컬러 및 굵기
edge_col <- rep("gray",length(E(g)))
edge_col[1:2] <- "red"
edge_col[4] <- "red"
E(g)$color <- edge_col
E(g)$width <- 4


#is_idx <- temp_mat <= thres2
#e_idx <- which(is_idx, arr.ind=TRUE)
#rnames <- rownames(is_idx) 
#cnames <- colnames(is_idx)
#for(i in 1:nrow(e_idx)){
#  print(paste(rnames[e_idx[i,1]],cnames[e_idx[i,2]]))
#}
  

#betweeness(g)
#closeness(g)
#eigen_centrality(g)$vector

plot(g)