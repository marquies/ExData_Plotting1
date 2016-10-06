hpc_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

hpc_data$Time <- with(hpc_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %T"))
hpc_data$Date <- as.Date(hpc_data$Date, format = "%d/%m/%Y")

hpc_plot_data <- subset(hpc_data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png("plot2.png")

plot(hpc_plot_data$Time, hpc_plot_data$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "",  main = NULL)

dev.off()