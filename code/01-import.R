## Import Data ----

library(tidyverse)

d <-
  read_csv(
    "https://raw.githubusercontent.com/fivethirtyeight/data/master/star-wars-survey/StarWars.csv",
    col_names = FALSE,
    skip = 2
  )


names <-
  read_csv(
    "https://raw.githubusercontent.com/fivethirtyeight/data/master/star-wars-survey/StarWars.csv",
    col_names = FALSE,
    skip = 0,
    n_max = 2
  )

new_names <-
  c(
    "ID",
    "YN_SEEN_STARWARS",
    "YN_FAN_STARWARS",
    "YN_SEEN_EPISODE_1",
    "YN_SEEN_EPISODE_2",
    "YN_SEEN_EPISODE_3",
    "YN_SEEN_EPISODE_4",
    "YN_SEEN_EPISODE_5",
    "YN_SEEN_EPISODE_6",
    "VAL_RANK_EPISODE_1",
    "VAL_RANK_EPISODE_2",
    "VAL_RANK_EPISODE_3",
    "VAL_RANK_EPISODE_4",
    "VAL_RANK_EPISODE_5",
    "VAL_RANK_EPISODE_6",
    "CAT_FAVOR_HAN_SOLO",
    "CAT_FAVOR_LUKE",
    "CAT_FAVOR_LEIA",
    "CAT_FAVOR_ANAKIN",
    "CAT_FAVOR_OBI_WAN",
    "CAT_FAVOR_EMPEROR_PALPATINE",
    "CAT_FAVOR_DARTH_VADER",
    "CAT_FAVOR_LANDO",
    "CAT_FAVOR_BOBA_FETT",
    "CAT_FAVOR_C3PO",
    "CAT_FAVOR_R2D2",
    "CAT_FAVOR_JARJAR",
    "CAT_FAVOR_PADME",
    "CAT_FAVOR_YODA",
    "CAT_WHO_SHOT_FIRST",
    "YN_KNOW_EXPANDED_UNIVERSE",
    "YN_FAN_EXPANDED_UNIVERSE",
    "YN_FAN_STAR_TREK",
    "IND_DEMOGRAPHIC_FEMALE",
    "CAT_DEMOGRAPHIC_AGE",
    "CAT_DEMOGRAPHIC_INCOME",
    "CAT_DEMOGRAPHIC_EDUCATION",
    "CAT_DEMOGRAPHIC_LOCATION"
  )

names(d) <- new_names

## raw data

## add mistakes for students to find in checks

d <- d %>%
  mutate(CAT_FAVOR_BOBA_FETT = case_when(
    CAT_FAVOR_BOBA_FETT == "Very favorably" ~ "This is the way",
    TRUE ~ CAT_FAVOR_BOBA_FETT
  ),
  across(c(YN_SEEN_STARWARS, YN_FAN_STARWARS, YN_FAN_EXPANDED_UNIVERSE,
         YN_FAN_STAR_TREK), tolower)
  )

write_csv(d, "data/raw-data/data.csv")

## data dictionary

names <- as.data.frame(t(names))
names(names) <- c("name_1", "name_2")
names <- fill(names, name_1)
tibble(col_names = new_names, 
       description = glue::glue("{names[,1]}-{names[,2]}")) -> data_dict

knitr::kable(data_dict)
write_csv(data_dict, "data/data-dictionary.csv")


