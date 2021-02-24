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
# Create png device, create line plot and close device
png(file='plot3.png', width = 480, height = 480, units = "px")
plot(data$Datetime, data$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col='black')
lines(data$Datetime, data$Sub_metering_2, type='l',col='red')
lines(data$Datetime, data$Sub_metering_3, type='l', col='blue')
legend('topright', col=c('black','red','blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1)
dev.off()
#---------------------------------------------------------------------------------

#
