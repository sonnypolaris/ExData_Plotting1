
# load only data for 2/1/2007 to 2/2/2007, no headers, and data & time as strings
# skip from 12/16/2006 to 2/1/2007 the load on 2880 rows (1440 mins per day for 2 days)
data <- read.csv("household_power_consumption.txt",
                 header=FALSE, sep=";", 
                 nrows=2880, skip=66637, stringsAsFactors = FALSE)

# open PNG device
png(filename="plot2.png",width=480,height=480)

# create line chart with labels, color, and title
# paste / contat (data & time) then convert to datatime class
plot(strptime(
  paste(data[,1], data[,2]), 
  format="%d/%m/%Y %H:%M:%S"),
  data[,3], type="l"
  , xlab="", ylab="Global Active Power (kilowatts)")

#close the PNG device
dev.off()

