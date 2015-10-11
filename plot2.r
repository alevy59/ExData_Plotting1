
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
png(filename = "plot2.png", width = 480, height = 480)

# Make plot2
plot(data2$Time, data2$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()
