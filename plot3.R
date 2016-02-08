# Plot 3 - Using Base Package

# File reads data corresponding to 01/02/2007 and 02/02/2007
# Skip amount calculated as 396+(((15+31)*(60*24))) -- Minutes
setwd("/Users/GeoffMarino/jhu datascience/exploratory/")
data <- read.table("/Users/GeoffMarino/jhu datascience/exploratory/household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data2 <- data
DateTime_init <- paste(data2$Date, data2$Time)
data2$DateTime <- strptime(DateTime_init, format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

with(data2, plot(DateTime, Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering"))
with(data2, lines(DateTime, Sub_metering_1))
with(data2, lines(DateTime, Sub_metering_2, col = "red"))
with(data2, lines(DateTime, Sub_metering_3, col = "blue"))

legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, lty = 1)
dev.off()