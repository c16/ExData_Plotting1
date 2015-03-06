# Make sure the file household_power_consumption.txt from
# https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip
# is in the same directory as this script

# Read file and filter for data from 1st and 2nd February 2007 
classes = c('character', 'character', 'numeric', 'numeric', 'numeric','numeric', 
            'numeric', 'numeric', 'numeric')
df <- read.csv("household_power_consumption.txt", na.strings="?", 
               sep=";", colClasses=classes)
flt <- df[(df$Date=="1/2/2007") | (df$Date=="2/2/2007"),]
datetime <- as.POSIXct(paste(flt$Date, flt$Time), format="%d/%m/%Y %H:%M:%S")
rm(df)

# Draw the plot and save as png file
png("plot1.png", width=480, height=480)
hist(flt$Global_active_power, col="red", main="Global active power", 
     xlab="Global active power (kilowatts)")
dev.off()
