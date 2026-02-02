#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

extern SEXP RC_CPython_Version(void);

static const R_CallMethodDef CallEntries[] = {
  {"RC_CPython_Version", (DL_FUNC) &RC_CPython_Version, 0},
  {NULL, NULL, 0}
};

void R_init_CPython(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
