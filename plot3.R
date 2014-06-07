install.packages("sqldf")
library(sqldf)

file <- "exdata-data-household_power_consumption//household_power_consumption.txt"

data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Energy submetering", xlab="")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
,lty=c(1,1,1)
,lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

dev.copy(png, file = "plot3.png")
dev.off()