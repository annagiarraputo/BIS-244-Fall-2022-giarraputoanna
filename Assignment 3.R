# Import and combine the following files from your COVID-19 submodule
library(here)
library(tidyverse)
LIVE <- read_csv(here("covid-19-data", "live", "us-counties.csv"))
RECENT <- read_csv(here("covid-19-data", "us-counties-recent.csv"))
COUNT2020 <- read_csv(here("covid-19-data", "us-counties-2020.csv"))
COUNT2021 <- read_csv(here("covid-19-data", "us-counties-2021.csv"))
COUNT2022 <- read_csv(here("covid-19-data", "us-counties-2022.csv"))
COMBINE <- rbind(COUNT2020, COUNT2021, COUNT2022, RECENT, LIVE)

#Filter 
PennCount <- filter(COMBINE, state == "Pennsylvania")
view(PennCount)
Lehigh <- filter(PennCount, county == "Lehigh")

#Remove any rows with duplicate dates 
CasesL <- distinct(Lehigh, date,.keep_all = TRUE) 

#Calculate the number of new cases for each date 
n <- length(CasesL$date)
CasesL$incr_cases <- 0 
for (i in 2:n) {
  CasesL$incr_cases[i] <- (CasesL$cases[i]-CasesL$cases[i-1])
}

#Graph this information as shown below 
p <- ggplot(data = CasesL)
p + geom_line(color = "blue", mapping = aes(x = date,
                                            y = incr_cases),
                                            group = 1)+
  labs(x= "Date", y = "New Cases Reported",
       title = "COVID 19 CASES in Lehigh, PA")


