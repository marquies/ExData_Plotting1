hpc_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

hpc_data$Time <- with(hpc_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %T"))
hpc_data$Date <- as.Date(hpc_data$Date, format = "%d/%m/%Y")

hpc_plot_data <- subset(hpc_data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png("plot3.png")

plot(hpc_plot_data$Time,hpc_plot_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "",  main = NULL)
lines(hpc_plot_data$Time,hpc_plot_data$Sub_metering_2, col = "red")
lines(hpc_plot_data$Time,hpc_plot_data$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"), text.width = 50000)

dev.off()