
# load only data for 2/1/2007 to 2/2/2007
# skip from 12/16/2006 to 2/1/2007 the load on 2880 rows (1440 mins per day for 2 days)
data <- read.csv("household_power_consumption.txt",header=FALSE, sep=";", nrows=2880, skip=66637)

# open PNG device
png(filename="plot1.png",width=480,height=480)

# create histogram with labels, color, and title
hist(data[,3], xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

#close the PNG device
dev.off()

