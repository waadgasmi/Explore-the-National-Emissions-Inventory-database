###### Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission
######from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
year <- as.numeric(NEI$year)
Emissions <- as.numeric(NEI$Emissions)
dataSum <- with(NEI, aggregate(Emissions, by = list(year), sum))
png("plot1.png", width=480, height=480)
plot(dataSum, type = "o", main = "Total PM2.5 Emissions in the US", xlab = "Year", 
ylab = "PM2.5 Emissions", pch = 19, col = "green", lty = 6)
dev.off()