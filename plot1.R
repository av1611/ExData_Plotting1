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
# Opening the graphical device, setting width and height
png(filename = "plot1.png", width = 480, height = 480)
par(mfrow = c(1, 1))
hist(dataOfInterest$Global_active_power,
     main = "Global Active Power", col = "red",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
# Closing the graphics device
dev.off()
