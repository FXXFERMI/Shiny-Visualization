#### Preamble ####
# Purpose: Create an static graph and an static table
# Author: Siqi Fei
# Date: 28 March 2024
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'tidyverse' for data manipulation and 'rstanarm' for performing Bayesian regression.
# Any other information needed? Ensure the analysis_data.csv file is available in the 'data/analysis_data' directory.

#### Work Place Set Up ####
library(tidyverse)
library(ggplot2)
library(here)

analysis_data <- read_csv(here("data/analysis_data/analysis_data.csv"))

# View the first few rows of the dataframe
head(analysis_data)

#### Data Plot ####
last_name_counts <- analysis_data %>%
  count(`Last Name`, Residence) %>%
  arrange(desc(n))

top_five_last_names <- last_name_counts %>%
  group_by(Residence) %>%
  top_n(5, n) %>%
  ungroup()

ggplot(top_five_last_names, aes(x = `Last Name`, y = n, fill = Residence)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Top Five Last Names by Residence",
       x = "Last Name",
       y = "Count")

show(top_five_last_names)