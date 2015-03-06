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
png("plot3.png", width=480, height=480)

plot(datetime, flt$Sub_metering_1, type="l", col = "black", 
     ylab="Energy sub metering", xlab="")
points(datetime, flt$Sub_metering_2, type="l", col="red")
points(datetime, flt$Sub_metering_3, type="l", col="blue")
legend("topright", pch = "", lwd=c(1,1,1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
