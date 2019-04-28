##Plot 1



#Download the file and extract the file if not exist
dataFile <- "household_power_consumption.txt"
if(!file.exists()){
  #)Download the file
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  download.file(url = fileUrl, destfile = "power_consumption.zip", method = "curl")
  
  #2)Unzip the file
  unzip( "power_consumption.zip")
  
  #)Delete the zip file
  file.remove("power_consumption.zip")
  
}

#)Read the data
powerCons <- read.table(file = "household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)

#)Subset the variable
powerCons <- powerCons[(powerCons$Date=="1/2/2007" | powerCons$Date == "2/2/2007"),]


#) Add new column datetime in posis
powerCons$DateTime <- as.POSIXct(strptime(paste(as.Date(powerCons$Date, "%d/%m/%Y"), powerCons$Time), "%Y-%m-%d %H:%M:%S"))

#)Create a panel for the graphics
par(mfrow=c(2,2))

#add the first plot
plot(y=powerCons$Global_active_power, x=powerCons$DateTime, type = "l", xlab = "", ylab = "Global Active Power")
#)second plot
plot(y=powerCons$Voltage, x=powerCons$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")

#)Third plot
plot(y=powerCons$Sub_metering_1, x=powerCons$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(y=powerCons$Sub_metering_2, x=powerCons$DateTime, type = "l",  col="red")
lines(y=powerCons$Sub_metering_3, x=powerCons$DateTime, type = "l",  col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#)fourth plot
plot(y=powerCons$Global_reactive_power, x=powerCons$DateTime, type = "l", xlab = "datetime", ylab = "global_reactive_power")
#Save the file
dev.copy(png, "plot4.png")
dev.off()