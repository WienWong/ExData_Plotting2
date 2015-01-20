
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

Baltimore <- f1[f1$fips == "24510", ] 

direct <- paste (getwd(), "/plot5.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px")

# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
#                   fixed = FALSE, useBytes = FALSE, invert = FALSE)
motor_p <- grep("vehicle", f2$Short.Name, ignore.case = TRUE)

motor <- f2[motor_p, ]

# "%in%": To find the indexes of the specific elements inside a larger vector (notice the order): length(Baltimore$SCC)=2096, length(motor$SCC)=260
motor_data <- Baltimore[Baltimore$SCC %in% motor$SCC, ]

motorEmi <- aggregate(Emissions ~ year , motor_data, FUN = "sum")

head(motorEmi)
#   year Emissions
# 1 1999  72.52000
# 2 2002  38.72593
# 3 2005  34.73461
# 4 2008  24.62275

# motorEmi <- aggregate(motor_data$Emissions, list(motor_data$year), FUN = "sum")
# head(motorEmi)
##   Group.1        x
## 1    1999 72.52000
## 2    2002 38.72593
## 3    2005 34.73461
## 4    2008 24.62275

barplot(motorEmi$Emissions, names.arg = motorEmi$year, main = "Total Emissions from Motor Vehicle Sources\n of Baltimore City", xlab = "Year", ylab = expression('Total PM'[2.5]*" Emissions (Tons)"), col = "blue")

# par(new=TRUE)
# 
# plot(motorEmi$Group.1, motorEmi$x, axes=FALSE, type = "l", xlab = NA, ylab = NA, ylim = c(0, 12), pch=16, col = 'red')

dev.off()   
