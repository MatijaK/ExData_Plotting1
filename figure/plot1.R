# Plot1.R

plot1 <- function() {
      
      ## Open data source and set Date as.Date
      ## Subset 1st and 2nd of February 2007
      
      DATA <- read.table("household_power_consumption.txt", header= TRUE, sep= ";",
                         dec=".", stringsAsFactors=FALSE)
      
      DATA[,1] <- as.Date(DATA[,1], "%d/%m/%Y")
      
      
      data1 <- subset(DATA, Date=="2007/02/01")
      data2 <- subset(DATA, Date=="2007/02/02")
      data <- rbind(data1,data2)
      
      
      for (i in 3:9){
            
            
            data[,i] <- as.numeric(data[,i])
            
      }
      
      
      ##data will now be our data source for 1st and 2nd February 2007
      
      
      ##Plotting a histogram in a png file
      
      png("plot1.png",  width = 480, height = 480, units = "px")
      
      with(data, hist(data$Global_active_power, col="red", 
            main = "Global Active Power", 
            xlab ="Global Active Power (kilowatts)"))
      
      dev.off()
      
      print("done")
      
}

