source("cachematrix.R")
test <-function(){
  Matrix <- matrix(c(  3,  2,  6, 1,  1,  3, -3, -2, -5), nrow = 3, ncol = 3, byrow = TRUE)
  inverseMatrix <- matrix(c( 1, -2,  0, -4,  3, -3,  1,  0,  1), nrow = 3, ncol = 3, byrow = TRUE)
  myMatrix <- makeCacheMatrix(Matrix)
  start_time <- Sys.time()
  inverseMatrix1 <- cacheSolve(myMatrix)
  end_time <- Sys.time()
  time_duration <- end_time - start_time
  print(time_duration)
  
  start_time <- Sys.time()
  inverseMatrix2 <- cacheSolve(myMatrix)
  end_time <- Sys.time()
  time_duration <- end_time - start_time
  print(time_duration)
  print(inverseMatrix)
  print(inverseMatrix1)
  print(inverseMatrix2)
  identical(inverseMatrix1,inverseMatrix2)
}
test()