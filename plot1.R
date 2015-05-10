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
#=======
#
# 5. Generate plots
setwd("~/Documents/Coursera/Exploratory_Data_Analysis/ExData_Plotting1")
png(filename = "plot1.png",width = 480,height = 480)
hist(housePowCon$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()
