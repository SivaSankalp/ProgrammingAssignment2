## a pair of functions that compute and cache the inverse of a matrix

## this function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(z = matrix()) m <<- z
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## this function computes the inverse of the square invertible matrix x. 
## if the inverse in already computed and the matrix has not changed, then it
## simply retrieves the inverse from the cache

cacheSolve <- function(x, ...) {
        
        n <- x$getinverse()
        if(!is.null(n)) {
                message("getting cached data")
                return(n)
        }
        data <- x$get()
        n <- solve(data)
        x$setinverse(n)
        n
        
        ## Return a matrix that is the inverse of 'x'
}
