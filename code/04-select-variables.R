library(Hmisc)
library(modelr)

## Read in data ----

starwars_survey <- read_csv("data/cleaned-data/data.csv")

## Goal: predict how the survey participant will rank Episode 1 based on their
## other variables.

## Application Exercise 1 ----
## Choose at least 5 variables to predict how the participant will rank Episode 1
## (Do not choose any other RANK variables - Why?)
## Use the varclus function to examine how these predictors cluster

## Application Exercise 2 ----
## Using the same variables from the previous exercise, use the the redun
## function function to whether any variables are redundant with an R2 of 0.75

## Application Exercise 3 ----
## Use the spearman2 function to look at the correlation between your selected
## variables and VAL_RANK_EPISODE_1
## Plot this. If you had to choose, which would you include?

## Application Exercise 4 ----
## Fit the linear model predicting VAL_RANK_EPISODE_1 from the final variables
## you have selected. Calculate the root mean squared error for this model using
## the rmse function


