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

## create Plot2 in the png device
  png(file = "./Exploratory Data Analysis/ExData_Plotting1/Plot2.png")
  
    par(mar = c(5.1, 5.1, 4.1, 2.1))
    plot(TwoDaySubset$datetime, TwoDaySubset$Global_active_power, 
      type = "l", 
      ylab = "Global Active Power (kilowatts)", 
      xlab = ""
    )

  dev.off()