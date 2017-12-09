#Running this script in the same directory as the data file
#"household_power_consumption.txt" will produce plot2.jpg, 
#a plot of the global power consumption as a function of time.

library(data.table)

#Here we read in only the data of the two days we care about, having found
#the position of this data with other code:

two_days <- fread("household_power_consumption.txt", skip = 66637, nrows = 2880)
sample <- fread("household_power_consumption.txt", nrows=3)

names(two_days) <- names(sample)

power <- as.numeric(two_days$Global_active_power)
plot(power, xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
axis(side = 1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))
dev.copy(png, file = "plot2.png")
dev.off()
