#Running this script in the same directory as the data file
#"household_power_consumption.txt" will produce plot4.jpg, 
#a collection of 4 plots.

library(data.table)

#Here we read in only the data of the two days we care about, having found
#the position of this data with other code:

two_days <- fread("household_power_consumption.txt", skip = 66637, nrows = 2880)
sample <- fread("household_power_consumption.txt", nrows=3)

names(two_days) <- names(sample)

#Collect the quantities we will graph

power <- as.numeric(two_days$Global_active_power)
sub_1 <- as.numeric(two_days$Sub_metering_1)
sub_2 <- as.numeric(two_days$Sub_metering_2)
sub_3 <- as.numeric(two_days$Sub_metering_3)
voltage <- as.numeric(two_days$Voltage)
reac_power <- as.numeric(two_days$Global_reactive_power)

par(mfrow = c(2,2))

#First plot

plot(power, xaxt = "n", xlab = "", ylab = "Global Active Power", type = "l")
axis(side = 1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))

#Second plot

plot(voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

#Third plot

plot(sub_1, type = "n", ylab = "Energy sub metering", xaxt = "n", xlab = "")
points(sub_1, type = "l", col = "black")
points(sub_2, type = "l", col = "red")
points(sub_3, type = "l", col = "blue")
legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

#Fourth plot

plot(reac_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot4.png")
dev.off()

par(mfrow = c(1,1))

