
#read in file and 
fi<-file("household_power_consumption.txt")
data<-read.csv.sql("household_power_consumption.txt",sep=';',header=TRUE,sql="select * from fi where Date in ('1/2/2007','2/2/2007')")
close(fi)
        
mydate <- strptime(with(data,paste(data$Date,data$Time)), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")

par(mfrow=c(2,2))
#plot1
plot(mydate,data$Global_active_power,type="l",xlab="",ylab="Global Active Power",main="")

#plot2
plot(mydate,data$Voltage,type="l",xlab="datetime",ylab="Voltage",main="")

#plot3
plot(mydate,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",main="")
lines(mydate,data$Sub_metering_2,col="red")
lines(mydate,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1),bty="n")

#plto4
plot(mydate,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",main="")

dev.off()
