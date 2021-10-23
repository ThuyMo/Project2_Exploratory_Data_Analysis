NEI <- readRDS("summarySCC_PM25.rds")

df_Baltimore<- NEI[NEI$fips=='24510',]
TotalEmissions <- aggregate(Emissions~year, data = df_Baltimore, sum)
png(file = "plot2.png", width = 480, height = 480)
barplot(TotalEmissions$Emissions,TotalEmissions$year, main="Total emissions from PM2.5 decreased in the Baltimore City by year",
        xlab="Year",ylab="PM2.5 emission",col='blue')
dev.off()