fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("household_power_consumption.txt")) {
  download.file(fileUrl, destfile = "power_consumption.zip", mode = "wb")
  unzip("power_consumption.zip")
}
full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
sub_data <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
sub_data$Datetime <- strptime(paste(sub_data$Date, sub_data$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(sub_data$Datetime, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sub_data$Datetime, sub_data$Sub_metering_2, col = "red")
lines(sub_data$Datetime, sub_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()
