data = read.table('household_power_consumption.txt', nrows=69516, sep=';', header=TRUE)
data = subset(data, (data$Date == '1/2/2007' | data$Date == '2/2/2007'))
png(file = "plot3.png", width = 480, height = 480, units = "px")

s1 = as.numeric(as.character(data$Sub_metering_1), na.rm=TRUE)
s2 = as.numeric(as.character(data$Sub_metering_2), na.rm=TRUE)
s3 = as.numeric(as.character(data$Sub_metering_3), na.rm=TRUE)

plot(s1, type = 'l', xaxt='n', ylab = 'Energy sub metering', xlab = '', col = "Black")
lines(s2, col = "Red")
lines(s3, col = "Blue")
axis(1, at = c(0, 1450, 2900), labels=c("Thu","Fri","Sat"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()