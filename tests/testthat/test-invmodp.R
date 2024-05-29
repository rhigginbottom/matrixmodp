test_that("cannot find inverse of a non-square matrix", {
  A <- matrix(sample(0:4, 6, TRUE), 2, 3)
  expect_error(inv_p(A, 5))
})

test_that("matrix must be numeric", {
  A <- matrix(c(1, 2, 3, "d"), 2, 2)
  expect_error(inv_p(A, 5))
})

test_that("error when non-prime is entered", {
  A <- matrix(sample(0:4, 9, TRUE), 3, 3)
  expect_error(inv_p(A, 6))
})

test_that("cannot find inverse of a singular matrix", {
  A <- matrix(c(0,1,2,3,1,4,0,1,2), 3, 3)
  expect_error(inv_p(A, 5))
})

test_that("find accurate inverse of matrix", {
  A <- matrix(c(0,2,2,4,1,4,3,2,1),3,3)
  expect_equal(inv_p(A, 5), matrix(c(3,2,1,3,4,3,0,1,2),3,3))
})
