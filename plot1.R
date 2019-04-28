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

#)Plot
hist(powerCons$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab="Frequency")


#save the file
dev.copy(png, "plot1.png")

dev.off()

