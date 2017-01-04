#How to make the first plot

#Set the working directory
setwd("C:/Users/user/Dropbox/Trabajo/Courses")

#Load the needed packages
library("data.table", lib.loc="~/R/win-library/3.3")

#read in the data and selecting time frame
x<-fread("household_power_consumption.txt", header=TRUE)
x<-as.data.frame(x)
x$Datetime<-strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
x$Date<-as.Date(x$Date, format="%d/%m/%Y")
xx<-x[x$Date=="2007-02-01" | x$Date=="2007-02-02", ]

#Making the plot
par(mfrow=c(1,1))
plot(xx$Datetime, xx$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(xx$Datetime, xx$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(xx$Datetime, xx$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()