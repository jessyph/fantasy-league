library(formattable)
library(dplyr)

fantasyLeagueDefence <- fantasyLeagueDefence %>%
  mutate(xp_diff = as.numeric(as.numeric(xP)) - (as.numeric(points))) # Adds column comparing difference in points and xP

# Positive xP differential suggests a player underpeformed in 19/20
# Negative xP differential suggests they over performed

defensiveDifferential <- fantasyLeagueDefence %>%
  group_by(player_name) %>%
  summarise(xP = xP, points = points, xp_diff = xp_diff) %>% # pick which columns to include
  arrange(desc(xP)) # arrange by xp_diff


colnames(defensiveDifferential) <- c("Player", "xP", "Points", "Differential")
formattable(defensiveDifferential)
