# Coursera Exploratory Data Analytics - Week 1
# Project 1 
# Read in Electric Power Consumption data and keep data for just the two days 1st & 2nd Feb 2007
# Create a png file containing Plot 1
#      This is a red histogram of Global Active Power

power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",colClasses=c(rep("character",2), rep("numeric",7)))
feb<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
png(filename="plot1.png",width=480,height=480,units="px",bg="white")
hist(feb$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()