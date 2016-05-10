####Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
####Which city has seen greater changes over time in motor vehicle emissions?



# Gather the subset of the NEI data which corresponds to vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesNEI$city <- "Baltimore City"

# Subset the vehicles NEI data to Los Vegas's fip
LasVegasVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
LasVegasVehiclesNEI$city <- "Los Angelos" 

LA.BALT <- rbind(baltimoreVehiclesNEI, LasVegasVehiclesNEI)
png("plot6.png", width=480, height=480)

library(ggplot2)

png("plot6.png", width=1040, height=480)
g <- ggplot(LA.BALT, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ city)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()

