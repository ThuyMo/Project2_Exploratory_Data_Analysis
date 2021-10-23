NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehic <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_vehic <- SCC[vehic,]$SCC
NEI_vehicles <- NEI[NEI$SCC %in% SCC_vehic,]

df_Baltimore<- NEI_vehicles[NEI_vehicles$fips=='24510',]

library(ggplot2)
result<- ggplot(data = df_Baltimore, mapping = aes(x = factor(year), y = Emissions))

png(file = "plot5.png", width = 480, height = 480)
print(result+geom_bar(stat = "identity",
                      position = position_dodge(width = 0.9), fill="purple")
      + labs(title= "Total emissions from motor vehicle sources in Baltimore City",
             y="PM2.5 emission", x = "Year"))

dev.off()