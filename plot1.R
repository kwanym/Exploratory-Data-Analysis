# Load Files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregated Emission 

aggregatedEmit <- aggregate(Emissions ~ year, NEI, sum)

# Plot to PNG file
png(filename = "plot1.png")
barplot(aggregatedEmit$Emissions, names.arg=aggregatedEmit$year, xlab="Year", ylab=expression('PM'[2.5]*' emission'),main=expression('Total Emission of PM'[2.5]*''))
dev.off()