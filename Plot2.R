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
################### PLOT 2 ########################
png(file = "plot2.png",width = 480,height = 480, bg = "transparent")
plot(GAP_k,type="l",ylab="Global Active Power(kilowatts)",xaxt="n")
xLab<-c("Thu","Fri","Sat")
# xaxt="n" close the X-label
# readd X-label: 1 represents the x-label,2 represents the y-label, at means position
axis(1,labels=xLab,at=seq(0,length(GAP_k),length(GAP_k)/2),las=3)
dev.off()
