
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gibberlite

[![](https://img.shields.io/badge/devel%20version-0.0.0.9000-purple.svg)](https://github.com/Glender/gibberlite)
[![R build
status](https://github.com/rossellhayes/ipa/workflows/R-CMD-check/badge.svg)](https://github.com/rossellhayes/ipa/actions)
[![](https://codecov.io/gh/rcannood/princurve/branch/master/graph/badge.svg)](https://codecov.io/gh/rcannood/princurve)
[![](https://img.shields.io/github/languages/code-size/Glender/gibberlite.svg)](https://github.com/Glender/gibberlite)

## :arrow\_double\_down: Installation

You can install the development version of gibberlite from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Glender/gibberlite")
```

## Overview

With the gibberlite package you can sssess whether a sentence contains
gibberish words. A Markov chain inspects the sequence of vowels and
consonents to estimate whether a sentence consists of natural words.
Therefore, words like ‘asdfg’ and ‘dfrgfh’ are considered unnatural and
are classified as gibberish. The accuracy of the classification improves
when a sentence contains more characters.

## :book: Usage

``` r
library(gibberlite)
# create vector with character data
text <- c(
 "Personally I'm always ready to learn, although I do not always like being taught.",
 "asdfg",
 "Computer",
 "dfhdfghd",
 "I love to walk."
)

# assess if text is gibber
is_gibberish(text)
#> [1] FALSE  TRUE FALSE  TRUE FALSE
```

## :speech\_balloon: Looking for something more fancy?

The gibberlite packages implements a very simple model. If you want a
state-of-the-art solution, see the gibber package:
<https://github.com/Glender/gibber>
