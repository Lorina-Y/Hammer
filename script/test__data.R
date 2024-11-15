#### Preamble ####
# Purpose: Test the dataset of sandwich ingredients
# Author: Lorina Yang, Ruiying Li
# Date: 14th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: The `tidyverse` package must be installed


#### Workspace setup ####
library(tidyverse)

bread <- read_csv("Desktop/sta304/hammer/data/clean_data/white_bread_data.csv")
ham <- read_csv("Desktop/sta304/hammer/data/clean_data/ham_data.csv")

# Check if data is loaded and is a data frame
if (exists("bread")) {
  message("Test Passed: The bread dataset was successfully loaded.")
} else {
  stop("Test Failed: The bread dataset could not be loaded.")
}

if (exists("ham")) {
  message("Test Passed: The ham dataset was successfully loaded.")
} else {
  stop("Test Failed: The ham dataset could not be loaded.")
}


#### Test data ####


# Check if the dataset has 4 columns
if (ncol(bread) == 4) {
  message("Test Passed: The bread dataset has 4 columns.")
} else {
  stop("Test Failed: The bread dataset does not have 4 columns.")
}

if (ncol(ham) == 4) {
  message("Test Passed: The ham dataset has 4 columns.")
} else {
  stop("Test Failed: The ham  dataset does not have 4 columns.")
}



# Check if the 'vendor' column contains only 'Metro' and 'Voila" and "Walmart"
valid_answers <- c("Metro", "Voila", "Walmart")

if (all(bread$vendor %in% valid_answers)) {
  message("Test Passed: The 'vendor' column contains only 'Metro','Voila', 'Walmart'.")
} else {
  stop("Test Failed: The 'vendor' column contains invalid store names.")
}

if (all(ham$vendor %in% valid_answers)) {
  message("Test Passed: The 'vendor' column contains only 'Metro','Voila', 'Walmart'.")
} else {
  stop("Test Failed: The 'vendor' column contains invalid store names.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(ham))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}




