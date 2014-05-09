data = read.table('household_power_consumption.txt', nrows=69516, sep=';', header=TRUE)
data = subset(data, (data$Date == '1/2/2007' | data$Date == '2/2/2007'))
png(file = "plot2.png", width = 480, height = 480, units = "px")

gap = as.numeric(as.character(data$Global_active_power), na.rm=TRUE)

plot(gap, type = 'l', xaxt='n', ylab = 'Global Active Power (kilowatts)', xlab = '')
axis(1, at = c(0, 1450, 2900), labels=c("Thu","Fri","Sat"))

dev.off()