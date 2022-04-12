## This is the source code for forth plot. 
## The forth plot is combination of multiple plots

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

# Get data for Global_active_power for given 2 dates in Feb 2007
gl_act_pwr <- as.numeric(pwr_cnsp_feb$Global_active_power)

# Get data for Voltage
vltg = as.numeric(pwr_cnsp_feb$Voltage)

# Get values of energy sub-metering No. 1, 2 and 3
submet1 <- as.numeric(pwr_cnsp_feb$Sub_metering_1)
submet2 <- as.numeric(pwr_cnsp_feb$Sub_metering_2)
submet3 <- as.numeric(pwr_cnsp_feb$Sub_metering_3)

# Get data for Global_reactive_power for given 2 dates in Feb 2007
gl_react_pwr <- as.numeric(pwr_cnsp_feb$Global_reactive_power)

# Set the parameters for plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# Add plots one by one

# Add line graph for Global Active Power
plot(pwr_cnsp_feb$Time, gl_act_pwr, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Add line graph for Voltage
plot(pwr_cnsp_feb$Time, vltg, type="l", xlab="datetime", ylab="Voltage")

# Add line graphs for Energy Submetering
plot(pwr_cnsp_feb$Time, submet1, type="l", xlab="", ylab="Energy Submetering")
lines(pwr_cnsp_feb$Time, submet2, type="l", col="red")
lines(pwr_cnsp_feb$Time, submet3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex=0.6)

# Add line graph for Global Reactive Power
plot(pwr_cnsp_feb$Time, gl_react_pwr, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()