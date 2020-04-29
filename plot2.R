Data <- read.csv("C:/Users/Administrator/Documents/RFile/coursera/Exploratory Data Analsys/Data/household_power_consumption.txt",header =TRUE, sep =";" ,stringsAsFactors=FALSE, dec=".")
sub <- subset(Data, Date == "1/2/2007" | Date == "2/2/2007")


sub$datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub$gpa <- as.numeric(sub$Global_active_power)
png("plot2.png", width=480, height=480)
plot(sub$datetime, sub$gpa, type="l", xlab="", ylab="Global Active Power (kW)")
dev.off()


