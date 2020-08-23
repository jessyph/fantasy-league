library(tidyverse)
library(dplyr)

xgdata <- read_csv("https://raw.githubusercontent.com/nandy47/Premier-League-Data-19-20/master/PLMetaData.csv")

fantasyLeagueAttack <- xgdata %>%
  filter(grepl('F|M', position)) %>% # Filter for attacking players
  mutate(points = as.numeric((as.numeric(goals) * 3) + (as.numeric(assists) * 2))) # Creates new column based on points tally
