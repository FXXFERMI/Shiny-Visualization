#### Preamble ####
# Purpose: Tests the integrity and consistency of analysis dataset.
# Author: Siqi Fei
# Date: 28 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' for data manipulation, 'testthat' for unit testing, and 'here' for path handling.
# Any other information needed? Ensure the 'analysis_data.csv' file exists within the 'data/analysis_data' directory.

#### Workspace setup ####
library(testthat)
library(tidyverse)
library(here)

analysis_data <- read_csv(here("data/analysis_data/analysis_data.csv"))


