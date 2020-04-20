##read data
Power_data<- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

##create subdata for further use
subPower_data <- subset(Power_data, Date=="1/2/2007"|Date=="2/2/2007")

##create a png file 
png("plot1.png", height = 480, width = 480)

##create a histogram
hist(subPower_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()