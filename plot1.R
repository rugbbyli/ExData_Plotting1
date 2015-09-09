dat = read.table("plot/household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
dat = dat[dat$Date == '1/2/2007' | dat$Date == '2/2/2007',]
dat$DateTime = strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S")


hist(dat$Global_active_power, col = 'red', main = 'Global Active Power', xlab='Global Active Power (kilowatts)')
dev.copy(png, width = 480, height = 480, file = 'plot/plot1.png')
dev.off()