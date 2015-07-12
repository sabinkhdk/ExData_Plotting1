#read dataset
data <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=FALSE, dec=".")
#subset the data from 1/2/2007-2/2/2007
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# strip date and time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plot data
png("plot4.png",height=480,width=480)
# Set 2x2 matrix for figures
par(mfrow=c(2,2))
plot(x=datetime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)
plot(x=datetime, y=data$Voltage, type="l", xlab="", ylab="Voltage")
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="o",lwd=2.5, col=c("black", "red", "blue"))
plot(x=datetime, y=data$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")
dev.off()
