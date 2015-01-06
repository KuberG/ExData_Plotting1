#if(!file.exists("data")) dir.create("data")

#fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
#download.file(fileURL,destfile="idaho.csv")
library("data.table")

df<-fread("household_power_consumption.txt")
df$Date<-as.Date(df$Date, "%d/%m/%Y") 
df2<-df[df$Date=="2007-02-01",]
df2<-rbind(df2,df[df$Date=="2007-02-02",])
df2$Global_active_power<-as.numeric(df2$Global_active_power)

png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(df2$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()