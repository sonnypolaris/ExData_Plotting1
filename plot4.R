# How to use
# 1 - Ensure the unzipped data file is in working directory
# Run the plot4 function

plot4 <- function ()
{
  # load only data for 2/1/2007 to 2/2/2007, no headers, and data & time as strings
  # skip from 12/16/2006 to 2/1/2007 the load on 2880 rows (1440 mins per day for 2 days)
  data <- read.csv("household_power_consumption.txt",
                   header=FALSE, sep=";", 
                   nrows=2880, skip=66637, stringsAsFactors = FALSE)
  
  # open PNG device
  png(filename="plot4.png",width=480,height=480)
  
  # set the parameter for device rows & columns
  par(mfrow=c(2,2)) 
  
  # create line chart with labels, color, and title
  # paste / contat (data & time) then convert to datatime class
  plot(strptime(
    paste(data[,1], data[,2]), 
    format="%d/%m/%Y %H:%M:%S"),
    data[,3], type="l"
    , xlab="", ylab="Global Active Power (kilowatts)")
  
  # Row 1, Column 2 chart
  plot(strptime(
    paste(data[,1], data[,2]), 
    format="%d/%m/%Y %H:%M:%S"),
    data[,5], type="l"
    , xlab="", ylab="2")
  
  # Row 2, Column 1
  plot(strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S"),data[,7], type="n", xlab="", ylab="Energy sub meeting")
  points(strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S"),data[,7], col="black", type="l") # add series 1
  points(strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S"),data[,8], col="red", type="l")
  points(strptime(paste(data[,1], data[,2]), format="%d/%m/%Y %H:%M:%S"),data[,9], col="blue", type="l")
  
  # setup legend
  legend("topright",
         col=c("black", "red", "blue"), 
         lty=c(1,1,1), pch=c(NA,NA,NA),
         legend=c("Sub_meeting_1","Sub_meeting_2", "Sub_meeting_3"))
  
  # Row 2, Column 2
  plot(strptime(
    paste(data[,1], data[,2]), 
    format="%d/%m/%Y %H:%M:%S"),
    data[,4], type="l"
    , xlab="", ylab="Global_reactive_power")
  
  #close the PNG device
  dev.off()
}