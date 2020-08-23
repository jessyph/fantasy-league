library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggrepel)

xgdata <- read_csv("https://raw.githubusercontent.com/nandy47/Premier-League-Data-19-20/master/PLMetaData.csv")

fantasyLeagueAttack <- xgdata %>%
  filter(grepl('F|M', position)) %>% # Filter for attacking players
  filter(!team_name %in% c("Norwich", "Bournemouth", "Watford")) %>% # Remove the relegated teams
  mutate(points = as.numeric((as.numeric(goals) * 3) + (as.numeric(assists) * 2))) %>% # Creates new column based on points tally
  mutate_at(vars(xG, xA), funs(round(., 2))) %>% # Round xG 
  mutate(xP = as.numeric((as.numeric(xG) * 3) + (as.numeric(xA) * 2))) 

ggplot(data = fantasyLeagueAttack, aes(x = points, y = xP)) +
  geom_point() + 
  stat_smooth(method = "lm", se = FALSE) +
  geom_text_repel(data = fantasyLeagueAttack %>%
              filter(xP >= 30),
            aes(label = player_name))
