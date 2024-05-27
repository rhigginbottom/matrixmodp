prime_check <- function(n){
  if (n == 1) {FALSE} else
  {ifelse(sum(n %% (1:n) == 0) > 2, FALSE, TRUE)}
}

is_prime <- function(n){
  sapply(n, prime_check)
}

rref_p <- function(A, p){
  if ((!is.matrix(A)) || (!is.numeric(A)))
    stop("argument must be a numeric matrix")
  if (!(round(p) == p) || p < 2 )
    stop("p must be a positive integer greater than 1")
  if (!is_prime(p))
    stop("p must be a prime number")
  A <- A %% p
  m <- nrow(A)
  n <- ncol(A)
  if (sum(round(A) == A) != m*n)
    stop("matrix must consist of integers")
  i <- j <- 1
  while (i <= m && j <= n){
    while (j <= n){
       # w <- c(i,j) # used in debugging
       # print(w)
      col <- A[,j]
      col[1:m < i] <- 0 # put 0 in entries above current row
      # find maximum pivot in current column at or below current row
    which <- which.max(col)
    pivot <- A[which, j]
    # check for 0 pivot
    if (which < i | pivot == 0) {
      j <- j+1
      next
    }
    # move pivot if needed
    if (which > i) A[c(i, which),] <- A[c(which, i),]  
    # find multiplicative inverse of pivot
    for(k in 1:p){
      piv_inv <- k
      if(((pivot * k) %% p) == 1){
        break
      }
    }
    # multiply row by multiplicative inverse of pivot
    A[i,] <- A[i,]*piv_inv            
    row <- A[i,] %% p
    # clear out all entries in column except pivot
    A <- A - outer(A[,j], row)      
    A[i,] <- row  
    A <- A %% p
    j <- j+1
    break
   # i <- i+1
  }
   i <- i+1
  }
  zeros <- which(apply(A[, 1:n, drop=FALSE], 1, function(x) max(abs(x))== 0))
  if (length(zeros) > 0){
    zeroRows <- A[zeros, , drop=FALSE]
    A <- A[-zeros, , drop=FALSE]
    A <- rbind(A, zeroRows)
  }
  print(A)
}