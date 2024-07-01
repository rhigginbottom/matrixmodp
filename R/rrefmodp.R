#' Check if integer is prime
#'
#' @param n integer
#'
#' @returns logical value
#' @noRd
prime_check <- function(n) {
  if (n == 1) {
    FALSE
  } else {
    ifelse(sum(n %% (1:n) == 0) > 2, FALSE, TRUE)
  }
}

#' Find the RREF of a matrix mod p
#'
#' `rref_p()` calculates the unique reduced-row echelon form of a matrix with entries in the finite field \eqn{F_p}.
#'
#' @param A A matrix
#' @param p A prime integer
#'
#' @returns A matrix of the same size as `A` which is the unique reduced-row echelon form of `A`.
#' @export
#'
#' @examples
#' B <- matrix(c(3, 4, 1, 3, 2, 0), 2, 3)
#' rref_p(B, 5)
#' C <- matrix(c(0, 2, 0, 0, 0, 2, 0, 1, 1), 3, 3)
#' rref_p(C, 3)
rref_p <- function(A, p) {
  if ((!is.matrix(A)) || (!is.numeric(A))) {
    stop("argument must be a numeric matrix")
  }
  if (!(round(p) == p) || p < 2) {
    stop("p must be a positive integer greater than 1")
  }
  if (!prime_check(p)) {
    stop("p must be a prime number")
  }
  A <- A %% p
  m <- nrow(A)
  n <- ncol(A)
  if (sum(round(A) == A) != m * n) {
    stop("matrix must consist of integers")
  }
  i <- j <- 1
  while (i <= m && j <= n) {
    while (j <= n) {
      col <- A[, j]
      col[1:m < i] <- 0
      which <- which.max(col)
      pivot <- A[which, j]
      if (which < i | pivot == 0) {
        j <- j + 1
        next
      }
      if (which > i) A[c(i, which), ] <- A[c(which, i), ]
      for (k in 1:p) {
        piv_inv <- k
        if (((pivot * k) %% p) == 1) {
          break
        }
      }
      A[i, ] <- A[i, ] * piv_inv
      row <- A[i, ] %% p
      A <- A - outer(A[, j], row)
      A[i, ] <- row
      A <- A %% p
      j <- j + 1
      break
    }
    i <- i + 1
  }
  zeros <- which(apply(A[, 1:n, drop = FALSE], 1, function(x) max(abs(x)) == 0))
  if (length(zeros) > 0) {
    zeroRows <- A[zeros, , drop = FALSE]
    A <- A[-zeros, , drop = FALSE]
    A <- rbind(A, zeroRows)
  }
  return(A)
}
