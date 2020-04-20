##read data
Power_data<- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

##create subdata for further use
subPower_data <- subset(Power_data, Date=="1/2/2007"|Date=="2/2/2007")

## convert date and time formats
subPower_data$Time <- as.POSIXct(paste(subPower_data$Date, subPower_data$Time), format = "%d/%m/%Y %H:%M:%S")
subPower_data$Date <-as.Date(subPower_data$Date, format = "%d/%m/%Y")

##create png for plot
png("plot3.png", width=480, height=480)

##create main blank plot
plot(subPower_data$Time, subPower_data$Sub_metering_1, type="n", xlab="", ylab="Energy Sub Metering")

##add sub metering 1
with(subPower_data, lines(Time, Sub_metering_1))

##add sub metering 2
with(subPower_data, lines(Time, Sub_metering_2, col="red"))

##add sub metering 3
with(subPower_data, lines(Time, Sub_metering_3, col="blue"))

##add legend
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##output
dev.off()