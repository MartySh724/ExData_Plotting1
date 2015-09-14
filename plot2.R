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

#plot 1
x <- strptime(HouseholdData$DateTime, format="%d/%m/%Y %H:%M:%S")
y <- HouseholdData$Global_reactive_power
plot(x, y, type="l", main="Global Active Power", col="black", ylab="Global Active Power (kilowats)")
dev.copy(png, file="plot2.png")
dev.off()

