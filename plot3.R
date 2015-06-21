# Load files
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore is 24510
subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalYearType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

# Plot3
png("plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalYearType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab(expression('PM'[2.5]*" Emissions")) +
  ggtitle('Emissions per Type in Baltimore City, Maryland')
print(g)
dev.off()