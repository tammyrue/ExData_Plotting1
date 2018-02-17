HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
HPC1 <- HPC # Just change name to avoid ruin the previous data frame
HPC1 <- within(HPC1, Date <- as.Date(HPC1$Date, format = "%d/%m/%Y")) #Changing the column 2, wich is date from character class to Date class
#also if you use "Date <-" Date class change occur only in the 2 column
#if you dont use the exact column name "Date", a new variable will be created with Date Class
#sapply(HPC1, class) #Sapply function is optional if you like to verify now Date column went from character class to Date class

## paste concatenate vectors, use paste(HPC1$Date, HPC1$Time)
HDatetime <- within(HPC1, Datetime <- paste(HPC1$Date, HPC1$Time)) # add new column date/time 

#subset
HPC_Subs <- HDatetime[HDatetime$Date <= as.Date("2007-2-19") & HDatetime$Date >= as.Date("2007-2-18"),]

#from character class column to POSIXct class
HPC_SubsDatetime <- as.POSIXct(HPC_Subs$Datetime)

#four frames for each graphic 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#the grahics
with(HPC_Subs, {
  plot(Global_active_power ~ HPC_SubsDatetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage ~ HPC_SubsDatetime, type="l", ylab="Voltage (volt)", xlab="")
  #plot3
  with(HPC_Subs, plot(Sub_metering_1 ~ HPC_SubsDatetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
  lines(HPC_Subs$Sub_metering_2~HPC_SubsDatetime, col = "red")
  lines(HPC_Subs$Sub_metering_3~HPC_SubsDatetime, col = "blue")
  legend("topright", col=c("black", "red", "blue"), lwd=2, lty=1, cex = 0.55, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ HPC_SubsDatetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.print(png, file = "plot4.png", width=480, height=480)
dev.off()

