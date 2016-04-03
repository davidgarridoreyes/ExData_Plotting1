plot1 <- function(){
	## Load the data. Owe to the big dimensions of the dataset, we will only load the part we are interested in (1 Feb 2007 - 2 Feb 2007). This way
	## of proceding will need us to add the names to the dataframe in another step.
	data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)
	names <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2)

	## Set the real variable names to data:
	names(data) <- names(names)
	rm(names)
	
	## Plot the histogram and save it to a png file (480x480):
	hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
	dev.copy(png, file = "plot1.png", height = 480, width = 480)

	## Close the device:
	dev.off()
}