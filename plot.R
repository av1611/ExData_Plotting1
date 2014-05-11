# Setting up the working directory
setwd("~/Dropbox/edu/coursera/DATA_SPECIALIZATION/exdata/ExData_Plotting1")

# Loading the data
data <- read.csv("~/coursera/exdata-002/project1/household_power_consumption.txt",
                 sep = ";", na.strings = "?")
# Creating indeces for dates of interest
datesOfInterest <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
# Subsetting the desired chunk of data
dataOfInterest <- subset(data, datesOfInterest)
# A little fun with locales
Sys.setlocale(category = "LC_TIME", locale = "C")
Sys.setlocale(category = "LC_ALL", locale = "C")
# Converting data
dataOfInterest$Date  <- as.Date(x,"%d/%m/%Y")

# Plots drawing section
# Plot 1
# Opening the graphical device, setting
png(filename = "plot1.png", width = 480, height = 480)
par(mfrow = c(1, 1))
hist(dataOfInterest$Global_active_power,
     main = "Global Active Power", col = "red",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
# Closing the graphics device
dev.off() # closes graphic device

# Plot 2
# Opening the graphical device
png(filename = "plot2.png", width = 480, height = 480)

plot(dataOfInterest$Global_active_power,
     pch=26, xaxt="n",
     ylab="Global Active Power (kilowatts)", xlab="")
# Adding a line
lines(dataOfInterest$Global_active_power)
# Adding labels to X axe
axis(1, at = c(0, 1441, 2900), labels = c("Thu", "Fri", "Sat"))
dev.off()

# Plot 3
# Opening the graphical device
png(filename = "plot3.png", width = 480, height = 480)
plot(dataOfInterest$Sub_metering_1,
     pch = 26, xaxt = "n",
     ylab = "Energy sub metering", xlab = "")
lines(dataOfInterest$Sub_metering_1, type = "s")
points(dataOfInterest$Sub_metering_2, pch = 26)
# Adding a red line
lines(dataOfInterest$Sub_metering_2, type = "s", col = "red")
# A scatter plot of invisible dots
points(dataOfInterest$Sub_metering_3, pch = 26)
# Adding a blue line
lines(dataOfInterest$Sub_metering_3, type = "s", col = "blue")
# Adding labels to X axe
axis(1, at = c(0, 1441, 2900), labels = c("Thu", "Fri", "Sat"))
# Adding a legend to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))
dev.off()

# Plot 4
# Opening graphical device
png(filename = "plot4.png", width = 480, height = 480)
# Making a canvas 2x2
par(mfrow=c(2,2))
# Drawing a scatterplot of invisible dots
plot(dataOfInterest$Global_active_power, xaxt = "n", pch = 26,
     ylab = "Global Active Power", xlab = "")
# Adding a line
lines(dataOfInterest$Global_active_power)
# Adding labels to X axe
axis(1, at=c(0, 1441, 2900), labels = c("Thu", "Fri", "Sat"))

plot(dataOfInterest$Voltage, pch = 26, xaxt = "n", ylab = "Voltage", xlab = "datetime")
lines(dataOfInterest$Voltage)
axis(1, at = c(0, 1441, 2900), labels = c("Thu", "Fri", "Sat"))

plot(dataOfInterest$Sub_metering_1, xaxt = "n", pch = 26, ylab = "Energy sub metering", xlab = "")
lines(dataOfInterest$Sub_metering_1, type = "s")
points(dataOfInterest$Sub_metering_2, pch = 26)
lines(dataOfInterest$Sub_metering_2, type = "s", col = "red")
points(dataOfInterest$Sub_metering_3, pch = 26)
lines(dataOfInterest$Sub_metering_3, type = "s", col = "blue")
axis(1, at = c(0, 1441, 2900), labels = c("Thu", "Fri", "Sat"))
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), lwd = c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))

with(dataOfInterest)
lines(dataOfInterest$Global_reactive_power)
axis(1, at = c(0, 1441, 2900), labels = c("Thu", "Fri", "Sat"))

dev.off()