NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE) 
Combustioncoal <- (comb & coal)
SCC_combcoal <- SCC[Combustioncoal,]$SCC
NEI_combcoal <- NEI[NEI$SCC %in% SCC_combcoal,]

library(ggplot2)
result<- ggplot(data = NEI_combcoal, mapping = aes(x = factor(year), y = Emissions))

png(file = "plot4.png", width = 480, height = 480)
print(result+geom_bar(stat = "identity",
                      position = position_dodge(width = 0.9), fill="blue")
      + labs(title= "Total emissions from coal combustion-related sources",
             y="PM2.5 emission", x = "Year"))

dev.off()