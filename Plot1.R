#Read the rds data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Samples data 
NEIsample <- NEI[sample(nrow(NEI), size = 1000, replace = F), ]

# Aggregates all emissions group by years
Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)

#Open the graphic device and plot the data
png(filename = "plot1.png")
barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
