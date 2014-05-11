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
# Plot 1
# Opening the graphical device
png(filename = "plot1.png", width = 480, height = 480)
par(mfrow = c(1, 1))

hist(data$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Closing the graphics device
dev.off()
