library(formattable)
library(dplyr)

fantasyLeagueAttack <- fantasyLeagueAttack %>%
  mutate(xp_diff = as.numeric(as.numeric(xP)) - (as.numeric(points))) # Adds column comparing difference in points and xP

# Positive xP differential suggests a player underpeformed in 19/20
# Negative xP differential suggests they over performed

minsPlayed <- fantasyLeagueAttack %>%
  filter(time > 2565) # filter for players who have played more than 75% of mins

attackingDifferential <- minsPlayed %>% # create new df to see top players
  group_by(player_name) %>%
  summarise(xP = xP, points = points, xp_diff = xp_diff) %>% # pick which columns to include
  filter(points >= 20) %>% # filter by players who scored more than 20 points
  arrange(desc(xp_diff)) %>% # arrange by xp_diff
  top_n(10) #show top 10 players

colnames(attackingDifferential) <- c("Player", "xP", "Points", "Differential")

formattable(attackingDifferential)
