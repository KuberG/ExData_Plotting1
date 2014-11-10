#if(!file.exists("data")) dir.create("data")

#fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
#download.file(fileURL,destfile="idaho.csv")
df<-fread("household_power_consumption.txt", na.strings="?")

df$Date<-as.Date(df$Date, "%d/%m/%Y")

df2<-df[df$Date=="2007-02-01",]
df2<-rbind(df2,df[df$Date=="2007-02-02",])

png(filename = "Rplot3.png",width = 480, height = 480, units = "px")

with(df2, plot(as.POSIXct(paste(df2$Date, df2$Time, format="%d/%m/%Y %H:%M:%S")),df2$Sub_metering_1, type="l",ylab="Energy sub metering",xlab=""))
with(df2, points(as.POSIXct(paste(df2$Date, df2$Time, format="%d/%m/%Y %H:%M:%S")),df2$Sub_metering_2, type="l", col="red"))
with(df2, points(as.POSIXct(paste(df2$Date, df2$Time, format="%d/%m/%Y %H:%M:%S")),df2$Sub_metering_3, type="l", col="blue"))
legend("topright",col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2.5,2.5,2.5))
dev.off()
