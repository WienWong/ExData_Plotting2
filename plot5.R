
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

Baltimore <- f1[f1$fips == "24510", ] 

direct <- paste (getwd(), "/plot5.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px")

motor <- grep("vehicle", f2$Short.Name, ignore.case = T)

motor <- f2[motor, ]

motor <- Baltimore[Baltimore$SCC %in% motor$SCC, ]

motorEmi <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

barplot(motorEmi$x, names.arg = motorEmi$Group.1, main = "Total Emissions from Motor Vehicle Sources\n of Baltimore City", xlab = "Year", ylab = expression('Total PM'[2.5]*" Emission (Tons)"))

# par(new=TRUE)
# 
# plot(motorEmi$Group.1, motorEmi$x, axes=FALSE, type = "l", xlab = NA, ylab = NA, ylim = c(0, 12), pch=16, col = 'red')

dev.off()   
