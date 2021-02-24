# R SCRIPT FOR CREATING PLOT.1 

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
data_07<-with(data, data[(Date >= "2007-02-01" & Date <= "2007-02-02"), ])
#---------------------------------------------------------------------------------
# Create png device, create histogram and close device
png(file='plot1.png', width = 480, height = 480, units = "px")
hist(data_07$Global_active_power, col='red', breaks= 15, ylab='Frequency', xlab= 'Global Active Power (kilowatts)', main='Global Active Power')
dev.off()
#---------------------------------------------------------------------------------