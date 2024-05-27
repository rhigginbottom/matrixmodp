det_p <- function(A, p) {
  dta <- round(det(A))
  dt <- dta %% p
  round(dt)
}

inv_p <- function(A, p) {
  if ((!is.matrix(A)) || (!is.numeric(A))) {
    stop("argument must be a numeric matrix")
  }
  if (!(round(p) == p) || p < 2) {
    stop("p must be a positive integer greater than 1")
  }
  if (!is_prime(p)) {
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
  print(D)
}
