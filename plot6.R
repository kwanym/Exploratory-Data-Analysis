# Load files
library(ggplot2)

# Load files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")


# Baltimore City Maryland is 24510 and Los Angeles Californaia is 06037 
# Subset ON-ROAD type in NEI
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedYearFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedYearFips$fips[aggregatedYearFips$fips=="06037"] <- "Los Angeles, CA"
aggregatedYearFips$fips[aggregatedYearFips$fips=="24510"] <- "Baltimore, MD"

# Plot to PNG file
png("plot6.png", width=1040, height=500)
g <- ggplot(aggregatedYearFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Emissions from motor vehicle (ON-ROAD) in Baltimore City(fips = 24510) vs Los Angeles, CA (fips = 06037) ')
print(g)
dev.off()


