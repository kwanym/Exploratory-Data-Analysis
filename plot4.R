# Load files
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge NEI and SCC
NEISCC <- merge(NEI, SCC, by="SCC")

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
# fetch all NEIxSCC records with Short.Name (SCC) Coal
coaldata  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coaldata, ]

aggregatedYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression('PM'[2.5]*" Emissions")) +
  ggtitle('Emissions from coal sources')
print(g)
dev.off()