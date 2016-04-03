plot4 <- function(){
	## Load the data. Owe to the big dimensions of the dataset, we will only load the part we are interested in (1 Feb 2007 - 2 Feb 2007). This way
	## of proceding will need us to add the names to the dataframe in another step.
	data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)
	names <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2)

	## Set the real variable names to data:
	names(data) <- names(names)
	rm(names)	

	## Convert times:
	datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 	

	## Plot and save to png file (480x480).
	png("plot4.png", height = 480, width = 480)
	par(mfrow = c(2,2))
	## First plot:
	plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
	## Second plot:
	plot(datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
	## Third plot:
	plot(datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	points(datetime, data$Sub_metering_2, type = "l", col = "red")
	points(datetime, data$Sub_metering_3, type = "l", col = "blue")
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")	
	## Fourth plot:
	plot(datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
	## Close the device.
	dev.off()
}