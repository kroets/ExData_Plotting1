# Load the data (chargement des donn�es)
setwd("~/Analyse de data exploratoire/Travail")
elec<-read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subset of the work period (S�lection de la p�riode de travail entre 1 f�vrier 2007 et le 2 f�vrier 2007)
sub_elec<- subset(elec, (elec$Date == "1/2/2007" | elec$Date== "2/2/2007"))
# Creation of a variable withe date and time (Cr�ation d'une variable qui regroupe date et temps)
sub_elec$Date <- as.Date(sub_elec$Date, format = "%d/%m/%Y")
sub_elec$DateTime <- as.POSIXct(paste(sub_elec$Date, sub_elec$Time))
# Creation of the fourth plot (quatri�me graphique cr�� dans un fichier plot4.png)
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) # Remplissage par colonnes.
plot(sub_elec$DateTime, sub_elec$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") # Premier graphique
plot(sub_elec$DateTime, sub_elec$Sub_metering_1, type="l", ylab= "Energy Sub metering", xlab="") # D�but deuxi�me graphique
lines(sub_elec$DateTime, sub_elec$Sub_metering_2, type="l", col="red")
lines(sub_elec$DateTime, sub_elec$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) # Fin du deuxi�me graphique
plot(sub_elec$DateTime, sub_elec$Voltage, type="l", xlab="datetime", ylab="Voltage")   #  Troisi�me graphique
plot(sub_elec$DateTime, sub_elec$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  # Quatri�me graphique
dev.off()