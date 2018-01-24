## load data
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, destfile = "./Exploratory Data Analysis/ExData_Plotting1/HouseholdPowerConsumption.zip") 
  rawdata <- read.table(unzip("./Exploratory Data Analysis/ExData_Plotting1/HouseholdPowerConsumption.zip"), sep = ";", na.strings = "?", header = TRUE)
  dateDownloaded <- date()
  dateDownloaded

## converting date to class "Date"
  library(plyr)
  rawdata <- mutate(rawdata, Date = as.Date(Date, "%d/%m/%Y"))

## subset the data to just 01/02/2007 00:00:00 to 02/02/2007 23:59:00
  library(dplyr)
  TwoDaySubset <- filter(rawdata, Date >= "2007-02-01" & Date < "2007-02-03")

## creating a datetime POSIXct variable that is easier for data manipulation than Time as "factor" class
  TwoDaySubset$datetime <- as.POSIXct(paste(TwoDaySubset$Date, TwoDaySubset$Time), format = "%Y-%m-%d %H:%M:%S")

## create Plot3 in the png device
png(file = "./Exploratory Data Analysis/ExData_Plotting1/Plot3.png")

  ## set parameters
  par(mar = c(5.1, 5.1, 4.1, 2.1))
  
  ##create plot
  plot(TwoDaySubset$datetime, TwoDaySubset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(TwoDaySubset$datetime, TwoDaySubset$Sub_metering_1, col = "black", type = "l")
  points(TwoDaySubset$datetime, TwoDaySubset$Sub_metering_2, col = "red", type = "l")
  points(TwoDaySubset$datetime, TwoDaySubset$Sub_metering_3, col = "blue", type = "l")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))

dev.off()