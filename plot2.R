install.packages("sqldf")
library(sqldf)

file <- "exdata-data-household_power_consumption//household_power_consumption.txt"

data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "plot2.png")
dev.off()