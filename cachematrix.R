## Creating functions that creates a list a functions that will inverse the matrix from cache


makeCacheMatrix <- function(x = matrix()) { ##creates function the function list that the cashSolve, instead of solve i used ginv from the MASS library
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setinverse <- function(ginv) s <<- ginv
  getinverse <- function() s
  list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}

cacheSolve <- function(x, ...) { ## gets the inverse of the matrix
  s <- x$getinverse()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- ginv(data, ...)
  x$setinverse(s)
  s
  
}




