## This is the source code for second plot. 
## The second plot is time series / line plot for Global Active Power

# Read input data
flnm <- "household_power_consumption.txt"
pwr_cnsp <- read.table(flnm, header=TRUE, sep=";")

# Extract data only for dates 2007-02-01 and 2007-02-02
pwr_cnsp_feb <- subset(pwr_cnsp, pwr_cnsp$Date=="1/2/2007" | pwr_cnsp$Date=="2/2/2007")

# Get data for 'Global_active_power' for given 2 dates in Feb 2007
gl_act_pwr <- as.numeric(pwr_cnsp_feb$Global_active_power)

# Convert Date into appropriate format
pwr_cnsp_feb$Date <- as.Date(pwr_cnsp_feb$Date, format="%d/%m/%Y")

# Transform Time into type of object POSIXlt
pwr_cnsp_feb$Time <- strptime(pwr_cnsp_feb$Time, format="%H:%M:%S")
pwr_cnsp_feb[1:1440, "Time"] <- format(pwr_cnsp_feb[1:1440, "Time"], "2007-02-01 %H:%M:%S")
pwr_cnsp_feb[1441:2880, "Time"] <- format(pwr_cnsp_feb[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# Set the parameters for plot
png("plot2.png", width=480, height=480)
plot(pwr_cnsp_feb$Time, gl_act_pwr, type="l", main="Global Active Power Vs Time", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()