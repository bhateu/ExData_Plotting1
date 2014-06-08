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


plot(z,hpc$Global_active_power,type="l", xlab="",ylab="Global Active Power(kilowatts)")


dev.copy(png,file = "plot2.png", width=480,height=480)
dev.off()
