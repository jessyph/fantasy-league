library(ggplot2)
library(ggrepel)


ggplot(data = fantasyLeagueAttack, aes(x = points, y = xP)) +
  geom_point(colour = "#817A7A") + 
  stat_smooth(method = "lm", se = FALSE, colour = "black") +
  geom_text_repel(data = fantasyLeagueAttack %>%
                    filter(xP >= 40) %>%
                    filter(points >= 40),
                  aes(label = player_name),
                  colour = "#0AA21C") +
  geom_text_repel(data = fantasyLeagueAttack %>%
                    filter(xP < 40) %>%
                    filter (xP >= 20) %>%
                    filter(points >= 20),
                  aes(label = player_name),
                  colour = "#F07D11") +
  geom_text_repel(data = fantasyLeagueAttack %>%
                    filter(xP >= 40) %>%
                    filter(points < 40),
                  aes(label = player_name),
                  colour = "#F03611")