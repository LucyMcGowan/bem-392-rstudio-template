## Clean Data

library(tidyverse)
d <- read_csv("data/raw-data/data.csv")

d <- d %>%
  mutate(across(starts_with("YN"), tolower)) %>%
# creating a new variable YN_SEEN_EPISODE_1
  mutate(YN_SEEN_EPISODE_1 = case_when(
    is.na(YN_SEEN_EPISODE_1) & is.na(YN_SEEN_EPISODE_2) &
      is.na(YN_SEEN_EPISODE_3) & is.na(YN_SEEN_EPISODE_4) &
      is.na(YN_SEEN_EPISODE_5) & is.na(YN_SEEN_EPISODE_6) ~ NA_character_,
    !is.na(YN_SEEN_EPISODE_1) ~ "yes",
    YN_SEEN_STARWARS == "no" ~ "no",
    TRUE ~ "no"
  ),
  YN_SEEN_EPISODE_2 = case_when(
    is.na(YN_SEEN_EPISODE_1) & is.na(YN_SEEN_EPISODE_2) &
      is.na(YN_SEEN_EPISODE_3) & is.na(YN_SEEN_EPISODE_4) &
      is.na(YN_SEEN_EPISODE_5) & is.na(YN_SEEN_EPISODE_6) ~ NA_character_,
    !is.na(YN_SEEN_EPISODE_2) ~ "yes",
    YN_SEEN_STARWARS == "no" ~ "no",
    TRUE ~ "no"
  ),
  YN_SEEN_EPISODE_3 = case_when(
    is.na(YN_SEEN_EPISODE_1) & is.na(YN_SEEN_EPISODE_2) &
      is.na(YN_SEEN_EPISODE_3) & is.na(YN_SEEN_EPISODE_4) &
      is.na(YN_SEEN_EPISODE_5) & is.na(YN_SEEN_EPISODE_6) ~ NA_character_,
    !is.na(YN_SEEN_EPISODE_3) ~ "yes",
    YN_SEEN_STARWARS == "no" ~ "no",
    TRUE ~ "no"
  ),
  YN_SEEN_EPISODE_4 = case_when(
    is.na(YN_SEEN_EPISODE_1) & is.na(YN_SEEN_EPISODE_2) &
      is.na(YN_SEEN_EPISODE_3) & is.na(YN_SEEN_EPISODE_4) &
      is.na(YN_SEEN_EPISODE_5) & is.na(YN_SEEN_EPISODE_6) ~ NA_character_,
    !is.na(YN_SEEN_EPISODE_4) ~ "yes",
    YN_SEEN_STARWARS == "no" ~ "no",
    TRUE ~ "no"
  ),
  YN_SEEN_EPISODE_5 = case_when(
    is.na(YN_SEEN_EPISODE_1) & is.na(YN_SEEN_EPISODE_2) &
      is.na(YN_SEEN_EPISODE_3) & is.na(YN_SEEN_EPISODE_4) &
      is.na(YN_SEEN_EPISODE_5) & is.na(YN_SEEN_EPISODE_6) ~ NA_character_,
    !is.na(YN_SEEN_EPISODE_5) ~ "yes",
    YN_SEEN_STARWARS == "no" ~ "no",
    TRUE ~ "no"
  ),
  YN_SEEN_EPISODE_6 = case_when(
    is.na(YN_SEEN_EPISODE_1) & is.na(YN_SEEN_EPISODE_2) &
      is.na(YN_SEEN_EPISODE_3) & is.na(YN_SEEN_EPISODE_4) &
      is.na(YN_SEEN_EPISODE_5) & is.na(YN_SEEN_EPISODE_6) ~ NA_character_,
    !is.na(YN_SEEN_EPISODE_6) ~ "yes",
    YN_SEEN_STARWARS == "no" ~ "no",
    TRUE ~ "no"
  ),
  IND_DEMOGRAPHIC_FEMALE = case_when(
    IND_DEMOGRAPHIC_FEMALE == "Female" ~ 1,
    IND_DEMOGRAPHIC_FEMALE == "Male" ~ 0
  ))

## Uncomment the code below to get you started.
## Add a new variable CAT_DEMOGRAPHIC_AGE_2 that categorizes age as <30 or 30+

# d <- d %>%
#  mutate(CAT_DEMOGRAPHIC_AGE_2 = case_when(
#    ----
#  ))

write_csv(d, "data/cleaned-data/data.csv")
