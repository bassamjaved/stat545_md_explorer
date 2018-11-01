STAT 547 Class Meeting 01: Writing your own Functions
================

``` r
library(gapminder)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.0.0     ✔ purrr   0.2.5
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.6
    ## ✔ tidyr   0.8.1     ✔ stringr 1.3.1
    ## ✔ readr   1.1.1     ✔ forcats 0.3.0

    ## ── Conflicts ────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches

    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null

This worksheet is a condensed version of Jenny’s stat545.com functions
[part1](http://stat545.com/block011_write-your-own-function-01.html),
[part2](http://stat545.com/block011_write-your-own-function-02.html),
and
[part3](http://stat545.com/block011_write-your-own-function-03.html).

## Syntax Demo

Let’s demo the syntax of function-making.

``` r
square <- function(x) {
  y <- x^2
  return(y)
  5 #will not return 5 because code will stop at return(y)
}
square(10)
```

    ## [1] 100

## Motivating example: max minus min.

Find the max minus min of the gapminder life expectancy:

``` r
?min
?max
max(gapminder$lifeExp) - min(gapminder$lifeExp)
```

    ## [1] 59.004

``` r
#max vs pmax - pmax compares each row of a vector with the corresponding row in another vector (it will recycle rows if the vectors are not the same length)
```

Exercise: turn this into a function\! i.e., write a function that
returns the max minus min of a vector. Try it out on the gapminder
variables.

``` r
max_minus_min <- function(x) {
  max(x) - min(x)
}
max_minus_min(gapminder$lifeExp)
```

    ## [1] 59.004

We’ll be building on this. Development philosophy [widely attributed to
the Spotify development
team](http://blog.fastmonkeys.com/?utm_content=bufferc2d6e&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer):

![](http://stat545.com/img/spotify-howtobuildmvp.gif)

## Testing

Check your function using your own eyeballs:

  - Apply to the vector 1:10. Do you get the intended result?
  - Apply to a random uniform vector. Do you get meaningful
results?

<!-- end list -->

``` r
max_minus_min(1:10)
```

    ## [1] 9

``` r
max_minus_min(runif(100)) #returns uniform vector length 100 with random numbers
```

    ## [1] 0.9708303

Let’s formalize this testing with the `testthat` package. `expect_*()`
functions:

``` r
expect_equal(0.1 + 0.2, 0.3)
#expect_identical(0.1 + 0.2, 0.3)
```

Add another check to the following unit test, based on the uniform
random numbers:

``` r
test_that("Simple cases work", {
    expect_equal(max_minus_min(1:10), 9)
    expect_lt(max_minus_min(runif(100)),1) #try with 0.5 instead of 1
})
```

## Try and break your function

Because you will eventually forget the function specifics.

``` r
#max_minus_min(numeric(0))
#max_minus_min(gapminder)
#max_minus_min(gapminder$country)
```

These don’t
break\!

``` r
max_minus_min(gapminder[c('lifeExp', 'gdpPercap', 'pop')]) #taking min and max of whole df
```

    ## [1] 1318683072

``` r
max_minus_min(c(TRUE, TRUE, FALSE, TRUE, TRUE)) #coercing to vector of 0's and 1's
```

    ## [1] 1

We want:

1.  Prevent the latter cases from happening, and
2.  Make a more informative error message in the former.

Check out `stopifnot` and `stop`:

``` r
#stopifnot(FALSE)
#stop("Here's my little error message.")
```

Your turn: Use two methods:

1.  Using `stopifnot`, modify the max-min function to throw an error if
    an input is not numeric (the `is.numeric` function is useful).

<!-- end list -->

``` r
mmm1 <- function(x) {
    stopifnot(!is.numeric(x))
    max(x) - min(x)
}

#mmm1("hello")
```

2.  Using `stop` and an `if` statement, Modify the max-min function to:
      - throw an error if an input is not numeric. In the error message,
        indicate what’s expected as an argument, and what was recieved.
      - return `NULL` if the input is length-0, with a warning using the
        `warning` function.

<!-- end list -->

``` r
mmm2 <- function(x) {
    if (!is.numeric(x)) {
        stop(paste("Expecting x to be numeric. You gave me",
                   typeof(x)
                   )
             )
    }
    max(x) - min(x)
}
```

Try breaking the function now:

``` r
#mmm1((numeric(0)))
#mmm1(gapminder)
#mmm1(gapminder$country)
#mmm1(gapminder[c('lifeExp', 'gdpPercap', 'pop')])
#mmm1(c(TRUE, TRUE, FALSE, TRUE, TRUE))

#mmm2((numeric(0)))
#mmm2(gapminder)
#mmm2(gapminder$country)
#mmm2(gapminder[c('lifeExp', 'gdpPercap', 'pop')])
#mmm2(c(TRUE, TRUE, FALSE, TRUE, TRUE))
```

## Naming, and generalizing to quantile difference

``` r
v <- 1:10
mmm2(v) #x is a dummy variable when mmm2 function was defined. What is passed into it does not need to be called x
```

    ## [1] 9

Let’s generalize the function to take the difference in two quantiles:

``` r
qd <- function(x, probs) {
    stopifnot(is.numeric(x))
    if (length(x) == 0) {
        warning("You inputted a length-0 x. Expecting length >=1. Returning NULL.")
        return(NULL)
    } 
    qvec <- quantile(x, probs)
    max(qvec) - min(qvec)
}
```

Try it out:

``` r
x <- runif(100)
qd(x, c(0.25, 0.75))
```

    ## [1] 0.5025322

``` r
IQR(x) #function returns inter-quartile range, which is what was effectively called in the line above
```

    ## [1] 0.5025322

``` r
qd(x, c(0,1))
```

    ## [1] 0.9967839

``` r
mmm2(x)
```

    ## [1] 0.9967839

Why did I call the arguments `x` and `probs`? Check out `?quantile`.
\#makes it more readable to use the same variable names

If we input a vector stored in some variable, need that variable be
named `x`?

## Defaults

Would be nice to have defaults for `probs`, right? Add them to the below
code (which is copied and pasted from above):

``` r
qd2 <- function(x, probs=c(0,1)) {
    stopifnot(is.numeric(x))
    if (length(x) == 0) {
        warning("You inputted a length-0 x. Expecting length >=1. Returning NULL.")
        return(NULL)
    } 
    qvec <- quantile(x, probs)
    max(qvec) - min(qvec)
}

qd2(rnorm(100))
```

    ## [1] 4.59292

``` r
qd2(rnorm(100), probs = c(0.25, 0.75))
```

    ## [1] 1.383369

## NA handling

Does this return what we were expecting?

``` r
v <- c(1:10, NA)
#qd(v)
```

Notice that `quantile()` has a `na.rm` option. Let’s use it in our `qd`
function. Modify the code below:

``` r
qd2 <- function(x, probs=c(0,1)) {
    stopifnot(is.numeric(x))
    if (length(x) == 0) {
        warning("You inputted a length-0 x. Expecting length >=1. Returning NULL.")
        return(NULL)
    } 
    qvec <- quantile(x, probs, na.rm = TRUE)
    max(qvec) - min(qvec)
}
qd2(v)
```

    ## [1] 9

## Ellipses

There are other arguments to `quantile`, like `type`, that are not used
all that much. Put them in as ellipses:

``` r
qd2 <- function(x, probs=c(0,1), na.rm=FALSE, ...) {
    stopifnot(is.numeric(x))
    if (length(x) == 0) {
        warning("You inputted a length-0 x. Expecting length >=1. Returning NULL.")
        return(NULL)
    } 
    qvec <- quantile(x, probs, na.rm = na.rm, ...)
    max(qvec) - min(qvec)
}

v2 <- rnorm(100)
qd2(v2, probs = c(0,1), na.rm = TRUE, type = 1)
```

    ## [1] 4.75881
