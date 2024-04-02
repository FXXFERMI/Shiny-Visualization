#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers to prepare for analysis. This includes filtering observations, recoding variables, and selecting relevant data.
# Author: Siqi Fei
# Date: 28 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' package, specifically for data manipulation and writing the cleaned data to a new CSV file.
# Any other information needed? Make sure the raw data file is located at 'data/raw_data/Auschwitz_Death_Certificates_1942-1943 - Auschwitz.csv' before running this script.

#### Workspace setup ####
library(tidyverse)
library(here)

#### Clean data ####
# Load the raw data from a CSV file.
raw_data <- read_csv(here("data/raw_data/Auschwitz_Death_Certificates_1942-1943 - Auschwitz.csv"))

# Clean and prepare the data for analysis.
cleaned_data <- na.omit(raw_data)
cleaned_data <- subset(cleaned_data, !apply(cleaned_data, 1, function(row) any(grepl("^\\.\\.\\.", row))))
cleaned_data <- subset(cleaned_data, !apply(cleaned_data, 1, function(row) any(grepl("^\\-\\-\\-", row))))
cleaned_data <- subset(cleaned_data, !apply(cleaned_data, 1, function(row) any(grepl("^\\'", row))))

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv") 

