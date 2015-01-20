
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

# Extract data of Baltimore City (fips == "24510")
Baltimore <- f1[f1$fips == "24510", ] 

direct <- paste (getwd(), "/plot2.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px")

totEmi_Ba <- aggregate(Emissions ~ year, Baltimore, FUN = "sum",  na.rm=TRUE)

head(totEmi_Ba)
#   year Emissions
# 1 1999  3274.180
# 2 2002  2453.916
# 3 2005  3091.354
# 4 2008  1862.282

## Lines of alternative code
# totEmi_Ba <- aggregate(Baltimore$Emissions, by=list(Baltimore$year), FUN = "sum",  na.rm=TRUE)

# head(totEmi_Ba)
#   Group.1        x
# 1    1999 3274.180
# 2    2002 2453.916
# 3    2005 3091.354
# 4    2008 1862.282

barplot(totEmi_Ba$Emissions, names.arg = totEmi_Ba$year, main = "Total Emissions at Baltimore City", xlab = "Year", ylab = expression('Total PM'[2.5]*" Emissions (Tons)"), ylim = c(0,3500), col = "blue")

# par(new=TRUE)  
# 
# plot(totEmi_Ba$x, type = "l", axes=FALSE, xlab = NA, ylab = NA, ylim = c(0,3500), lwd = 3, col = 'blue')
# 
# par(new=TRUE)
# 
# plot(totEmi_Ba$Group.1, totEmi_Ba$x, axes=FALSE, xlab = NA, ylab = NA, ylim = c(0,3500), pch=16, col = 'red')

dev.off()

