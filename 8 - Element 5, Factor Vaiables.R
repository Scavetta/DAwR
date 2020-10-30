# Element 6: Factor Variables (with levels)
# i.e. Categorical, qualitative, discrete variables
# with a number of "groups"
# i.e. A small and known number of discrete groups

# Load packages ----
# This should already be loaded if you executed the commands in the previous file.
library(tidyverse)

glimpse(PlantGrowth)
# Notice that the levels are printed:
PlantGrowth$group

typeof(PlantGrowth$group) # integer
class(PlantGrowth$group) # factor
# Factor is a special class of type integer
# Where each integer is associated with a label call "level"

# e.g.
str(PlantGrowth)

# Main problem:
# doing math on factors and coercion
test <- c(23:26, "bob")
test
# When we make a data frame chr become fct
test_df <- data.frame(test)
test_df$test

foo3
foo_df$tissue

# But tibbles won't switch types:
test_tb <- tibble(test)
test_tb$test

# But if you do have a factor, coercion is difficult
mean(test_df$test)
# Solution: 
as.numeric(test_df$test) # no!
# First coerce to chr
as.numeric(as.character(test_df$test))

# Change levels easily:
levels(PlantGrowth$group)[1] <- "Control"
PlantGrowth