#!/usr/bin/env Rscript
# download CPython source from a given version release
# and place it in ../src/cpython
getScriptPath <- function() {
    cmd.args <- commandArgs()
    m <- regexpr("(?<=^--file=).+", cmd.args, perl = TRUE)
    script.dir <- dirname(regmatches(cmd.args, m))
    if (length(script.dir) == 0) {
        stop("can't determine script dir: please call the script with Rscript")
    }
    if (length(script.dir) > 1) {
        stop("can't determine script dir: more than one '--file' argument detected")
    }
    return(script.dir)
}
version <- "3.14.2"
# github https://github.com/python/cpython/archive/refs/tags/v3.14.2.tar.gz
url <- sprintf("https://github.com/python/cpython/archive/refs/tags/v%s.tar.gz", version)
destfile <- tempfile(fileext = ".tgz")
tools_dir <- getScriptPath()
root_dir <- normalizePath(file.path(tools_dir, ".."))
src_dir <- file.path(root_dir, "src")
cpython_dir <- file.path(src_dir, "cpython")
if (!dir.exists(cpython_dir)) {
    dir.create(cpython_dir, recursive = TRUE)
} else {
    unlink(cpython_dir, recursive = TRUE, force = TRUE)
}

download.file(url, destfile)
untar(destfile, exdir = src_dir)
extracted_dir <- file.path(src_dir, sprintf("cpython-%s", version))
file.rename(extracted_dir, cpython_dir)
unlink(destfile)
# remove src/cpython/Lib/test
unlink(file.path(cpython_dir, "Lib", "test"), recursive = TRUE, force = TRUE)
# remove src/cpython/Modules/_xxtestfuzz
unlink(file.path(cpython_dir, "Modules", "_xxtestfuzz"), recursive = TRUE, force = TRUE)
# remove src/cpython/Doc
unlink(file.path(cpython_dir, "Doc"), recursive = TRUE, force = TRUE)
# remove all png,md, .svg and pdf  files in src/cpython
removal_files <- list.files(cpython_dir, pattern = "\\.png$|\\.md$|\\.svg$|\\.pdf$", recursive = TRUE, full.names = TRUE)
file.remove(removal_files)
# src/cpython/PC/icons
icons_dir <- file.path(cpython_dir, "PC", "icons")
if (dir.exists(icons_dir)) {
    unlink(icons_dir, recursive = TRUE, force = TRUE)
}

# anything ending with .txt or .psd, rst in src/cpython
removal_files2 <- list.files(cpython_dir, pattern = "\\.txt$|\\.psd$|\\.rst$", recursive = TRUE, full.names = TRUE)
file.remove(removal_files2)
