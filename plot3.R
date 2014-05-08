
#read data
household_power_cons <- read.csv("~/Exploratory Data Analysis/household_power_consumption.txt", sep=";")
household_power_cons$Date = as.Date(household_power_cons$Date, format = "%d/%m/%Y")
power = subset(household_power_cons, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
Datetime = paste(power$Date, power$Time)
Datetime = strptime(Datetime, format = "%Y-%m-%d %H:%M:%S")
hpc = cbind(Datetime, power[,3:9])


#plot 3
png("plot3.png")
plot(hpc$Datetime, as.numeric(hpc$Sub_metering_1), ylim = c(0,40),xlab = "", ylab = "Energy sub metering",type="n", yaxt = "n")
axis(2,at=c(0,10,20,30))
lines(hpc$Datetime, as.numeric(as.character(hpc$Sub_metering_1)), col = 1)
lines(hpc$Datetime, as.numeric(as.character(hpc$Sub_metering_2)), col = 2)
lines(hpc$Datetime, as.numeric(as.character(hpc$Sub_metering_3)), col = 4)
legend("topright", lty = 1, col = c(1,2,4), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()