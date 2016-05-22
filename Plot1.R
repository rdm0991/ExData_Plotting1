##  Script file for generating Plot1.png graph

## set working directory
setwd("C:\\Coursera\\Household_Power_Consumption")

## read the file to create a data frame
hpc <- read.csv(file="household_power_consumption.txt", header=TRUE,sep=";")

## Subset to extract data for 2 days in Feb 2007
hpcDays <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))

## recreate a single field with date and time
hpcDays$DateTime <- strptime(paste(hpcDays$Date, hpcDays$Time, sep =" "), "%d/%m/%Y %H:%M:%S") 

## convert data to appropriate types
hpcDays$Date <- strptime(hpcDays$Date, "%d/%m/%y")
hpcDays$Global_active_power <- as.numeric(as.character(hpcDays$Global_active_power))
hpcDays$Global_reActive_Power <- as.numeric(as.character(hpcDays$Global_reactive_power))
hpcDays$Voltage <- as.numeric(as.character(hpcDays$Voltage))
hpcDays$Global_intensity <- as.numeric(as.character(hpcDays$Global_intensity))
hpcDays$Sub_metering_1 <- as.numeric(as.character(hpcDays$Sub_metering_1))
hpcDays$Sub_metering_2 <- as.numeric(as.character(hpcDays$Sub_metering_2))
hpcDays$Sub_metering_3 <- as.numeric(as.character(hpcDays$Sub_metering_3))

# Histogram drawing 
png("Plot1.png",width= 480, height = 480,  units= "px") 
hist(hpcDays$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)") 
dev.off() 
