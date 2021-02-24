# R SCRIPT FOR CREATING PLOT.2

#---------------------------------------------------------------------------------
# upload household power consumption file.
data<-read.table('household_power_consumption.txt', header =TRUE, sep=';')
#---------------------------------------------------------------------------------
# optional -> brief data pre-analysis (df dimension and variable class)
dim(data);sapply(data,FUN=class) 
#---------------------------------------------------------------------------------
# Change variables class to Date (column 1), or to numeric (columns 3 to 8)
data[,3:8] <- sapply(data[,3:8],as.numeric)
data[,1]<-as.Date(data[,1],'%d/%m/%Y') 
#---------------------------------------------------------------------------------
# Select rows containing data between 2007-02-01 and 2007-02-02
data<-with(data, data[(Date >= "2007-02-01" & Date <= "2007-02-02"), ])
#---------------------------------------------------------------------------------
# create vector with date+time columns, and then create a new variable 'Datetime' in data [class=POSIXct]
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- strptime(datetime, '%Y-%m-%d %H:%M:%S')
#---------------------------------------------------------------------------------
# Create png device, fix number of rows and columns for the multi base plots, createplots and then close device
png(file='plot4.png', width = 480, height = 480, units = "px")
par (mfrow=c(2,2))

with (data, {
  
  plot(Datetime, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)') #PLOT1
  
  plot(Datetime,Voltage, type='l', xlab='datetime', ylab='Voltage') #PLOT2
  
  plot(Datetime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col='black') #PLOT3
  lines(Datetime, Sub_metering_2, type='l',col='red')
  lines(Datetime, Sub_metering_3, type='l', col='blue')
  legend('topright', col=c('black','red','blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, bty = "n")

  plot(Datetime, Global_reactive_power, type='l') #PLOT4
  })

dev.off()
#---------------------------------------------------------------------------------

