install.packages("sqldf")
library(sqldf)

file <- "exdata-data-household_power_consumption//household_power_consumption.txt"

data <- read.csv.sql(file, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";")

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()