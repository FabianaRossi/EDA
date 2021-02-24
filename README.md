=======================================================================================================
# Exploratory Data Analysis Course - Johns Hopkins

#### _This repository contains the 1st assingment of the Exploratory Data Analysis Course (J. Hopkins, Coursera)_ 
=======================================================================================================

    1st assignment


This assignment uses the “Individual household electric power consumption Data Set” from the UC Irvine Machine Learning Repository. It consists of the measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
=============================================================================================

1. Date: Date in format dd/mm/yyyy
2. Time: time in format hh:mm:ss
3. Global_active_power: household global minute-averaged active power (in kilowatt)
4. Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
5. Voltage: minute-averaged voltage (in volt)
6. Global_intensity: household global minute-averaged current intensity (in ampere)
7. Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


Information about the R script used for the Exploratory Data Analysis project:
==============================================================================

script file names: plot1.R, plot2.R, plot3.R, plot4.R 

Each script does the following:

1. Uploads data tables (it will work as long as R script is saved in the same working directory as the files, otherwise please correct path)
2. Appropriately changes variable classes. 
3. Extracts only the measurements between 2007-02-01 and 2007-02-02. 
4. Merges the 'Date' and 'Time' variable, and then transforms the resulting vector 'Datetime' to class=POSIXct.
5. Creates new column in the dataframe named 'Datetime'.
6. Extracts date and time information using strptime function, which is then used to build each plot.


