
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

Baltimore <- f1[f1$fips == "24510", ] 

head(Baltimore, 5)
#         fips      SCC Pollutant Emissions  type year
# 114288 24510 10100601  PM25-PRI     6.532 POINT 1999
# 114296 24510 10200601  PM25-PRI    78.880 POINT 1999
# 114300 24510 10200602  PM25-PRI     0.920 POINT 1999
# 114308 24510 30100699  PM25-PRI    10.376 POINT 1999
# 114325 24510 30183001  PM25-PRI    10.859 POINT 1999

library(ggplot2)

direct <- paste (getwd(), "/plot3.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px")

g2 <- ggplot(Baltimore, aes(factor(year), Emissions, fill = type)) 

g2 + geom_bar(stat = "identity") + theme_bw() + guides(fill = FALSE) +  facet_grid(.~ type,scales = "free",space = "free") + labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Tons)")) + labs(title = expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()

# 
# direct <- paste (getwd(), "/plot3.png", sep = "", collapse = NULL)
# 
# png(filename = direct, width = 500, height = 500, units = "px")
# 
# g <- ggplot(Baltimore, aes(factor(year), Emissions, fill = type)) 
# 
# g + geom_bar(stat = "identity") + theme_bw() + labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Tons)")) + labs(title = expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
# 
# dev.off()
