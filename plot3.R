powerdata <-read.table("household_power_consumption.txt", skip = 1, sep = ";")

names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                      "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

powerdataSubset <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]
powerDateTime <- strptime(paste(powerdataSubset$Date, powerdataSubset$Time," "),"%d/%m/%Y %H:%M:%S" )

globalActivePower <- as.numeric(powerdataSubset$Global_active_power)
submeteringOne <- as.numeric(powerdataSubset$Sub_metering_1)
submeteringTwo <- as.numeric(powerdataSubset$Sub_metering_2)
submeteringThree <- as.numeric(powerdataSubset$Sub_metering_3)

png("plot3.png",width=480, height=480)

plot(powerDateTime,submeteringOne,type="l",xlab="",ylab="Energy Submetering")
lines(powerDateTime,submeteringTwo, type="l", col="red")
lines(powerDateTime,submeteringThree,type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1,
       lwd = 2.5, col=c("black","red","blue"))
dev.off()