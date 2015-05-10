#=======
# *** EXPLORATORY DATA ANALYSIS: COURSE PROJECT 1 ***
#=======
# 
# 1. Read data
housePowCon <- read.csv("~/Documents/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
# 2. Define variables in time and date formats
housePowCon$Time <- strptime(paste(housePowCon$Date,housePowCon$Time),"%d/%m/%Y %H:%M:%S")
housePowCon$Date <- as.Date(housePowCon$Date,"%d/%m/%Y")
# 3. Subset data for specified dates
thedates <- as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")
housePowCon[(housePowCon$Date >= thedates[1] & housePowCon$Date <= thedates[2]),] -> housePowCon
# 4. Define as numeric variables to plot
housePowCon$Global_active_power <- as.numeric(housePowCon$Global_active_power)
housePowCon$Sub_metering_1 <- as.numeric(housePowCon$Sub_metering_1)
housePowCon$Sub_metering_2 <- as.numeric(housePowCon$Sub_metering_2)
housePowCon$Voltage <- as.numeric(housePowCon$Voltage)
housePowCon$Global_reactive_power <- as.numeric(housePowCon$Global_reactive_power)
#=======
#
# 5. Generate plots
setwd("~/Documents/Coursera/Exploratory_Data_Analysis/ExData_Plotting1")
png(filename = "plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(housePowCon$Time,housePowCon$Global_active_power,main="",ylab="Global Active Power (kilowatts)",type="l",xlab="")
plot(housePowCon$Time,housePowCon$Voltage,main="",ylab="Voltage",xlab="datetime",type="l")
plot(housePowCon$Time,housePowCon$Sub_metering_1,ylab="Energy sub metering",xlab="",main="",type="l")
lines(housePowCon$Time,housePowCon$Sub_metering_2,col="red")
lines(housePowCon$Time,housePowCon$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub-metering_1","Sub-metering_2","Sub-metering_3"),lty=c(1,1,1),bty="n")
plot(housePowCon$Time,housePowCon$Global_reactive_power,ylab="Global Reactive Power",main="",xlab="datetime",type="l")
dev.off()