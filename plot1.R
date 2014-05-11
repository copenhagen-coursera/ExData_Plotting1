
household_power_consumption <- read.table("household_power_consumption.txt", header=TRUE,  sep = ';'
                                          , colClasses = c("character","character","character","character","character","character","character","character","character"))



StartDate <- strptime("2007-02-01", format="%Y-%m-%d")
EndDate <-strptime("2007-02-03", format="%Y-%m-%d")

household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


household_power_consumption <- household_power_consumption[household_power_consumption$DateTime>=StartDate & household_power_consumption$DateTime < EndDate,]

png(filename="plot1.png")

hist(x=as.numeric(household_power_consumption$Global_active_power), main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", col = "red");
dev.off()