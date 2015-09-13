library(dplyr)


setwd("C:/Users/User/Documents/R/rprog/Exploratory Data Analysis")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "HouseholdPowerConsumption.zip", mode = "wb")
unzip("HouseholdPowerConsumption.zip")
initial <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", nrows=100)
classes <- sapply(initial, class)
HouseholdData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors = FALSE, colClasses = classes, na.strings = "?")
HouseholdData <- mutate(HouseholdData, Date = as.Date(Date, format = "%d/%m/%Y"))
HouseholdData <- filter(HouseholdData, Date >= "2007/02/01" & Date <= "2007/02/02")

#create plots

#plot 1
hist(HouseholdData$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowats)")
dev.copy(png, file="plot1.png")
dev.off()

