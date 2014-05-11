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
