# standardize text
# everything but letters are removed
to_standardized_unigram <- function(text){
  text <- gsub("[^[:alpha:]]", "", tolower(text))
  text <- unlist(strsplit(text, split=""))
  return(text)
}

# wrapper to handle warnings and errors
raise_error <- function(text, cutoff){

  # control input
  stopifnot(is.character(text))
  stopifnot(is.numeric(cutoff))

  # raise error when empty string
  if(0 %in% unname(sapply(text, nchar))){
    stop("`text` contains a character vector of length zero, an empty string.", call. = FALSE)
  }
}

#' Gibberish detection for textual data
#'
#' Assess whether a sentence contains gibberish words. For each word in a sentence, a Markov chain
#' inspects the sequence of vowels and consonents to estimate whether a sentence consists of natural words. Therefore,
#' words like 'asdfg' and 'dfrgfh' are considered unnatural and are classified as gibberish. The reliability of the model
#' increases when your textual data contains more characters.
#'
#' @param text character. Words or sentences.
#' @param threshold numeric. Cutoff to classify text as either gibber or not.
#'
#' @return logical
#' @export
#' @examples
#' text <- c("They don't want to know", "asdfg")
#' is_gibberish(text)
is_gibberish <- function(text, threshold=0.00345){

  # input wrapper to assure correct argtypes
  raise_error(text, cutoff=threshold)

  probs <- vector("double", length = length(text))
  for(i in seq_along(text)){

    # Extract unigrams
    unigrams <- to_standardized_unigram(text[i])

    # Set vector to store average transition probabilities
    results <- vector("double", length = length(unigrams)-1)

    if(length(unigrams)>1){

      # Loop over each unigram
      for(j in 1:(length(unigrams)-1)){

        # Retrieve probability
        prob <- bigram_prob[unigrams[[j]], unigrams[[j+1]]]

        # Update counters
        results[j] <- prob
      }
    } else {
      results[j] <- 0
    }
    probs[[i]] <- mean(results)
  }

  logicals <- ifelse(probs> threshold, FALSE, TRUE)
  return(logicals)
}
