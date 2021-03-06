library(dplyr)
library(tidyr)
library(data.table)
library(lubridate)
# setting the working directory
getwd()
setwd("~/Documents/OneDrive/Data science/Assignments/week 1 exploring data")

# STEP 1: READ DATA and FILTER OUT DATES TO BE USED, 2007-02-01 and 2007-02-02
filename <- "household_power_consumption.txt"
d <- fread(filename, sep =";", na.strings = "?")

d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- d %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%
        mutate(tid = ymd_hms(paste(Date,Time, sep = " ")))

# STEP 2 - Start plotting

## Plot 2
png('plot2.png',width = 480, height = 480, units = "px")
plot(d$tid, as.numeric(d$Global_active_power), xlab ="", ylab ="Global Active Power (kilowatts)", type ="l")
dev.off()

