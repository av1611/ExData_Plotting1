# Setting up the working directory
setwd("~/Dropbox/edu/coursera/DATA_SPECIALIZATION/exdata/ExData_Plotting1")

# Loading the data
data <- read.table("~/coursera/exdata-002/project1/household_power_consumption.txt",
                   sep = ';', header = T, na.strings = '?',
                   colClasses = c('character', 'character',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric', 'numeric'))

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Subsetting the desired chunk of data
data <- subset(data,
               as.Date(DateTime) >= as.Date("2007-02-01") &
               as.Date(DateTime) <= as.Date("2007-02-02"))

# Plots drawing section
# Plot 2
# Opening the graphical device
png(filename = "plot2.png", width = 480, height = 480)
par(mfrow = c(1, 1))

plot(data$DateTime, data$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power (kilowatts)")

# Draw the line
lines(data$DateTime, data$Global_active_power)

# Closing the graphics device
dev.off()
