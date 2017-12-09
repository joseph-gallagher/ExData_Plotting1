#Running this script in the same directory as the data file
#"household_power_consumption.txt" will produce plot1.jpg, 
#a histogram of the global power consumption as sampled in minute intervals.

library(data.table)

#Here we read in only the data of the two days we care about, having found
#the position of this data with other code:

two_days <- fread("household_power_consumption.txt", skip = 66637, nrows = 2880)
sample <- fread("household_power_consumption.txt", nrows=3)

names(two_days) <- names(sample)

power <- as.numeric(two_days$Global_active_power)
hist(power, col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()


