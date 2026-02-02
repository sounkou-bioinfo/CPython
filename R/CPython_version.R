#' CPython version
#'
#' Reads the bundled CPython version from the embedded CPython runtime.
#'
#' @return A single string version (for example, "3.14.2").
#' @export
cpython_version <- function() {
    .Call("RC_CPython_Version")
}
