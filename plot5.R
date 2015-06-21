# Load files
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# merge the two data sets 
NEISCC <- merge(NEI, SCC, by="SCC")

# Baltimore is 24510
# Searching for ON-ROAD type in NEI
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
aggregatedYear <- aggregate(Emissions ~ year, subsetNEI, sum)

# Plot to PNG file
png("plot5.png", width=840, height=480)
g <- ggplot(aggregatedYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('PM'[2.5]*" Emissions")) +
  ggtitle('Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland')
print(g)
dev.off()