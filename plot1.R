#read dataset
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",stringsAsFactors=FALSE, dec=".")
#subset the data
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# strip data and time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plot data
png("plot1.png")
hist(data$Global_active_power, main = paste('Global Active power'), xlab = 'Global Active Power (kilowatts)', col='red')
dev.off()
