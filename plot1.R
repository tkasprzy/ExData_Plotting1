
#read data
household_power_cons <- read.csv("~/Exploratory Data Analysis/household_power_consumption.txt", sep=";")
household_power_cons$Date = as.Date(household_power_cons$Date, format = "%d/%m/%Y")
power = subset(household_power_cons, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
Datetime = paste(power$Date, power$Time)
Datetime = strptime(Datetime, format = "%Y-%m-%d %H:%M:%S")
hpc = cbind(Datetime, power[,3:9])

#plot 1
png("plot1.png")
hist(as.numeric(as.character(hpc$Global_active_power)), col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()