NEI <- readRDS("summarySCC_PM25.rds")

TotalEmissions <- aggregate(Emissions~year, data = NEI, sum)

png(file = "plot1.png", width = 480, height = 480)
barplot(TotalEmissions$Emissions,TotalEmissions$year, main="The total PM2.5 emission from all sources by year",
        xlab="Year",ylab="PM2.5 emission",col='green')
dev.off()
