data = read.table('household_power_consumption.txt', nrows=69516, sep=';', header=TRUE)
data = subset(data, (data$Date == '1/2/2007' | data$Date == '2/2/2007'))
png(file = "plot2.png", width = 480, height = 480, units = "px")

gap = as.numeric(as.character(data$Global_active_power), na.rm=TRUE)

plot(gap, type = 'l', xaxt='n', ylab = 'Global Active Power (kilowatts)', xlab = '')
axis(1, at = c(0, 1450, 2900), labels=c("Thu","Fri","Sat"))

dev.off()

# # read & subset data
# data = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings= "?")
# subset_indices = grep("^1/2/2007|^2/2/2007", data$Date)
# datatouse = data[subset_indices,]
# datatouse$DateTime = paste(datatouse$Date, datatouse$Time)
# datatouse$Date = as.Date(datatouse$Date, format = "%d/%m/%Y")
# datatouse$DateTime = strptime(datatouse$DateTime, format = "%d/%m/%Y %H:%M:%S")
# 
# # plot data
# png(filename="plot1.png", height=480, width=480)
# with(datatouse, hist(Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
# dev.off()