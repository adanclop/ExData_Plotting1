library(lubridate)
data<-read.delim("data.txt", sep = ";") 
data$Date <- strptime(data$Date, "%d/%m/%Y") 
data<-subset(data, Date=="2007-02-01" | Date=="2007-02-02") 
data$Global_active_power<- as.numeric(data$Global_active_power)
data$Global_reactive_power<- as.numeric(data$Global_reactive_power)
data$time2 <- paste(data$Date, data$Time)
data$time2 <- ymd_hms(data$time2)
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(data$time2,data$Global_active_power,
     ylab = "Global active power (kilowatts)", type="l", xlab="")
plot(data$time2,data$Sub_metering_1,
     ylab = "Energy sub metering", type="l", xlab="")
lines(data$time2,data$Sub_metering_2, col="red")
lines(data$time2,data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1",
         "Sub_metering_2","Sub_metering_3"), lwd = c(1,1,1))
plot(data$time2,data$Voltage,
     ylab = "Voltage", type="l", xlab="datetime")
plot(data$time2,data$Global_reactive_power, type="l", xlab="datetime",
     ylab = "Global_reactive_power")
dev.off()
