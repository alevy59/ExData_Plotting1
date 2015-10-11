# Assigment for Coursera Exploratory Data - project 1 - plot 3 - 10/10/2015
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
png(filename = "plot3.png", width = 480, height = 480)

# Make plot3
# open a new working empty base
plot(data2$Time, data2$Sub_metering_1,
     ylab='Global Active Power (kilowatts)', xlab='', type='n')
# push data in
points(data2$Time, data2$Sub_metering_1, type='l', col="black")
points(data2$Time, data2$Sub_metering_2, type='l', col="red")
points(data2$Time, data2$Sub_metering_3, type='l', col="blue")
# write the legend
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Turn off device
dev.off()
