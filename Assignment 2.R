# Assignment 2 
getwd()
install.packages("tidyverse")
library(tidyverse)
library(gargle)

# Read the file "us-states.csv" into an R data frame
data<- read.csv(here("covid-19-data","us-states.csv")) #correct way to read csv for future reference
data = read.csv("us-states.csv")
View(data)

#Process the data frame using dplyr functions to keep only observations 
#for Pennsylvania
PA <- data[data$state== "Pennsylvania",]
View(PA)
n = length(PA$date)
#Create 2 new variables, "incr_cases" and "incr_deaths" 
#by calculating the CHANGES in the cases and deaths variables 
PA$incr_cases <- 1 
PA$incr_deaths <-1 
View(PA)

for (i in 2:n) {
  PA$incr_cases[i] <- (PA$cases[i]-PA$cases[i-1]) 
}

for (i in 2:n) {
  PA$incr_deaths[i] <- (PA$deaths[i]-PA$deaths[i-1]) 
}
View(PA)

#As a checksum to help grade this assignment, have it calculate the sd() 
#of all incr_cases in PA and print it in the Console.
sd(PA$incr_cases)
