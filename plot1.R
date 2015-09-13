
#Hugo Andrés Dorado B.
#Exploratory data analysis - Coursera
#Project 1

library(data.table)

#Loading the data

#memory required = no. of column * no. of rows * 8 bytes/numeric
#1GB = 1024^3

(2075259)*(9)*8/1024^3

#Reading the data

dataBase <- fread("./household_power_consumption.txt", na.strings=c(NA,'?'))

#Formating the date

dataBase$Date <- as.Date(dataBase$Date,"%d/%m/%Y")

#Subsetting the dates

dataBase2 <- dataBase[dataBase$Date >= "2007-02-01" & dataBase$Date <= "2007-02-02",]

dataBase2 <- as.data.frame(dataBase2)

dataBase2$timeDate <- strptime(paste(dataBase2$Date,dataBase2$Time),"%Y-%m-%d %H:%M:%S")

for(i in 3:9){dataBase2[,i] <- as.numeric(as.matrix(dataBase2[,i]))}

#Plot

png("plot1.png",height =480 ,width =  480)
hist(dataBase2$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()
