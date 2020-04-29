Data <- read.csv("C:/Users/Administrator/Documents/RFile/coursera/Exploratory Data Analsys/Data/household_power_consumption.txt",header =TRUE, sep =";" ,stringsAsFactors=FALSE, dec=".")
sub <- subset(Data, Date == "1/2/2007" | Date == "2/2/2007")

#str(subSetData)
sub$datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub$gpa <- as.numeric(sub$Global_active_power)
sub$subMetering1 <- as.numeric(sub$Sub_metering_1)
sub$subMetering2 <- as.numeric(sub$Sub_metering_2)
sub$subMetering3 <- as.numeric(sub$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(sub$datetime, sub$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(sub$datetime, sub$subMetering2, type="l", col="red")
lines(sub$datetime, sub$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

