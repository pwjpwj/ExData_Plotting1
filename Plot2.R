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
plot(xx$Datetime,xx$Global_active_power, type="l", xlab=" ",ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()