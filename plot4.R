# Set the local file path below
setwd("give local file path here")
all_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", check.names = FALSE, quote = '\"', comment.char = "", stringsAsFactors = FALSE)
data_plt <- subset(all_data,Date %in% c("1/2/2007","2/2/2007" ))
data_plt$Date <- as.Date(data_plt$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(data_plt$Date),data_plt$Time)
data_plt$DateTime <- as.POSIXct(date_time)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_plt, {
        plot(Global_active_power~DateTime, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~DateTime, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~DateTime, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 0.2,x.intersp = 0.2,xjust = 1, yjust = 1)
        plot(Global_reactive_power~DateTime, type="l", 
             ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()