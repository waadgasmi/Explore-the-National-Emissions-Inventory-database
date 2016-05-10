###### Have total emissions from PM2.5 decreased in the Baltimore City, 
Maryland (fips == "24510") from 1999 to 2008

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- NEI[NEI$fips %in% c("24510"),]
B.year<-as.numeric(Baltimore$year)
B.Emissions <-as.numeric(Baltimore$Emissions)
dataSumBal <- with(Baltimore, aggregate(B.Emissions, by = list(B.year), sum))
png("plot2.png", width=480, height=480)
plot(dataSumBal, type = "o", main = "Total PM2.5 Emissions in Baltimore City", xlab = "Year", 
ylab = "PM2.5 Emissions", pch = 19, col = "blue", lty = 6)
dev.off()
