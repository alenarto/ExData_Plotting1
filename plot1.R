
#read in file and 
fi<-file("household_power_consumption.txt")
data<-read.csv.sql("household_power_consumption.txt",sep=';',header=TRUE,sql="select * from fi where Date in ('1/2/2007','2/2/2007')")
close(fi)
 
png(filename="plot1.png")

hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200),yaxt="n",xaxt="n",col="red")
axis(2,at=c(0,200,400,600,800,1000,1200))
axis(1,at=c(0,2,4,6))   

dev.off()
