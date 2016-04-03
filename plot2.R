plot2 <- function(){
	## Load the data. Owe to the big dimensions of the dataset, we will only load the part we are interested in (1 Feb 2007 - 2 Feb 2007). This way
	## of proceding will need us to add the names to the dataframe in another step.
	data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)
	names <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2)

	## Set the real variable names to data:
	names(data) <- names(names)
	rm(names)	

	## Convert times:
	datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 	

	## Plot and save the image to a png file (480x480):
	png("plot2.png", height = 480, width = 480)
	plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	
	## Close the device:
	dev.off()
}