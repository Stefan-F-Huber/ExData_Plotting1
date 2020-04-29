#Daten einlesen
Data <- read.csv("C:/Users/Administrator/Documents/RFile/coursera/Exploratory Data Analsys/Data/household_power_consumption.txt",header =TRUE, sep =";" ,stringsAsFactors=FALSE, dec=".")



sub <- subset(Data, Date == "1/2/2007" | Date == "2/2/2007")
sub$gap <- as.numeric(sub$Global_active_power)
sub$gap <- sub$gap[-which(is.na(sub$gap))]


png("plot1.png", width=480, height=480)
hist(sub$gap, col="red", main="Global Active Power", xlab="Global Active Power (kW)")
dev.off()

