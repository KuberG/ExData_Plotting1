#if(!file.exists("data")) dir.create("data")

#fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
#download.file(fileURL,destfile="idaho.csv")
df<-fread("household_power_consumption.txt", na.strings="?")

df$Date<-as.Date(df$Date, "%d/%m/%Y")

df2<-df[df$Date=="2007-02-01",]
df2<-rbind(df2,df[df$Date=="2007-02-02",])

df2$DateTime<-as.POSIXct(paste(df2$Date, df2$Time, format="%d/%m/%Y %H:%M:%S"))


png(filename = "Rplot4.png",width = 480, height = 480, units = "px")

par(mfcol=c(2,2))

#graph1
with(df2, plot(df2$DateTime,df2$Global_active_power, type="l",xlab="",ylab="Global Active Power"))

#graph 2
with(df2, plot(df2$DateTime,df2$Sub_metering_1, type="l",ylab="Energy sub metering",xlab=""))
with(df2, points(df2$DateTime,df2$Sub_metering_2, type="l", col="red"))
with(df2, points(df2$DateTime,df2$Sub_metering_3, type="l", col="blue"))

legend("topright",col=c("black","red","blue"),
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2.5,2.5,2.5))

#graph 3
with(df2, plot(df2$DateTime,df2$Voltage, type="l",xlab="datetime",ylab="Voltage"))

#graph 4
with(df2, plot(df2$DateTime,Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()
