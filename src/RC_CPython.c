// RC_CPython.c
// Mostly C Python header to get the version
#include "python3.14/Python.h"
#include <Rinternals.h>
#include <R.h>

SEXP RC_CPython_Version() {
    SEXP version;
    version = PROTECT(allocVector(STRSXP, 1));
    SET_STRING_ELT(version, 0, mkChar(Py_GetVersion()));
    UNPROTECT(1);
    return version;
}