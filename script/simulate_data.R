#### Preamble ####
# Purpose: Simulates a dataset of sandwich ingredients
# Author: Lorina Yang, Ruiying Li
# Date: 14th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: The `tidyverse` package must be installed

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Simulate data ####
# Set seed for reproducibility
set.seed(304)

vendors <- c("Metro", "Voila", "Walmart")

# Simulate prices for white bread
white_bread_data <- data.frame(
  vendor = rep(vendors, each = 100),
  price_per_unit = c(
    rnorm(100, mean = 1.5, sd = 0.2),  # Metro
    rnorm(100, mean = 1.6, sd = 0.3),  # Voila
    rnorm(100, mean = 3.0, sd = 0.5)   # Walmart
  )
)

# Simulate prices for turkey ham
ham_data <- data.frame(
  vendor = rep(vendors, each = 100),
  price_per_unit = c(
    rnorm(100, mean = 2.3, sd = 0.3),  # Metro
    rnorm(100, mean = 2.2, sd = 0.2),  # Voila
    rnorm(100, mean = 1.8, sd = 0.4)   # Walmart
  )
)


# View the simulated data
head(white_bread_data)
head(ham_data)


#### Save data ####
write_csv(ham_data, "Desktop/sta304/hammer/data/simulated_data/ham_simulated_data.csv")
write_csv(white_bread_data, "Desktop/sta304/hammer/data/simulated_data/white_bread_simulated_data.csv")

