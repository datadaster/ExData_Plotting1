# Load data file
data <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

# Filter data and create a subset
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Create a date and time vector
dateAndTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

# Create a numeric vectors in base to Global Active Power and Sub Metering variables
activePower <- as.numeric(subdata$Global_active_power)
sub_Metering_1 <- as.numeric(subdata$Sub_metering_1)
sub_Metering_2 <- as.numeric(subdata$Sub_metering_2)
sub_Metering_3 <- as.numeric(subdata$Sub_metering_3)

# Create the graphic in PNG format
png("plot3.png", width=480, height=480)
plot(dateAndTime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateAndTime, sub_Metering_2, type="l", col="red")
lines(dateAndTime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

# Remove variables in order to free memory
rm(data)
rm(subdata)
rm(activePower)
rm(dateAndTime)
rm(sub_Metering_1)
rm(sub_Metering_2)
rm(sub_Metering_3)