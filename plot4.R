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
## Plot 4

png('plot4.png',width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(d$tid, as.numeric(d$Global_active_power), xlab ="", ylab ="Global Active Power", type ="l")

plot(d$tid, as.numeric(d$Voltage),  ylab ="Voltage", xlab ="datetime", type ="l")

plot(d$tid, as.numeric(d$Sub_metering_1), xlab ="", ylab ="Energy Sub metering", type ="l")
lines(d$tid, as.numeric(d$Sub_metering_2), col ="red")
lines(d$tid, as.numeric(d$Sub_metering_3), col ="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = TRUE, col = c("black", "red", "blue"), xjust = 0, text.width =strwidth("Sub_metering_1"))


plot(d$tid, as.numeric(d$Global_reactive_power),  ylab ="Voltage", xlab ="datetime", type ="l")

dev.off()