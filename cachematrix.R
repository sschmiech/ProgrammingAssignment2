## Matrix inversion is usually a costly computation so this functions use caching to  save computation time

## create a special matrix with the possibility to cache the inverse matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  ##change matrix
  set <- function(y) {
    x <<- y
    ## delete cache if x is changed
    m <<- NULL
  }
  ##access matrix
  get <- function() x
  ##store  inverse matrix
  setinverse <- function(inverse) m <<- inverse
  ##access inverse matrix
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## calculate the inverse matrix if avaible use the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  ## return cache of m if available
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  ## calculate m if no cache is available
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

