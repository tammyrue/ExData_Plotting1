#PLOT1 CODE
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
HPC1 <- HPC # Just change name to avoid ruin the previous data frame
HPC1 <- within(HPC1, Date <- as.Date(HPC1$Date, format = "%d/%m/%Y")) #Changing the column 2, wich is date from character class to Date class
#also if you use "Date <-" class change occur only in the 2 column
#if you dont use the exact column name "Date", a new variable will be created with Date Class
#sapply(HPC1, class) #Sapply function is optional if you like to verify now Date column went from character class to Date class

## subset of any two days for the plot in February month 2007
HPC2 <- HPC1
HPC_2days <- HPC2[HPC2$Date <= as.Date("2007-2-19") & HPC2$Date >= as.Date("2007-2-18"),]
hist(HPC_2days$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts", ylab = "Frequency")
#png function comes from grDevices package
dev.print(png, file = "plot1.png", width=480, height=480)
dev.off()

