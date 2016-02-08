# Minutes  = 396+(((15+30)*(60*24)))

data <- read.table("/Users/GeoffMarino/jhu datascience/household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Plot 1 - Using Base Package
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
