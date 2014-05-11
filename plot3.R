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




with(hpc,plot(z,Sub_metering_1,type="l",col="black", ylab="Energy sub metering",xlab=""))
with(hpc,points(z,Sub_metering_2,type="l",col="red"))
with(hpc,points(z,Sub_metering_3,type="l",col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="__",col=c("black","red","blue"),cex=0.7,pt.cex=2,x.intersp=2)


dev.copy(png,file = "plot3.png")
dev.off()
