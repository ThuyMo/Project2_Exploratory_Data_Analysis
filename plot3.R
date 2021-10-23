NEI <- readRDS("summarySCC_PM25.rds")

df_Baltimore<- NEI[NEI$fips=='24510',]
library(ggplot2)

result<- ggplot(data = df_Baltimore, mapping = aes(x = factor(year), y = Emissions, group =type))

png(file = "plot3.png", width = 480, height = 480)
print(result+geom_bar(stat = "identity", aes(fill = type),
                      position = position_dodge(width = 0.9))
      +facet_grid(~type)
      + labs(title= "Total emissions from PM2.5 in the Baltimore City every year by type",
             y="PM2.5 emission", x = "Year"))

dev.off()