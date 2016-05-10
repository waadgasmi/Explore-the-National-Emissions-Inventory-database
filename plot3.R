## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
variable, which of these four sources have seen decreases in emissions from 1999–2008
for Baltimore City? Which have seen increases in emissions from 1999–2008?  

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
year <- as.numeric(NEI$year)
Emissions <- as.numeric(NEI$Emissions)
balt.type <- aggregate(Baltimore[c("Emissions")], list(type = Baltimore$type, year = Baltimore$year), sum)
png("plot3.png", width=480, height=480)
qplot(year, Emissions, data = balt.type, color = type, geom= "line")
+ ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type")) + xlab("Year") + ylab("PM2.5 Emissions")   
dev.off()  