# Load data file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

# Filter data and create a subset
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a date and time vector
dateAndTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

# Create a numeric vectors
activePower <- as.numeric(subdata$Global_active_power)
reactivePower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
sub_Metering_1 <- as.numeric(subdata$Sub_metering_1)
sub_Metering_2 <- as.numeric(subdata$Sub_metering_2)
sub_Metering_3 <- as.numeric(subdata$Sub_metering_3)

# Create the graphics in PNG format
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(dateAndTime, activePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateAndTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateAndTime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateAndTime, sub_Metering_2, type="l", col="red")
lines(dateAndTime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateAndTime, reactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

# Remove variables in order to free memory
rm(data)
rm(subdata)
rm(activePower)
rm(reactivePower)
rm(voltage)
rm(dateAndTime)
rm(sub_Metering_1)
rm(sub_Metering_2)
rm(sub_Metering_3)