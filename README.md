
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CPython

<!-- badges: start -->

[![R-CMD-check](https://github.com/sounkou-bioinfo/CPython/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sounkou-bioinfo/CPython/actions/workflows/R-CMD-check.yaml)
[![CPython status
badge](https://sounkou-bioinfo.r-universe.dev/CPython/badges/version)](https://sounkou-bioinfo.r-universe.dev/CPython)
<!-- badges: end -->

## Abstract

CPython is a minimal R package that builds and bundles the CPython
interpreter from source for use in other R packages. It exposes only a
few helpers to query the embedded interpreter path and version.

## Installation

``` r
install.packages(
  "CPython",
  repos = c("https://sounkou-bioinfo.r-universe.dev", "https://cloud.r-project.org")
)
```

## Usage

``` r
library(CPython)

cpython_interpreter_path()
#> [1] "/usr/local/lib/R/site-library/CPython/python/bin/python3"
cpython_version()
#> [1] "3.14.2 (main, Feb  2 2026, 22:32:50) [GCC 13.3.0]"
```

## License

GPL-3
