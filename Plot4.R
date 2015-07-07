
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
################### PLOT 4 ########################
png(file = "plot4.png",width = 480,height = 480, bg = "transparent")
par(mfrow=c(2,2))
par(mgp=c(2,0.5,0),mar=c(3,3,2,1))
#################### (1,1) ########################
plot(GAP_k,type="l",ylab="Global Active Power(kilowatts)",xaxt="n")
xLab<-c("Thu","Fri","Sat")
# xaxt="n" close the X-label
# readd X-label: 1 represents the x-label,2 represents the y-label, at means position
axis(1,labels=xLab,at=seq(0,length(GAP_k),length(GAP_k)/2),las=3)

#################### (1,2) ########################
voltage<-as.numeric(sub_data$Voltage)
plot(voltage,type="l",ylab="voltage",xlab="datetime",xaxt="n")
axis(1,labels=xLab,at=seq(0,length(GAP_k),length(GAP_k)/2),las=3)

#################### (2,1) ########################
data_L<-length(sub_data$Sub_metering_1)
plot(1:data_L,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering",xlim<-xline,ylim<-c(2,40),xaxt="n")
par(new=TRUE)
plot(1:data_Ldata_L,Sub_metering_2,col="red",type="l",xlab="",ylab="Energy sub metering",xlim<-xline,ylim<-c(2,40),xaxt="n")
par(new=TRUE)
plot(1:data_L,Sub_metering_3,col="blue",type="l",xlab="",ylab="Energy sub metering",xlim<-xline,ylim<-c(2,40),xaxt="n")
axis(1,labels=xLab,at=seq(0,length(GAP_k),length(GAP_k)/2),las=3)
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1,1),cex=0.3)

#################### (2,2) ########################
GRP_k<-as.numeric(sub_data$Global_reactive_power)
plot(GRP_k,type="l",ylab="Global Reactive Power(kilowatts)",xlab="datetime",xaxt="n")
# xaxt="n" close the X-label
# readd X-label: 1 represents the x-label,2 represents the y-label, at means position
axis(1,labels=xLab,at=seq(0,length(GAP_k),length(GAP_k)/2),las=3)

dev.off()
