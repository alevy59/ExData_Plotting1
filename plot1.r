# Assigment for Coursera Exploratory Data - project 1 - plot 1 - 10/10/2015
# read the file using tbl_df which provides beter printing to console
data1 <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))

# dealing with dates could be tricking in R
data1$Date<-as.Date(data1$Date, format = "%d/%m/%Y")

#subsetting for the dates to be use.
data2<-data1[(data1$Date>="2007-02-01" & data1$Date<="2007-02-02"),]

# changing time to POSIXit class -> paste date & time together and use strptime()
data2$timetemp <- paste(data2$Date, data2$Time)
data2$Time <- strptime(data2$timetemp, format = "%Y-%m-%d %H:%M:%S") 

# Open png device
png(filename = "plot1b.png", width = 480, height = 480)
    # Make plot
hist(data2$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()

