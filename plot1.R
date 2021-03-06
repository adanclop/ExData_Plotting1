library(lubridate)
data<-read.delim("data.txt", sep = ";") 
data$Date <- strptime(data$Date, "%d/%m/%Y") 
data<-subset(data, Date=="2007-02-01" | Date=="2007-02-02") 
data$Time <- hms(data$Time)
data$Global_active_power<- as.numeric(data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global active power", 
     xlab = "Global active power (kilowatts)")
dev.off()
