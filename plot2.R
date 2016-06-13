# Load data file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

# Filter data and create a subset
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a date and time vector
dateAndTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

# Create a numeric vector in base to Global Active Power variable
activePower <- as.numeric(subdata$Global_active_power)

# Create the graphic in PNG format
png("plot2.png", width=480, height=480)
plot(dateAndTime, activePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# Remove variables in order to free memory
rm(data)
rm(subdata)
rm(activePower)
rm(dateAndTime)