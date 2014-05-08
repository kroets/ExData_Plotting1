# Load the data (chargement des données)
setwd("~/Analyse de data exploratoire/Travail")
elec<-read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subset of the work period (Sélection de la période de travail entre 1 février 2007 et le 2 février 2007)
sub_elec<- subset(elec, (elec$Date == "1/2/2007" | elec$Date== "2/2/2007"))
# Creation of a variable withe date and time (Création d'une variable qui regroupe date et temps)
sub_elec$Date <- as.Date(sub_elec$Date, format = "%d/%m/%Y")
sub_elec$DateTime <- as.POSIXct(paste(sub_elec$Date, sub_elec$Time))
# Creation of the third plot (troisième graphique créé dans un fichier plot3.png)
png("plot3.png", width = 480, height = 480)
plot(sub_elec$DateTime, sub_elec$Sub_metering_1, type="l", ylab= "Energy Sub metering", xlab="")
lines(sub_elec$DateTime, sub_elec$Sub_metering_2, type="l", col="red") #ajout de la courbe rouge
lines(sub_elec$DateTime, sub_elec$Sub_metering_3, type="l", col="blue") #ajout de la courbe bleue
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))# légende
dev.off()