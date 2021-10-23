NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehic <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_vehic <- SCC[vehic,]$SCC
NEI_vehicles <- NEI[NEI$SCC %in% SCC_vehic,]

Baltimore_verhicles <- NEI_vehicles[NEI_vehicles$fips == 24510,]
Baltimore_verhicles$city <- "Baltimore City"
LANEI_verhicles <- NEI_vehicles[NEI_vehicles$fips=="06037",]
LANEI_verhicles$city <- "Los Angeles County"
df_both <- rbind(Baltimore_verhicles,LANEI_verhicles)


result<- ggplot(data = df_both, mapping = aes(x = factor(year), y = Emissions, group =city))

png(file = "plot6.png", width = 480, height = 480)
print(result+geom_bar(stat = "identity", aes(fill = city),
                      position = position_dodge(width = 0.9))
      +facet_grid(~city)
      + labs(title= "Compare emissions from motor vehicle sources in Baltimore City \nwith emissions from motor vehicle sources in Los Angeles County",
             y="PM2.5 emission", x = "Year"))
dev.off()
