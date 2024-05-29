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


test_that("find accurate rref of matrix (1)", {
  A <- matrix(c(6, 6, 6, 3, 4, 0, 2, 1, 0), 3, 3)
  expect_equal(rref_p(A, 7), matrix(c(1, 0, 0, 0, 1, 0, 0, 0, 1), 3, 3))
})

test_that("find accurate rref of matrix (2)", {
  A <- matrix(c(0, 4, 4, 2, 0, 2, 3, 1, 4), 3, 3)
  expect_equal(rref_p(A, 7), matrix(c(1, 0, 0, 0, 1, 0, 2, 5, 0), 3, 3))
})

test_that("find accurate rref of matrix (3)", {
  A <- matrix(c(1, 6, 3, 3, 2, 5, 4, 4, 3, 5, 2, 1), 4, 3)
  expect_equal(rref_p(A, 7), matrix(c(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0), 4, 3))
})

test_that("find accurate rref of matrix (4)", {
  A <- matrix(c(2, 4, 4, 3, 2, 0, 4, 0, 2, 4, 0, 0, 2, 2, 0), 3, 5)
  expect_equal(rref_p(A, 5), matrix(c(1, 0, 0, 0, 1, 0, 0, 0, 1, 3, 4, 4, 3, 0, 4), 3, 5))
})
