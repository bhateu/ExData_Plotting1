# file should be in the working directory

hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                  sep = ";", na.strings="?", 
                  col.names = colnames(read.table("household_power_consumption.txt",
                                                  nrow = 1, header = TRUE, sep=";"))) 

for (dummy in 3:9){
  hpc[,dummy] = as.numeric(hpc[,dummy])
}

hist(hpc[,3], col="red",main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")


dev.copy(png,file = "plot1a.png")
dev.off()
