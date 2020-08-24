library(dplyr)
library(formattable)

fl <- fl %>%
  mutate(ppm = as.numeric(as.numeric(tot)/as.numeric(X.m))) # Creates column of points per million

worth <- fl %>%
  group_by(player) %>%
  summarise(X.m = X.m, tot = tot, ppm = round(ppm, 2)) %>%
  filter(X.m > 0) %>%
  arrange(desc(ppm)) %>% # Arrange by highest PPM
  slice_max(ppm, n = 20)

colnames(worth) <- c("Player", "£m", "Points total", "Points per million")

formattable(worth)  

waste <- fl %>%
  group_by(player) %>%
  summarise(X.m = X.m, tot = tot, ppm = round(ppm, 2)) %>%
  filter(X.m > 0) %>%
  arrange(desc(ppm)) %>% # Arrange by highest PPM
  slice_min(ppm, n = 20)

colnames(waste) <- c("Player", "£m", "Points total", "Points per million")  

formattable(waste)
