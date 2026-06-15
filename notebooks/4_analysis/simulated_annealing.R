# COST(i,j)  <- is the function that gets normalization and search space upperbounds and computes 
#the sum of median yearly cost of PSO for 4 years of data 

records = data.frame()
cost_matrix <- matrix[NA, ncol= 15, nrow= 30]

nc <- ncol(cost_matrix) #matrix column number defined by user (for us 15)
nr <- nrow(cost_matrix) ##matrix row number defined by user (for us 30)

c0 = as.integer(sample(1:nc,1)) #matrix column, steps of 5 for search space upperbound
r0 = as.integer(sample(2:nr,1)) #matrix row, steps of 1 for normalization upperbound

c0 <- COST(r0, c0*5) 
cost_min = c0

T = 1
k = 0.9
p = 1
i = 0
eplsion = 0.001

while ((T>epsilon)&(i >= 2)) {
  #defining available directions to move from the current point
  #up = 1 , right =2, down = 3, left = 4 
  if ((r0 == 1)&(c0 == 1)) {
    drct <- c(2,3)
  } else if ((r0 == 1)&(c0 == nc)){
    drct <- c(3,4)
  } else if ((r0 == nr)&(c0 == 1)){
    drct <- c(1,2)
  } else if ((r0 == nr)&(c0 == nc)){
    drct <- c(1,4)
  } else if ((r0 == 1)&((c0 > 1)&(c0 < nc))){
    drct <- c(2:4)
  } else if ((r0 == nr)&((c0 > 1)&(c0 < nc))){
    drct <- c(1,2,4)
  } else if ((c0 == 1)&((r0 > 1)&(r0 < nr))){
    drct <- c(1:3)
  } else if ((c0 == nc)&((r0 > 1)&(r0 < nr))){
    drct <- c(1,3,4)
  } else {drct <- c(1:4)}
  s <- as.numeric(sample(drct,1)) #choosing a random direction
  if (s == 1) {rn = r0-1} else if (s == 2) {cn = c0+1} else if (s == 3) {rn = r0+1} else {cn = c0-1}
  
  new_cost <- COST(rn,cn*5)
  if (new_cost < c0){
    i = 0
    cost_min <- min(cost_min, new_cost)
    r0 = rn
    c0 = cn
    T <- k*T
    c0 <- new_cost
  } else {
    p = exp((cost_means[r0,c0]-cost_means[rn,cn])/(k*T))
    p0 = runif(1)
    if (p0 < p) {
      i = 0
      r0 = rn
      c0 = cn
      c0 <- new_cost
    }
    T <- k*T
    i = i+1
  }
  
  records = rbind(records , c(r0, c0, new_cost, cost_min, real_min, s, T, p))
  sa_trajectories[r0,c0] <- sa_trajectories[r0,c0]+1
  
}

heatmap(as.matrix(sa_trajectories), Colv = NA, Rowv = NA)
which(cost_means==min(cost_means),arr.ind=TRUE)
