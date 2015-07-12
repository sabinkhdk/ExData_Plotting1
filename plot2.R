#read dataset
data <- read.table("./household_power_consumption.txt", header=T, sep=";", na.strings="?",stringsAsFactors=FALSE, dec=".")
#subset the data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# strip data and time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plot data
png("plot2.png", width=480, height=480)
plot(x=datetime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
