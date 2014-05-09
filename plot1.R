data = read.table('household_power_consumption.txt', nrows=69516, sep=';', header=TRUE)
data = subset(data, (data$Date == '1/2/2007' | data$Date == '2/2/2007'))
png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(as.numeric(as.character(data$Global_active_power)),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "Red")
dev.off()