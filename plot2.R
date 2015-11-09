data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

global_active_power <- as.numeric(subset_data$Global_active_power)

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width=480, height=480)

dev.off()