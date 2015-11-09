data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

global_active_power <- as.numeric(subset_data$Global_active_power)
global_reactive_power <- as.numeric(subSetData$Global_reactive_power)

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

voltage <- as.numeric(subSetData$Voltage)

par(mfrow = c(2, 2)) 

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, as.numeric(subset_data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(date_time, as.numeric(subset_data$Sub_metering_2), type="l", col="red")
lines(date_time, as.numeric(subset_data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,"plot4.png", width=480, height=480)

dev.off()