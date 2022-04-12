## This is the source code for first plot. 
## The first plot is histogram of Global Active Power

# Read input data
flnm <- "household_power_consumption.txt"
pwr_cnsp <- read.table(flnm, header=TRUE, sep=";")

# Extract data only for dates 2007-02-01 and 2007-02-02
pwr_cnsp_feb <- subset(pwr_cnsp, pwr_cnsp$Date=="1/2/2007" | pwr_cnsp$Date=="2/2/2007")

# Get data for Global_active_power for given 2 dates in Feb 2007
gl_act_pwr <- as.numeric(pwr_cnsp_feb$Global_active_power)

# Set the parameters for plot
png("plot1.png", width=480, height=480)

# Call basic plot function for creating a histogram for Global Active Power
hist(gl_act_pwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()