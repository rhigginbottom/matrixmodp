#' Finds the determinant of a matrix mod p
#'
#' @param A A square matrix
#' @param p A prime integer
#'
#' @returns An integer between 0 and (p-1)
#' @noRd
det_p <- function(A, p) {
  dta <- round(det(A))
  dt <- dta %% p
  round(dt)
}

#' Calculate the inverse of a matrix mod p
#'
#' `inv_p()` finds the inverse of a square matrix over the field \eqn{F_p}. The function checks for invertibility and then row-reduces the augmented matrix \eqn{[A|I]} over \eqn{F_p} to find the inverse.
#'
#' @param A A square matrix
#' @param p A prime integer
#'
#' @returns A square matrix of the same size as `A`
#' @export
#'
#' @examples
#' B <- matrix(c(5, 2, 3, 6, 5, 5, 4, 0, 2), 3, 3)
#' inv_p(B, 7)
#' C <- matrix(c(3, 0, 4, 0, 2, 1, 1, 3, 0, 3, 0, 1, 3, 0, 2, 1), 4, 4)
#' inv_p(C, 5)
inv_p <- function(A, p) {
  if ((!is.matrix(A)) || (!is.numeric(A))) {
    stop("argument must be a numeric matrix")
  }
  if (!(round(p) == p) || p < 2) {
    stop("p must be a positive integer greater than 1")
  }
  if (!prime_check(p)) {
    stop("p must be a prime number")
  }
  m <- nrow(A)
  n <- ncol(A)
  if (m != n) {
    stop("The matrix must be square")
  }
  if (det_p(A, p) == 0) {
    stop("The matrix is not invertible")
  }
  In <- diag(rep(1, n))
  B <- cbind(A, In)
  sink(nullfile())
  C <- rref_p(B, p)
  sink()
  D <- C[, (n + 1):(2 * n)]
  return(D)
}
