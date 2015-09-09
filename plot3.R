dat = read.table("plot/household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
dat = dat[dat$Date == '1/2/2007' | dat$Date == '2/2/2007',]
dat$DateTime = strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")


plot(dat$DateTime, dat$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
points(dat$DateTime, dat$Sub_metering_1,type = 'l')
points(dat$DateTime, dat$Sub_metering_2,type = 'l',col='red')
points(dat$DateTime, dat$Sub_metering_3,type = 'l',col='blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c('black','red','blue'), cex = 0.6, y.intersp = 1)

dev.copy(png, width = 480, height = 480, file = 'plot/plot3.png')
dev.off()