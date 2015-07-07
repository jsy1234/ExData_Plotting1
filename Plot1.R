
##################################################
################# Read Data ######################
setwd("C:/Users/Administrator/Downloads")
data<-read.table("household_power_consumption.txt",header=T,sep=";")
date<-data$Date
date<-as.Date(date,format="%d/%m/%Y")
date_num<-as.double(date)
start_time<-as.double(as.Date("2007/02/01"))
end_time<-as.double(as.Date("2007/02/02"))
sub_data<-data[date_num>=start_time & date<=end_time,]
GAP_k<-as.numeric(sub_data$Global_active_power)

###################################################
################### PLOT 1 ########################
png(file = "plot1.png",width = 480,height = 480, bg = "transparent")
hist(GAP_k,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
