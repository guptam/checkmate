#' Check if an argument is a count
#'
#' A count is a non-negative integer.
#'
#' @templateVar fn Count
#' @template na-handling
#' @template checker
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @export
#' @examples
#'  test(1, "count")
#'  test(-1, "count")
#'  test(Inf, "count")
checkCount = function(x, na.ok = FALSE) {
  qassert(na.ok, "B1")
  if (length(x) != 1L)
    return("Must have length 1")
  if (is.na(x))
    return(ifelse(na.ok, TRUE, "May not be NA"))
  if (!qcheck(x, "x1"))
    return("Must be integerish")
  if (x < 0)
    return("Must be >= 0")
  return(TRUE)
}

#' @rdname checkCount
#' @export
assertCount = function(x, na.ok = FALSE, .var.name) {
  makeAssertion(checkCount(x, na.ok), vname(x, .var.name))
}

#' @rdname checkCount
#' @export
testCount = function(x, na.ok = FALSE) {
  makeTest(checkCount(x, na.ok))
}