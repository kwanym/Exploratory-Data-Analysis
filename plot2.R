# Load files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subsets data and appends two years in one data frame
BCMD <- subset(NEI, fips == '24510')

png(filename = 'plot2.png')
barplot(tapply(X = BCMD$Emissions, INDEX = BCMD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()