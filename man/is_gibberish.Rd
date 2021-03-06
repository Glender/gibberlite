% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/detect_gibber.R
\name{is_gibberish}
\alias{is_gibberish}
\title{Gibberish detection for textual data}
\usage{
is_gibberish(text, threshold = 0.00345)
}
\arguments{
\item{text}{character. Words or sentences.}

\item{threshold}{numeric. Cutoff to classify text as either gibber or not.}
}
\value{
logical
}
\description{
Assess whether a sentence contains gibberish words. For each word in a sentence, a Markov chain
inspects the sequence of vowels and consonents to estimate whether a sentence consists of natural words. Therefore,
words like 'asdfg' and 'dfrgfh' are considered unnatural and are classified as gibberish. The reliability of the model
increases when your textual data contains more characters.
}
\examples{
text <- c("They don't want to know", "asdfg")
is_gibberish(text)
}
