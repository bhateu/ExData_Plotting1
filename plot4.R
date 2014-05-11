# file should be in the working directory

hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                  sep = ";", na.strings="?", 
                  col.names = colnames(read.table("household_power_consumption.txt",
                                                  nrow = 1, header = TRUE, sep=";"))) 

for (dummy in 3:9){
  hpc[,dummy] = as.numeric(hpc[,dummy])
}

data <- paste(hpc$Date,hpc$Time)
z <- strptime(data,"%d/%m/%Y %H:%M:%S")

par(mar=c(5.1,4.6,4.1,2.6))
par(mfrow=c(2,2))

plot(z,hpc$Global_active_power,type="l", xlab="",ylab="Global Active Power")

plot(z,hpc$Voltage,type="l", xlab="datetime",ylab="Voltage")

with(hpc,plot(z,Sub_metering_1,type="l",col="black", ylab="Energy sub metering",xlab=""))
with(hpc,points(z,Sub_metering_2,type="l",col="red"))
with(hpc,points(z,Sub_metering_3,type="l",col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="__",col=c("black","red","blue"),bty="n",cex=0.6,pt.cex=2)

plot(z,hpc$Global_reactive_power,type="l", xlab="datetime",ylab="Global reactive Power")


dev.copy(png,file = "plot4.png")
dev.off()
