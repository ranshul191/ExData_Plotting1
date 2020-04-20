##read data
Power_data<- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

##create subdata for further use
subPower_data <- subset(Power_data, Date=="1/2/2007"|Date=="2/2/2007")

## convert date and time formats
subPower_data$Time <- as.POSIXct(paste(subPower_data$Date, subPower_data$Time), format = "%d/%m/%Y %H:%M:%S")
subPower_data$Date <-as.Date(subPower_data$Date, format = "%d/%m/%Y")

##create png for plot
png("plot4.png", width=480, height=480)

## create plotting array
par(mfrow=c(2,2))

## plotting the suboplots 
with(subPower_data,{
  plot(Time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l")
  plot(Time, Voltage,ylab = "Voltage", xlab="datetime", type="l")
  plot(subPower_data$Time, subPower_data$Sub_metering_1, type="n", xlab="", ylab="Energy Sub Metering")
    with(subPower_data, lines(Time, Sub_metering_1))
    with(subPower_data, lines(Time, Sub_metering_2, col="red"))
    with(subPower_data, lines(Time, Sub_metering_3, col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Time, Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime", type="l")    
})

dev.off()