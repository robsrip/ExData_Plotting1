install.packages("sqldf")
library(sqldf)

file <- "exdata-data-household_power_consumption//household_power_consumption.txt"

data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

##First Plot
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Second Plot
plot(data$DateTime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")


##Third Plot
plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy submetering", xlab="")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lty=c(1,1,1)
       ,lwd=c(2.5,2.5,2.5),col=c("black","red","blue"), cex=0.8)

##Fourth Plot
plot(data$DateTime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, file = "plot4.png")
dev.off()