## This is the source code for third plot. 
## The third plot is line plot for Energy sub-metering

# Read input data
flnm <- "household_power_consumption.txt"
pwr_cnsp <- read.table(flnm, header=TRUE, sep=";")

# Extract data only for dates 2007-02-01 and 2007-02-02
pwr_cnsp_feb <- subset(pwr_cnsp, pwr_cnsp$Date=="1/2/2007" | pwr_cnsp$Date=="2/2/2007")

# Convert Date into appropriate format
pwr_cnsp_feb$Date <- as.Date(pwr_cnsp_feb$Date, format="%d/%m/%Y")

# Transform Time into type of object POSIXlt
pwr_cnsp_feb$Time <- strptime(pwr_cnsp_feb$Time, format="%H:%M:%S")
pwr_cnsp_feb[1:1440, "Time"] <- format(pwr_cnsp_feb[1:1440, "Time"], "2007-02-01 %H:%M:%S")
pwr_cnsp_feb[1441:2880, "Time"] <- format(pwr_cnsp_feb[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# Get values of energy sub-metering No. 1, 2 and 3
submet1 <- as.numeric(pwr_cnsp_feb$Sub_metering_1)
submet2 <- as.numeric(pwr_cnsp_feb$Sub_metering_2)
submet3 <- as.numeric(pwr_cnsp_feb$Sub_metering_3)

# Set the parameters for plot
png("plot3.png", width=480, height=480)

# Draw basic plot for one line graph and then add additional lines
plot(pwr_cnsp_feb$Time, submet1, type="l", xlab="", ylab="Energy sub metering")
lines(pwr_cnsp_feb$Time, submet2, type="l", col="red")
lines(pwr_cnsp_feb$Time, submet3, type="l", col="blue")

# Add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()