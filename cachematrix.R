## below are two functions that are used to create a special object that stores a matrix and cashe's its inverse

## makeCasheMatrix is a special function that contains a list of functions to:

## set the value of a matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The following function  calculates the inverse of the matrix created at makeCasheMatrix. It first checks if the cashed data already exists and than get the inverse of the matrix calling solve(d)

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  d <- x$get()
  m <- solve(d)
  x$setinverse(m)
  m
}
