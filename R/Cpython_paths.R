cpython_package_path <- function(...) {
    system.file("cpython", ..., package = "CPython")
}

#' Path to the bundled CPython interpreter
#'
#' Returns the on-disk path to the CPython interpreter shipped with the
#' package. If a built interpreter is not present, you can set
#' `must_exist = FALSE` to get the expected default location.
#'
#' @param must_exist Logical. If `TRUE` (default), error when no interpreter
#'   is found.
#'
#' @return A single string path to the interpreter.
#' @export
cpython_interpreter_path <- function(must_exist = TRUE) {
    candidates <- if (.Platform$OS.type == "windows") {
        c(
            cpython_package_path("python.exe"),
            cpython_package_path("PCbuild", "amd64", "python.exe"),
            cpython_package_path("PCbuild", "win32", "python.exe")
        )
    } else {
        c(
            cpython_package_path("python"),
            cpython_package_path("bin", "python3"),
            cpython_package_path("bin", "python")
        )
    }

    candidates <- candidates[nzchar(candidates)]
    existing <- candidates[file.exists(candidates)]

    if (length(existing) > 0L) {
        return(existing[[1L]])
    }

    if (isTRUE(must_exist)) {
        stop("CPython interpreter not found in the package.", call. = FALSE)
    }

    if (length(candidates) > 0L) {
        return(candidates[[1L]])
    }

    NA_character_
}
