#Running this script in the same directory as the data file
#"household_power_consumption.txt" will produce plot3.jpg, 
#a plot of the power consumption (broken along 3 substations)
#as a function of time.

library(data.table)

#Here we read in only the data of the two days we care about, having found
#the position of this data with other code:

two_days <- fread("household_power_consumption.txt", skip = 66637, nrows = 2880)
sample <- fread("household_power_consumption.txt", nrows=3)

names(two_days) <- names(sample)

sub_1 <- as.numeric(two_days$Sub_metering_1)
sub_2 <- as.numeric(two_days$Sub_metering_2)
sub_3 <- as.numeric(two_days$Sub_metering_3)

plot(sub_1, type = "n", ylab = "Energy sub metering", xaxt = "n", xlab = "")
points(sub_1, type = "l", col = "black")
points(sub_2, type = "l", col = "red")
points(sub_3, type = "l", col = "blue")
legend("topright", xjust=1, cex = 0.75, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot3.png")
dev.off()
