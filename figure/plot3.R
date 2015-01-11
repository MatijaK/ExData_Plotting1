#plot 3

plot3 <- function () {
      
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
      T1 <- as.POSIXct(Tt, format="%Y-%m-%d %H:%M:%S")
      data <- cbind(data,T1)
      
      for (i in 3:9){
            
            data[,i] <- as.numeric(data[,i])
      }      
      
      
      ##data will now be our data source for 1st and 2nd February 2007 
      
      #plot 3
      
      png("plot3.png",  width = 480, height = 480, units = "px")
      
      with(data, plot(data[,10],data[,7],"l", col="black",
                      xlab="",
                      ylab= "Energy sub metering"))
      
      with(data, lines(data[,10],data[,8], col="red"))
      
      with(data, lines(data[,10],data[,9], col="blue"))
      
      legend("topright", lwd=c(2,2,2), col=c("black",
                                         "red",
                                         "blue"),
             legend=c("Sub_mettering_1",
                      "Sub_mettering_2",
                      "Sub_mettering_3"))
      
      
      dev.off()
      
      print("done")
      
}
