
household_power_consumption <- read.table("household_power_consumption.txt", header=TRUE,  sep = ';'
                                          , colClasses = c("character","character","character","character","character","character","character","character","character"))



StartDate <- strptime("2007-02-01", format="%Y-%m-%d")
EndDate <-strptime("2007-02-03", format="%Y-%m-%d")

household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


household_power_consumption <- household_power_consumption[household_power_consumption$DateTime>=StartDate & household_power_consumption$DateTime < EndDate,]

png(filename="plot2.png")

plot(x=household_power_consumption$DateTime, y=household_power_consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()