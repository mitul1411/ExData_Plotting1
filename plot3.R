data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

global_active_power <- as.numeric(subset_data$Global_active_power)

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

meter_1 <- as.numeric(subset_data$Sub_metering_1)
meter_2 <- as.numeric(subset_data$Sub_metering_2)
meter_3 <- as.numeric(subset_data$Sub_metering_3)


plot(date_time, meter_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, meter_2, type="l", col="red")
lines(date_time, meter_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png,"plot3.png", width=480, height=480)

dev.off()