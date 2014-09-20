#Read the rds data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Samples data 
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

# Subsets data 
MD <- subset(NEI, fips == '24510')

#Open the graphic device and plot the data
png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()