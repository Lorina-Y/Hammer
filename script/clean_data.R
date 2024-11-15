#### Preamble ####
# Purpose: Cleans the data about main ingredients of sandwich
# Author: Lorina Yang, Ruiying Li
# Date: 14th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("Desktop/sta304/hammer/data/raw_data/hammer_data.csv")


# Filter out rows with missing price_per_unit
data_clean <- raw_data %>%
  filter(!is.na(price_per_unit))

# Filter for product names that contain "White Bread"
white_bread_data <- data_clean %>%
  filter(str_detect(product_name, "White Bread")& vendor %in% c("Metro", "Walmart",
                                                               'Voila'))

# Function to clean and convert price to numeric in dollars
convert_price_to_dollars <- function(price) {
  # Remove spaces and check if the price is in cents
  price <- str_trim(price)
  if (str_detect(price, "¢")) {
    # Extract numeric value and divide by 100 to convert to dollars
    numeric_price <- as.numeric(gsub("[^0-9.]", "", price)) / 10000
  } else {
    # Remove non-numeric characters and keep the value in dollars
    numeric_price <- as.numeric(gsub("[^0-9.]", "", price))
  }
  return(numeric_price)
}

# Apply the conversion function to the price_per_unit column
white_bread_data$price_per_unit <- sapply(white_bread_data$price_per_unit, convert_price_to_dollars)

# Check if price_per_unit is numeric
str(white_bread_data)
      

ham_data <- data_clean %>%
  filter(str_detect(product_name, "Ham"))

#### Save data ####
write_csv(white_bread_data, "Desktop/sta304/hammer/data/clean_data/white_bread_data.csv")
write_csv(ham_data, "Desktop/sta304/hammer/data/clean_data/ham_data.csv")


