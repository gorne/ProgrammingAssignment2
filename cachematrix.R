## Put comments here that give an overall description of what your
## functions do
# this two functions allows store in cache memory a matrix and its inverse.

## Write a short comment describing this function
# this function take a matrix ('x') and create an object which is a list of functions 
# that allows:
#	1) obtain the original matrix ('x$get()')
#	2) store in cache memory the inverse of 'x' ('x$setinverse()')
#	3) obtain the inverse stored ('x$getinverse()')

makeCacheMatrix <- function(x = matrix()) {	#makeCacheMatrix needs a matrix as argument
			inv <- NULL # it will be te inverse of matrix x, by default is NULL

			get <- function(){x}				#it returns the original matrix
			setinverse <- function(inverse){inv <<- inverse}	#it saves the inverse matrix in cache
			getinverse <- function(){inv}			#it returns the inverse matrix

			list(get = get, setinverse = setinverse, getinverse = getinverse)	#makeCacheMatrix returns this list of functions.
}





## Write a short comment describing this function
#this function takes the object made by "makeCacheMatrix()",
#it takes the inverse of 'x' by execute x$getinverse() and returns this value.
#But, if the inverse has not been calculated, the funcition computes it,
#stores it in cache memory by x$setinverse and returns the value of inverse of x.

cacheSolve <- function(x, ...) {	#cacheSolve takes a "makeCacheMatrix" object as argument
		inv <- x$getinverse()	#if the inverse of "x" is already been computed, cacheSolve takes it from makeCacheMatrix object and...
		if(!is.null(inv)) {return(inv)}	#... returns it.
		
		data <- x$get()		#if the inverse doesn't exist, cacheSolve takes the "x" matrix ...
		inv <- solve(data, ...)	#... computes it, ...
		x$setinverse(inv)		# saves it in the cache memory and ...
		return(inv)			#... returns the inverse
}

