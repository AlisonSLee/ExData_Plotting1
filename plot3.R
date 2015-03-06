# Coursera Exploratory Data Analytics - Week 1
# Project 1 
# Read in Electric Power Consumption data and keep data for just the two days 1st & 2nd Feb 2007
# Create a png file containing Plot 3
#   This is a line chart showing Energy sub metering on y axis and date-time of measurement on x axis
#   Each Sub metering group is shown in a different color

power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",colClasses=c(rep("character",2), rep("numeric",7)))
feb<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
feb$datetime<-paste(feb$Date,feb$Time, sep=" ")
feb$datetime <- as.POSIXct(feb$datetime, format = "%d/%m/%Y %H:%M:%S")
png(filename="plot3.png",width=480,height=480,units="px",bg="white")
plot(feb$datetime,feb$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(feb$datetime,feb$Sub_metering_1)
lines(feb$datetime,feb$Sub_metering_2,col="red")
lines(feb$datetime,feb$Sub_metering_3,col="blue")
# lty=c(1,1,1) ensures the legend 'symbol' is a line
# cex=0.75 reduces the size of the legend (& the text within it) to 75% of the default
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),cex=0.75)
dev.off()