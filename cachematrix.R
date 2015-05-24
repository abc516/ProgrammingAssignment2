## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# makeCacheMatrix returns a list of functions
# setMatrix
# getMatrix
# cacheInverse
# getInverse
# Its puspose is to store a matrix and a cached value of the inverse of the 
# matrix. 
makeCacheMatrix <- function(x = matrix()) {
    # holds the cached value or NULL if nothing is cached
    # initially nothing is cached so set it to NULL
    
    cache <- NULL
    
    # store a matrix
    
    setMatrix <- function(newValue) {
        x <<- newValue
        # since the matrix is assigned a new value, flush the cache
        cache <<- NULL
    }
    
    # returns the stored matrix
    getMatrix <- function() {
        x
    }
    
    # cache the given argument 
    cacheInverse <- function(solve) {
        cache <<- solve
    }
    
    # get the cached value
    getInverse <- function() {
        cache
    }
    
    # return a list. Each named element of the list is a function
    list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'
#note this function needs to be passed a data frame matrix
cacheSolve <- function(x, ...) {
        
    inv <- x$getInverse()
    
    #returns a cached value if it exists
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    
    #otherwise we get the matrix, calculate its inverse
    #and store it in the cache
    data<-x$getMatrix()
    inv <-solve(data)
    y$cacheInverse(inv)
    
    #return the inverse
    inv
}
