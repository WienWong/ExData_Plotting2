
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

# Baltimore City and Los Angeles County
subset2 <- f1[f1$fips == "24510" | f1$fips == "06037", ]

library(ggplot2)

direct <- paste (getwd(), "/plot6.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px", bg = "transparent")

motor_p <- grep("vehicle", f2$Short.Name, ignore.case = TRUE)

motor <- f2[motor_p, ]

motor_dt <- subset2[subset2$SCC %in% motor$SCC, ]

motor_BL <- motor_dt[motor_dt$fips == "24510",]
motor_BL$city <- "Baltimore City"

motor_LA <- motor_dt[motor_dt$fips == "06037",]
motor_LA$city <- "Los Angeles County"

motorNew <- rbind(motor_BL, motor_LA )

g <- ggplot(motorNew, aes(x = factor(year), y = Emissions, fill = city))

g + geom_bar(stat = "identity") + theme_bw() + labs(x = "year", y = expression("Total PM"[2.5]*" Emissions (Kilo-Tons)")) + labs(title = expression("Emissions from Motor Vehicle Sources in Two Cities"))  

dev.off()




# direct <- paste (getwd(), "/plot7.png", sep = "", collapse = NULL)
# 
# png(filename = direct, width = 500, height = 500, units = "px", bg = "transparent")
# 
# g <- ggplot(motorNew, aes(x=factor(year), y=Emissions, fill=city)) 
# 
# g +  geom_bar(aes(fill=year),stat="identity") + facet_grid(scales="free", space="free", .~city) + guides(fill=FALSE) + theme_bw() + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + labs(title=expression("Emissions from Motor Vehicle Sources in Two Cities"))
# 
# dev.off()
