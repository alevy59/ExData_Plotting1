# Assigment for Coursera Exploratory Data - project 1 - plot 4 - 11/10/2015
# read the file using tbl_df which provides beter printing to console
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))

# dealing with dates could be tricking in R
data1$Date<-as.Date(data1$Date, format = "%d/%m/%Y")
#subsetting for the used dates
data2<-data1[(data1$Date>="2007-02-01" & data1$Date<="2007-02-02"),]

# changing time to POSIXit class -> paste date & time together and use strptime()
data2$timetemp <- paste(data2$Date, data2$Time)
data2$Time <- strptime(data2$timetemp, format = "%Y-%m-%d %H:%M:%S") 

# Open png device
png(filename = "plot4.png", width = 480, height = 480)

# Make plot4
# for multiple graphs in a window
par(mfcol=c(2,2))
# repeting plots ... starting with plot2
plot(data2$Time, data2$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')
# next down in the column is plot3
plot(data2$Time, data2$Sub_metering_1,
     ylab='Global Active Power (kilowatts)', xlab='', type='n')
points(data2$Time, data2$Sub_metering_1, type='l', col="black")
points(data2$Time, data2$Sub_metering_2, type='l', col="red")
points(data2$Time, data2$Sub_metering_3, type='l', col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# first row second column voltage hei that's a new one...
plot(data2$Time, data2$Voltage,
     ylab='Voltage', xlab='datetime', type='l')
# Last to bottom right corner the Global_reactive_power
plot(data2$Time, data2$Global_reactive_power,
     ylab='Global_reactive_power', xlab='datetime', type='l')
# Turn off device
dev.off()