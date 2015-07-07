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
################### PLOT 3 ########################
png(file = "plot3.png",width = 480,height = 480, bg = "transparent")
# 2880 is the length of the data, conducted by the function "length()"
data_L<-length(sub_data$Sub_metering_1)
xline<-c(1,data_L)
Sub_metering_1<-as.numeric(sub_data$Sub_metering_1)
Sub_metering_2<-as.numeric(sub_data$Sub_metering_2)
Sub_metering_3<-as.numeric(sub_data$Sub_metering_3)
## IMP!
## xlim is normally a vector with exactly two values (min and max) and not a sequence. 
plot(1:data_L,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering",xlim<-xline,ylim<-c(2,40),xaxt="n")
par(new=TRUE)
plot(1:data_L,Sub_metering_2,col="red",type="l",xlab="",ylab="Energy sub metering",xlim<-xline,ylim<-c(2,40),xaxt="n")
par(new=TRUE)
plot(1:data_L,Sub_metering_3,col="blue",type="l",xlab="",ylab="Energy sub metering",xlim<-xline,ylim<-c(2,40),xaxt="n")
# change the label in the axis
xLab<-c("Thu","Fri","Sat")
axis(1,labels=xLab,at=seq(0,length(GAP_k),length(GAP_k)/2),las=3)
# add the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1,1),cex=0.8)
dev.off()
