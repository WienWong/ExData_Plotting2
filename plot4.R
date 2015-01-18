
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

direct <- paste (getwd(), "/plot4.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px")

coal <- grep("coal", f2$Short.Name, ignore.case = T)

coal <- f2[coal, ]

coal <- f1[f1$SCC %in% coal$SCC, ]

coalEmi <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

head(coalEmi)
#   Group.1        x
# 1    1999 602624.1
# 2    2002 564940.0
# 3    2005 569654.7
# 4    2008 358083.9

barplot(coalEmi$x, names.arg = totEmi$Group.1, main = "Total Emissions from Coal Combustion-related\n Sources", xlab = "Year", ylab = expression('Total PM'[2.5]*" Emission (Tons)"), ylim = c(0,max(coalEmi$x)))

# par(new=TRUE)
# 
# plot(coalEmi$Group.1, coalEmi$x, axes=FALSE, xlab = NA, ylab = NA, ylim = c(0, max(coalEmi$x)), pch=16, col = 'red')

dev.off()
