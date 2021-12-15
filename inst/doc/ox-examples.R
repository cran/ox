## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## -----------------------------------------------------------------------------
library(ox)
x <- NULL
y <- 1
  
# if (!is.null(x)) x else y
xo(is.null, x, .else = y)

## -----------------------------------------------------------------------------
library(ox)
x <- Inf
y <- 1
  
# if (is.finite(x)) x else y
xo(is.infinite, x, .else = y)

## -----------------------------------------------------------------------------
x <- character(0)
y <- 1

# if (!identical(x, character(0))) x else y
xo(identical, x, character(0), .else = y)

## -----------------------------------------------------------------------------
x <- structure(0, class = "test")
y <- 1

# if (inherits(x, "test")) x else y
ox(inherits, x, "test", .else = y)

## -----------------------------------------------------------------------------
x <- 1
y <- 2

# if (x > y) x else y
ox(`>`, x, y)

## -----------------------------------------------------------------------------
x <- "example text"
y <- "alternative text"

# if (grepl("text", x)) x else y
ox(grepl, "text", x, .else = y)

## -----------------------------------------------------------------------------
x <- c("a", "b")
y <- "a"

# if (is.character(x) && length(x) == 1) x else y
ox(function(x) is.character(x) && length(x) == 1, x, .else = y)

## -----------------------------------------------------------------------------
if (require(checkmate)) {
  x <- c("a", "b")
  y <- "a"
  
  # if (test_character(x, len = 2)) x else y
  ox(test_character, x, len = 2, .else = y)  
}

## -----------------------------------------------------------------------------
library(magrittr)
x <- "a"
y <- 1

# x %<>% if (is.numeric(.)) . else y
x %<>% ox(.f = is.numeric, .else = y)

## -----------------------------------------------------------------------------
x <- c(1, NA, 3)
y <- 2

# x[is.na(x)] <- y[is.na(x)]
XO(is.na, x, .else = y)

## -----------------------------------------------------------------------------
x <- c(1, 2, 3)
y <- 0

x[which.min(x)] <- y
XO(which.min, x, .else = y)

## -----------------------------------------------------------------------------

## -----------------------------------------------------------------------------
x <- c(1, 2, 3)
y <- c(4, 3, 2)

# x[x < y] <- y [x < y]
OX(`>`, x, y)

## -----------------------------------------------------------------------------
x <- c(1, 2, 3, 4)

# x[x > 2]
OX(`>`, x, 2, .else = NULL)

## -----------------------------------------------------------------------------
x <- list(1, 2, 3, 4)

# x[vapply(x, function(xx) xx > 2, logical(1))]
OX(`>`, x, 2, .else = NULL)

## -----------------------------------------------------------------------------
library(dplyr)
iris %>%
  mutate(x = ifelse(Sepal.Length > Petal.Length, Sepal.Length, Petal.Length))

iris %>% mutate(x = OX(`>`, Sepal.Length, Petal.Length))

