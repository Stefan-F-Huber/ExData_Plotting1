Data <- read.csv("C:/Users/Administrator/Documents/RFile/coursera/Exploratory Data Analsys/Data/household_power_consumption.txt",header =TRUE, sep =";" ,stringsAsFactors=FALSE, dec=".")
sub <- subset(Data, Date == "1/2/2007" | Date == "2/2/2007")


attach(sub)
sub$datetime <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub$gpa <- as.numeric(Global_active_power)
sub$grp <- as.numeric(Global_reactive_power)
sub$vol <- as.numeric(Voltage)
sub$subMetering1 <- as.numeric(Sub_metering_1)
sub$subMetering2 <- as.numeric(Sub_metering_2)
sub$subMetering3 <- as.numeric(Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, sub$gpa, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, sub$vol, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub$subMetering2, type="l", col="red")
lines(datetime, sub$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, sub$grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
