# Element 8: Tidyverse -- dplyr ----

# Scenario 1: Aggregation across height & width
PlayData_t %>% 
  group_by(type, time) %>% 
  summarise(avg = mean(value))

# Scenario 2: Aggregation across time 1 & time 2
PlayData_t %>% 
  group_by(type, key) %>% 
  summarise(avg = mean(value))

# Scenario 3: Aggregation across type A & type B
PlayData_t %>% 
  group_by(key, time) %>% 
  summarise(avg = mean(value))

