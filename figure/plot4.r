#plot 4

plot4 <- function () {
      
      ## Open data source and set Date as.Date
      ## Subset 1st and 2nd of February 2007
      
      DAT <- read.table("household_power_consumption.txt", header= TRUE, sep= ";",
                        dec=".", stringsAsFactors=FALSE)
      
      DAT[,1] <- as.Date(DAT[,1], "%d/%m/%Y")
      
      
      data1 <- subset(DAT, Date=="2007/02/01")
      data2 <- subset(DAT, Date=="2007/02/02")
      data <- rbind(data1,data2)
      
      ##Combine date and time into 1 column and adding it in the end
      
      Tt <- paste(data$Date, data$Time)
      datetime <- as.POSIXct(Tt, format="%Y-%m-%d %H:%M:%S")
      data <- cbind(data,datetime)
      
      for (i in 3:9){
            
            data[,i] <- as.numeric(data[,i])
      }      
      
      
      ##data will now be our data source for 1st and 2nd February 2007 
      
      #Plot set up 2x2 mash in png
      
      
      png("plot4.png",  width = 480, height = 480, units = "px")
      
      par(mfrow= c(2,2))
      
      #plot 1
      
      with(data, plot(data[,10],data[,3], "l",xlab="", 
                      ylab= "Global Active Power"))
      
      #plot 2
      
      with(data, plot(data[,10],data[,5], "l",
                      xlab="datetime", 
                      ylab= "Voltage"))
      
      
      #plot 3
      
      with(data, plot(data[,10],data[,7],"l", col="black",
                      xlab="",
                      ylab= "Energy sub metering"))
      
      with(data, lines(data[,10],data[,8], col="red"))
      
      with(data, lines(data[,10],data[,9], col="blue"))
      
      legend("topright", bty="n", lwd=c(2,2,2), col=c("black",
                                                      "red",
                                                      "blue"),
             legend=c("Sub_mettering_1",
                      "Sub_mettering_2",
                      "Sub_mettering_3"))
      
      
      #Plot 4
      with(data, plot(data[,10],data[,4], "l",
                      xlab="datetime", 
                      ylab= "Global_reacive_power"))
      
      
      
      dev.off()
      
      print("done")
      
}
