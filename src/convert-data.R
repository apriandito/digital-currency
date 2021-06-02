# Load library
library(tidyverse)
library(lubridate)

# Load data
df <- read_rds("data/tweet_digitalcurrency.rds")

# Select Text Data
df_text <- df %>%
  select(created_at, text) %>%
  write_csv("data/tweet_digitalcurrency_text.csv")

# Select Network Data
df_network <- df%>%
  mutate(created_at = as_date(created_at)) %>%
  select(created_at, screen_name, mentions_screen_name) %>%
  unnest(mentions_screen_name) %>%
  drop_na() %>%
  rename(source = screen_name, target = mentions_screen_name) %>%
  select(created_at, source, target) %>%
  write_csv("data/tweet_digitalcurrency_network.csv")


# Select Text Data - Sample
df_text_sample <- df %>%
  filter(created_at > dmy("20-12-2020")) %>%
  select(created_at, text) %>%
  write_csv("data/tweet_digitalcurrency_text-sample.csv")


# Select Network Data
df_network_sample <- df%>%
  filter(created_at > dmy("01-12-2020")) %>%
  mutate(created_at = as_date(created_at)) %>%
  select(created_at, screen_name, mentions_screen_name) %>%
  unnest(mentions_screen_name) %>%
  drop_na() %>%
  rename(source = screen_name, target = mentions_screen_name) %>%
  select(created_at, source, target) %>%
  write_csv("data/tweet_digitalcurrency_network-sample.csv")
