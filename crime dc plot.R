library("ggplot2")
install.packages("ggmap")
library("ggmap")

##reading in crime data##
crimedc <- read.csv("C:\\Users\\choog_000\\Documents\\R\\DataScience Quorum\\crimedc.csv")
head(crimedc)

## generating the map ##
dc_map <- ggmap(get_googlemap(center = "Washington, D.C."),
               base_layer = ggplot(aes(x = x, y = y),
                                   data = crimedc))

## refinging the map ##
dc_map <- ggmap(get_googlemap(center = "Washington, D.C.",
               zoom = 12,
               maptype = "roadmap",
               scale = 2),
               base_layer = ggplot(aes(x = x, y = y),
                                   data = crimedc))

## plotting a 2D plot on the map ##
plot_crime <- dc_map + geom_density2d(color = "black")

## adding aesthetics to the map##
plot_crime2 <- plot_crime +
  stat_density2d(geom ="polygon",
                 aes(alpha = ..level..,
                     fill = ..level..))+
  scale_fill_gradient(low = "yellow",
                      high = "red") +
  guides(alpha = FALSE)


##adding facet wraps ##
plot_crime3 <- plot_crime2 + facet_wrap(~Crime)

##calling the map##
plot_crime
plot_crime2
plot_crime3

dc_map
