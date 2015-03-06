# Coursera Exploratory Data Analytics - Week 1
# Project 1 
# Read in Electric Power Consumption data and keep data for just the two days 1st & 2nd Feb 2007
# Create a png file containing Plot 2
#      This is a line chart showing Global Active Power on y axis and date-time of measurement on x axis

power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",colClasses=c(rep("character",2), rep("numeric",7)))
feb<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
feb$datetime<-paste(feb$Date,feb$Time, sep=" ")
feb$datetime <- as.POSIXct(feb$datetime, format = "%d/%m/%Y %H:%M:%S")
png(filename="plot2.png",width=480,height=480,units="px",bg="white")
plot(feb$datetime,feb$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(feb$datetime,feb$Global_active_power)
dev.off()