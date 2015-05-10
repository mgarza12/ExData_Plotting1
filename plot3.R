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
housePowCon$Sub_metering_1 <- as.numeric(housePowCon$Sub_metering_1)
housePowCon$Sub_metering_2 <- as.numeric(housePowCon$Sub_metering_2)
#=======
#
# 5. Generate plots
setwd("~/Documents/Coursera/Exploratory_Data_Analysis/ExData_Plotting1")
png(filename = "plot3.png",width = 480,height = 480)
plot(housePowCon$Time,housePowCon$Sub_metering_1,ylab="Energy sub metering",xlab="",main="",type="l")
lines(housePowCon$Time,housePowCon$Sub_metering_2,col="red")
lines(housePowCon$Time,housePowCon$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub-metering_1","Sub-metering_2","Sub-metering_3"),lty=c(1,1,1))
dev.off()