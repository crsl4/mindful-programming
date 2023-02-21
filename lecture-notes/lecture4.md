# Testing code

This section is inspired by Karl Broman's notes.

You want to test your code, but more importantly, you want to continuously test your code as you introduce more changes (preferably automated testing).

Different types of tests:

- Check inputs
  - Stop if the inputs aren't as expected.
- Unit tests
  - For each small function: does it give the right results in specific cases?
- Integration tests
  - Check that larger multi-function tasks are working.
- Regression tests
  - Compare output to saved results, to check that things that worked continue working


## Check inputs with R package `assertthat`

You are creating an R function `winsorize` that limits extreme values of a vector. You want to include some `assert_that` statements to make sure that the input arguments are what you expect:

```r
#' import assertthat
winsorize <-
function(x, q=0.006)
{
if(all(is.na(x)) || is.null(x)) return(x)
assert_that(is.numeric(x))
assert_that(is.number(q), q>=0, q<=1)
lohi <- quantile(x, c(q, 1-q), na.rm=TRUE)
if(diff(lohi) < 0) lohi <- rev(lohi)
x[!is.na(x) & x < lohi[1]] <- lohi[1]
x[!is.na(x) & x > lohi[2]] <- lohi[2]
x
}
```

## Unit tests with R package `testthat`
Now, you want to make sure that the `winsorize` function returns what it is supposed to:

```r
test_that("winsorize works for small vectors", {
x <- c(2, 3, 7, 9, 6, NA, 5, 8, NA, 0, 4, 1, 10)
result1 <- c(2, 3, 7, 9, 6, NA, 5, 8, NA, 1, 4, 1, 9)
result2 <- c(2, 3, 7, 8, 6, NA, 5, 8, NA, 2, 4, 2, 8)
expect_identical(winsorize(x, 0.1), result1)
expect_identical(winsorize(x, 0.2), result2)
})
```

## Integration tests in `tests` folder
You can store test functions in the `tests` folder, for example, `tests/testthat.R`:

```r
library(testthat)
test_check("mypkg")
```

## Automated testing
You can perform automated tests with `Codecov` within github. Learn more about `Codecov` [here](https://codecov.io/).



