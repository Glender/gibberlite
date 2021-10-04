to_standardized_unigram <- function(text){
  text <- tolower(text)
  text <- gsub("[^[:alpha:]]", "", text)
  text <- unlist(strsplit(text, split=""))
  return(text)
}

#' Title
#'
#' @param text character vector
#' @param threshold numeric
#'
#' @return
#' @export
#'
#' @examples
is_gibberish <- function(text, threshold=threshold){

  stopifnot(is.character(text))

  # set threshold
  threshold <- 0.00345

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
  return(probs)
}
