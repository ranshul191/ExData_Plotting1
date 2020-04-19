##read data
data<- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

## convert date and time formats
data$Date <-as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

##create subdata for further use
subdata <- subset(data, Date>="2007-02-01" & Date <="2007-02-02")

##create a png file 
png("plot1.png", height = 400, width = 400)

##create a histogram
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()