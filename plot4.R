data = read.table('household_power_consumption.txt', nrows=69516, sep=';', header=TRUE)
data = subset(data, (data$Date == '1/2/2007' | data$Date == '2/2/2007'))
png(file = "plot4.png", width = 480, height = 480, units = "px")

s1 = as.numeric(as.character(data$Sub_metering_1), na.rm=TRUE)
s2 = as.numeric(as.character(data$Sub_metering_2), na.rm=TRUE)
s3 = as.numeric(as.character(data$Sub_metering_3), na.rm=TRUE)
gap = as.numeric(as.character(data$Global_active_power), na.rm=TRUE)
  
par(mfrow = c(2, 2))
with(data, {
  plot(gap, type = 'l', xaxt='n', ylab = 'Global Active Power', xlab = '')
  axis(1, at = c(0, 1450, 2900), labels=c("Thu","Fri","Sat"))
  
  plot(as.numeric(as.character(Voltage)), type = 'l', xaxt='n', ylab = 'Voltage', xlab = 'datetime')
  axis(1, at = c(0, 1450, 2900), labels=c("Thu","Fri","Sat"))
  
  plot(s1, type = 'l', xaxt='n', ylab = 'Energy sub metering', xlab = '', col = "Black")
  lines(s2, col = "Red")
  lines(s3, col = "Blue")
  axis(1, at = c(0, 1450, 2900), labels=c("Thu","Fri","Sat"))
  legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0, bg = "transparent")

  plot(as.numeric(as.character(Global_reactive_power)), type = 'l', xaxt='n',
       ylab = 'Global_reactive_power', xlab = 'datetime')
  axis(1, at = c(0, 1450, 2900), labels=c("Thu","Fri","Sat"))
  
})

dev.off()

# # plot 4 code
# 
# # read & subset data
# data = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings= "?")
# subset_indices = grep("^1/2/2007|^2/2/2007", data$Date)
# datatouse = data[subset_indices,]
# datatouse$DateTime = paste(datatouse$Date, datatouse$Time)
# datatouse$Date = as.Date(datatouse$Date, format = "%d/%m/%Y")
# datatouse$DateTime = strptime(datatouse$DateTime, format = "%d/%m/%Y %H:%M:%S")
# 
# # plot data
# png(filename="plot4.png", height=480, width=480)
# opar = par(no.readonly = TRUE)
# par(mfcol=c(2,2))
# 
# with(datatouse, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
# 
# with(datatouse, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
# with(datatouse, lines(DateTime, Sub_metering_2, col="red"))
# with(datatouse, lines(DateTime, Sub_metering_3, col="blue"))
# legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
# 
# with(datatouse, plot(DateTime, Voltage, type="l"))
# 
# with(datatouse, plot(DateTime, Global_reactive_power, type="l"))
# 
# par(opar)
# dev.off()