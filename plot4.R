##########Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.Coal <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.Coal <- NEI[NEI$SCC %in% SCC.Coal$SCC, ]
png("plot4.png", width=480, height=480)
ggplot(NEI.Coal,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="orange",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
dev.off()
