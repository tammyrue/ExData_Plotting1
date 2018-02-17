HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
HPC1 <- HPC # Just change name to avoid ruin the previous data frame
HPC1 <- within(HPC1, Date <- as.Date(HPC1$Date, format = "%d/%m/%Y")) #Changing the column 2, wich is date from character class to Date class
#also if you use "Date <-" class change occur only in the 2 column
#if you dont use the exact column name "Date", a new variable will be created with Date Class
#sapply(HPC1, class) #Sapply function is optional if you like to verify now Date column went from character class to Date class

## subset of any two days for the plot in February month 2007
HPC2 <- HPC1
HPC_2days <- HPC2[HPC2$Date <= as.Date("2007-2-19") & HPC2$Date >= as.Date("2007-2-18"),]

## I selected two feb 2007 days which I assume dont have to be exactly the same as in example
HPC_2d_Daytime<- HPC_2days$Time #colum with time and date in the subset. character class still
HPC_2d_Daytime <- as.POSIXct(HPC_2d_Daytime)
with(HPC_2days, plot(Global_active_power ~ HPC_2d_Daytime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.print(png, file = "plot2.png", width=480, height=480)
dev.off()
##you can tell I used days 18 and 19 from february 2007
## showing in my graph sunday monday and tuesday (labels are in spanish)
## for the exact graph I could use 1 and 2 feb 2007
## simply subsetting between these I get thursday, fri and saturday
## whatever days selected code works
