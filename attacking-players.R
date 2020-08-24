library(ggplot2)
library(ggrepel)
library(showtext)

font_add_google("Roboto Condensed", "roboto")

showtext_auto()

ggplot(data = fantasyLeagueAttack %>% filter(time > 1100), aes(x = points, y = xP)) +
  geom_point(colour = "#817A7A") + 
  stat_smooth(method = "lm", se = FALSE, colour = "black") +
  geom_text_repel(data = fantasyLeagueAttack %>%
                    filter(xP >= 40) %>%
                    filter(points >= 40),
                  aes(label = player_name),
                  family = "roboto") +
  geom_text_repel(data = fantasyLeagueAttack %>%
                    filter(xP < 40) %>%
                    filter (xP >= 20) %>%
                    filter(points >= 20),
                  aes(label = player_name),
                  family = "roboto") +
  geom_text_repel(data = fantasyLeagueAttack %>%
                    filter(xP >= 40) %>%
                    filter(points < 40),
                  aes(label = player_name),
                  family = "roboto")
