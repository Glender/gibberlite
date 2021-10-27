#' Calculate Shannon Entropy
#'
#'In information theory, the entropy of a random variable is
#'the average level of "information", "surprise", or "uncertainty"
#'inherent in the variable's possible outcomes. The concept of
#'information entropy was introduced by Claude Shannon
#'in his 1948 paper "A Mathematical Theory of Communication.
#'
#' @param probs numeric vector.
#'
#' @return numeric
#' @export
#'
#' @examples
#' p <- c(6 / 26, 20 / 26)
#' shannon_entropy(p)
shannon_entropy <- function(probs) {
  sum(-(probs*log(probs, base = 2)))
}
