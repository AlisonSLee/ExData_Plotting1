# Coursera Exploratory Data Analytics - Week 1
# Project 1 
# Read in Electric Power Consumption data and keep data for just the two days 1st & 2nd Feb 2007
# Create a png file containing Plot 4
#      This plot file will show 4 different plots on a single page

power<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";",colClasses=c(rep("character",2), rep("numeric",7)))
feb<-power[(power$Date=="1/2/2007" | power$Date=="2/2/2007" ),]
feb$datetime<-paste(feb$Date,feb$Time, sep=" ")
feb$datetime <- as.POSIXct(feb$datetime, format = "%d/%m/%Y %H:%M:%S")
png(filename="plot4.png",width=480,height=480,units="px",bg="white")

# Want 4 plots per page i.e. 2 rows & 2 columns, Want text in margins (i.e. labels) to be smaller
# Adjust margins so they fit nicely
par(mfrow=c(2,2),mex=0.55,mar=c(6,5,5,2))

# Draw the first plot (which is the same as was created in plot2.R) - this will go in top left
plot(feb$datetime,feb$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(feb$datetime,feb$Global_active_power)

# Draw the 2nd plot - this will go in top right
plot(feb$datetime,feb$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(feb$datetime,feb$Voltage)

# Draw the 3rd plot (which is the same as was created in plot3.R) - this will go in bottom left
plot(feb$datetime,feb$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(feb$datetime,feb$Sub_metering_1)
lines(feb$datetime,feb$Sub_metering_2,col="red")
lines(feb$datetime,feb$Sub_metering_3,col="blue")
# lty=c(1,1,1) ensures the legend 'symbol' is a line
# bty="n" removes the box around the legend
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),cex=0.58,bty="n")

# Draw the 4th plot - this will go in bottom right
plot(feb$datetime,feb$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(feb$datetime,feb$Global_reactive_power)
dev.off()