# Element 7: Tidyverse -- tidyr ----

# Get a play data set:
PlayData <- read_tsv("data/PlayData.txt")

# Let's see the scenarios we discussed in class:
# Scenario 1: Transformation height & width
PlayData$height/PlayData$width

# For the other scenarios, tidy data would be a 
# better starting point:
# we'll use gather()
# 4 arguments
# 1 - data
# 2,3 - key,value pair - i.e. name for OUTPUT
# 4 - the ID or the MEASURE variables

# using ID variables ("exclude" using -)
gather(PlayData, "key", "value", -c("type", "time"))

# using MEASURE variables
PlayData_t <- gather(PlayData, "key", "value", c("height", "width"))

# Scenario 2: Transformation across time 1 & 2
# difference from time 1 to time 2 for each type and key
# we only want one value as output
PlayData_t %>% 
  group_by(type, key) %>% 
  summarise(change = value[time == 2] - value[time == 1])

# or...
PlayData_t %>% 
  spread(time, value) %>% 
  mutate(change = `2` - `1`)

# standardize to time 1
PlayData_t %>% 
  group_by(type, key) %>% 
  mutate(stand = value/value[time == 1])

# Scenario 3: Transformation across type A & B
# A/B for each time and key
PlayData_t %>% 
  group_by(time, key) %>% 
  summarise(change = value[type == "A"] / value[type == "B"])

PlayData_t %>% 
  spread(type, value) %>% 
  mutate(change = A/B)
