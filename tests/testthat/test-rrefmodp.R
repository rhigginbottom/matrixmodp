test_that("matrix must be numeric", {
  A <- matrix(c(1, 2, 3, "d"), 2, 2)
  expect_error(rref_p(A, 5))
})

test_that("matrix entries must all be integers", {
  A <- matrix(c(1, 2.5, 3, 3), 2, 2)
  expect_error(rref_p(A, 5))
})

test_that("error when non-prime is entered", {
  A <- matrix(sample(0:4, 9, TRUE), 3, 3)
  expect_error(rref_p(A, 6))
})
