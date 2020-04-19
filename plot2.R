##read data
data<- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

## convert date and time formats
data$Time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <-as.Date(data$Date, format = "%d/%m/%Y")


##create subdata for further use
subdata <- subset(data, Date>="2007-02-01" & Date <="2007-02-02")

##create a png file 
png("plot2.png", height = 400, width = 400)

##create plot
plot(subdata$Time, subdata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="", type="l")
dev.off()