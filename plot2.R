dat = read.table("plot/household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
dat = dat[dat$Date == '1/2/2007' | dat$Date == '2/2/2007',]
dat$DateTime = strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")


plot(dat$DateTime, dat$Global_active_power, type = 'l', xlab='', ylab='Global Active Power (kilowatts)')
dev.copy(png, width = 480, height = 480, file = 'plot/plot2.png')
dev.off()