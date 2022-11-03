library(gapminder)
library(here)
library(tidyverse)
library(socviz)

library(readr)
WOT <- read.csv("WOT.csv")

WOT_updated <- filter(WOT, Battles > 3)
WOT_updated$WR <- sub("%", "", WOT_updated$WR)
WOT_updated$WR <- as.numeric(WOT_updated$WR)


p <- ggplot(data = WOT_updated,
            mapping = aes(x = reorder(Nation, WR, na.rm = TRUE), y = WR))
plot_a <- p +geom_boxplot()+ 
  labs(x = "Nation Played",
       y = "Win Rate (WR)",
       title = "Stats by Nation Played")

q <- ggplot(data = WOT_updated,
            mapping = aes(x= reorder(Class, WR, ma.rm = TRUE), y = WR))
plot_b <- q + geom_boxplot()+ 
  labs(x= "Type Played",
       y = "Win Rate (WR)",
       title = "Stats by Type Played")

library(gridExtra)

gridExtra:: grid.arrange(
  plot_a,
  plot_b,
  ncol = 2
)

  
  
  
  
  