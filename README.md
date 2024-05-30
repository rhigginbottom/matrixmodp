
<!-- README.md is generated from README.Rmd. Please edit that file -->

# matrixmodp

<!-- badges: start -->
<!-- badges: end -->

The goal of matrixmodp is to make two matrix algebra tasks easier when
working with the fields $F_p$. Specifically, this package provides two
functions: `rref_p()` calculates the reduced-row echelon form of a
matrix, and `inv_p()` calculates the inverse of a (square, invertible)
matrix.

## Installation

You can install the development version of matrixmodp from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rhigginbottom/matrixmodp")
```

## Example

We first provide an example of finding the RREF of a matrix with entries
in $F_5$.

``` r
library(matrixmodp)
entries <- c(4, 1, 2, 0, 0, 3, 4, 0, 0, 1, 4, 1)
A <- matrix(entries, 3, 4)
rref_p(A, 5)
#>      [,1] [,2] [,3] [,4]
#> [1,]    1    0    0    4
#> [2,]    0    1    0    1
#> [3,]    0    0    1    0
```

We now show how to find the inverse of a $3\times 3$ matrix over $F_7$.

``` r
library(matrixmodp)
entries <- c(3, 3, 3, 2, 0, 2, 1, 2, 5)
A <- matrix(entries, 3, 3)
inv_p(A, 7)
#>      [,1] [,2] [,3]
#> [1,]    6    5    1
#> [2,]    3    3    1
#> [3,]    5    0    2
```
