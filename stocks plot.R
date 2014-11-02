## read in data ##
stocks <- read.csv("C:\\Users\\choog_000\\Documents\\R\\DataScience Quorum\\stocks.csv")

#install ggplot package##
install.packages("ggplot2")
library(ggplot2)

## define original plot ##
plot_stock <- ggplot(data = stocks)

###### adding aesthetics to plot ######

# creating data and aesthetics layers##
plot_stock <- ggplot(data = stocks, 
                     aes(x = Date, 
                         y = Adj.Close, 
                         color = Stock, 
                         group = Stock)) 

# adding geometry layers ##
plot_stock + geom_point()
plot_stock + geom_line() + stat_smooth() 

#adding labels #
plot_stock + geom_line() + stat_smooth() + xlab('Time') + ylab('Price') + ggtitle('AAPL v MSFT')

## adding new theme ##
plot_stock + geom_line() + stat_smooth() + theme_bw() + xlab('Time') + ylab('Price') + ggtitle('AAPL v MSFT')

## flipping the y-axis ##
plot_stock + geom_line() + stat_smooth() + 
  theme_bw() + xlab('Time') + ylab('Price') + ggtitle('AAPL v MSFT') + scale_y_reverse()

## adding faceting ##

plot_stock + geom_line() + stat_smooth() + theme_bw() + 
  xlab('Time') + ylab('Price') + ggtitle('AAPL v MSFT') + facet_wrap(~Stock,ncol=1)