
#read in file and 
fi<-file("household_power_consumption.txt")
data<-read.csv.sql("household_power_consumption.txt",sep=';',header=TRUE,sql="select * from fi where Date in ('1/2/2007','2/2/2007')")
close(fi)
        
mydate <- strptime(with(data,paste(data$Date,data$Time)), "%d/%m/%Y %H:%M:%S")


png(filename="plot2.png")
plot(mydate,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")
dev.off()
