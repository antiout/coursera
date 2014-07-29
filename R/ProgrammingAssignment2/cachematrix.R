#This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(m = matrix()) {
  inv <- NULL

  set <- function( matrix ) {  m <<- matrix;  inv <<- NULL  }
  setInv <- function(inverse) { inv <<- inverse }
  
  get <- function() m
  getInv <- function() inv
    
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}

#This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
#above. If the inverse has already been calculated (and the matrix has not changed), 
#then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  i <- x$getInv()
  if( is.null(i) ) { 
    i <- solve(x$get())
    x$setInv(i)    
  } else {
    message("getting cached data"); 
  }  
  i
}
