##read data
Power_data<- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

##create subdata for further use
subPower_data <- subset(Power_data, Date=="1/2/2007"|Date=="2/2/2007")

## convert date and time formats
subPower_data$Time <- as.POSIXct(paste(subPower_data$Date, subPower_data$Time), format = "%d/%m/%Y %H:%M:%S")
subPower_data$Date <-as.Date(subPower_data$Date, format = "%d/%m/%Y")


##create a png file 
png("plot2.png", height = 480, width = 480)

##create plot
plot(subPower_data$Time, subPower_data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l")
dev.off()