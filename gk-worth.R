library(dplyr)
library(formattable)

fl[1, "player"] = "GK Allisson"
view(fl)

gk <- fl %>%
  group_by(player) %>%
  summarise(X.m = X.m, tot = tot, ppm = round(ppm, 2)) %>%
  filter(grepl('GK', player)) %>%
  arrange(desc(tot))

formattable(gk)
