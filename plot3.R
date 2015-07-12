#read dataset
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE, dec=".")
#subset the data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# strip data and time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plot data
png("plot3.png",height=480,width=480)
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
