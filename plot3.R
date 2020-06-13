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


power_data1$Newdate <- with(power_data1, as.POSIXct(paste(power_data1$Date, power_data1$Time), format="%Y-%m-%d %H:%M:%S"))
#########Plot 3. Energy Sub Metering w/legend
png("plot3.png",width=480,height=480)
plot(power_data1$Newdate,power_data1$Sub_metering_1,type="l",col="black",xlab="",ylab="Enegery sub metering")
lines(power_data1$Newdate,power_data1$Sub_metering_2,type="l",col="red")
lines(power_data1$Newdate,power_data1$Sub_metering_3,type="l",col="blue")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))       
dev.off()
