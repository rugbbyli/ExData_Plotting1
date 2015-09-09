dat = read.table("plot/household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
dat = dat[dat$Date == '1/2/2007' | dat$Date == '2/2/2007',]
dat$DateTime = strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")


par(mfrow = c(2,2))

plot(dat$DateTime, dat$Global_active_power, type = 'l', xlab='', ylab='Global Active Power')

plot(dat$DateTime, dat$Voltage, type = 'l', xlab='datetime', ylab='Voltage')

plot(dat$DateTime, dat$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
points(dat$DateTime, dat$Sub_metering_1,type = 'l')
points(dat$DateTime, dat$Sub_metering_2,type = 'l',col='red')
points(dat$DateTime, dat$Sub_metering_3,type = 'l',col='blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black','red','blue'), cex = 0.8, y.intersp = 1, bty = 'n')

plot(dat$DateTime, dat$Global_reactive_power, type = 'l', xlab='datetime', ylab='Global_reactive_power')


dev.copy(png, width = 480, height = 480, file = 'plot/plot4.png')
dev.off()