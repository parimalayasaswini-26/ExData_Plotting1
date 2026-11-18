fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("household_power_consumption.txt")) {
  download.file(fileUrl, destfile = "power_consumption.zip", mode = "wb")
  unzip("power_consumption.zip")
}
full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
sub_data <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png", width = 480, height = 480)
hist(sub_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
