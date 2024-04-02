#### Work Place Set Up ####
library(tidyverse)
library(ggplot2)
library(here)


#### Data Plot ####
load(here("data/raw_data/babynames.rda"))
ls()
top_five_names_by_year <-
  babynames |> 
  arrange(desc(n)) |>
  slice_head(n = 5, by = c(year, sex))

top_five_names_by_year |>
  ggplot(aes(x = n, fill = sex)) +
  geom_histogram(position = "dodge") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1") +
  labs(
    x = "Babies with that name",
    y = "Occurrences",
    fill = "Sex"
  )