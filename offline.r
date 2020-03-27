install.packages('tidyverse')
library(CausalImpact)
library(tidyverse)


set.seed(2018)
#create one sample data set 
x1 <- 100 + arima.sim(model = list(order = c(1,1,0), ar = 0.7), n = 99) 
y <- 1.2 * x1 + rnorm(100) 
y[70:100] <- y[70:100] + 10
data <- cbind(y, x1)

matplot(data, type = "l")

pre.period <- c(1, 70)
post.period <- c(71, 100)

impact <- CausalImpact(data, pre.period, post.period)
plot(impact)
summary(impact, "report")






