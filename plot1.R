##########################################################################################
### Download data
##########################################################################################
setwd("C:/Users/Sarah Lynn/Desktop/Self Study/Coursera DS JH - EDA/Week 1 project")
wd_loc <- getwd()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              paste(wd_loc,"/project_data.zip",sep="") )

unzip(zipfile="project_data.zip")

power_data <- read.delim(paste(wd_loc,"/household_power_consumption.txt",sep=""),header=TRUE,sep=";")

library(dplyr)

##########################################################################################
### Create Plots
##########################################################################################
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")
power_data1 <- power_data %>% filter( Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )
power_data1$Global_active_power <- as.numeric(power_data1$Global_active_power)

########Plot 1. histogram of Global Active Power (Kilowats)
png("plot1.png",width=480,height=480)
hist(power_data1$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
