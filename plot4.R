library(dplyr)


#setwd("C:/Users/User/Documents/R/rprog/Exploratory Data Analysis")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "HouseholdPowerConsumption.zip", mode = "wb")
unzip("HouseholdPowerConsumption.zip")
initial <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", nrows=100)
classes <- sapply(initial, class)
HouseholdData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE, colClasses = classes, na.strings = "?")
HouseholdData <- mutate(HouseholdData, DateTime = paste(Date, Time), Date = as.Date(DateTime, format = "%d/%m/%Y"))
HouseholdData <- filter(HouseholdData, Date >= as.Date("2/1/2007", format="%m/%d/%Y") & Date < as.Date("2/3/2007",  format="%m/%d/%Y"))


#create plots

#plot 4
par(mfrow = c(2,2))
x <- strptime(HouseholdData$DateTime, format="%d/%m/%Y %H:%M:%S")

plot(x, HouseholdData$Global_active_power, type="l", col="black", ylab="Global Active Power")

plot(x, HouseholdData$Voltage, type="l", col="black", xlab = "datetime", ylab="Voltage")

with(HouseholdData, {
  plot(x,  Sub_metering_1 , type="l", ylab = "Energy Sub meeting")
  points(x, Sub_metering_2, type="l", col="red")
  points(x, Sub_metering_3, type="l", col="blue")
})
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),lty=c(1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))

plot(x, HouseholdData$Global_reactive_power, type="l", col="black", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()
