
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

head(f1, 5)

dim(f1)
# [1] 6497651       6

head(f2, 5)

dim(f2)
# [1] 11717    15

direct <- paste (getwd(), "/plot1.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px")

totEmi <- aggregate(f1$Emissions, by=list(f1$year), FUN = "sum", na.rm=TRUE)

class(totEmi)

head(totEmi)

#   Group.1       x
# 1    1999 7332967
# 2    2002 5635780
# 3    2005 5454703
# 4    2008 3464206

barplot(totEmi$x, names.arg = totEmi$Group.1, main = "Total Emissions of US from 1999 to 2008", xlab = "Year", ylab = expression('Total PM'[2.5]*" Emission (Tons)"))

# totEmi$x   --  amount
# totEmi$Group.1   --  year

par(new=TRUE)  

plot(totEmi$x, type = "l", axes=FALSE, xlab = NA, ylab = NA, ylim = c(0,7.1e6), lwd = 3, col = 'blue')

par(new=TRUE)

plot(totEmi$Group.1, totEmi$x, axes=FALSE, xlab = NA, ylab = NA, ylim = c(0,7.1e6), pch=16, col = 'red')

dev.off()

