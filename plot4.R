
setwd("D:/Coursera_R/exdata-data-NEI_data")

f1 <- readRDS("summarySCC_PM25.rds", refhook = NULL)

f2 <- readRDS("Source_Classification_Code.rds", refhook = NULL)

head(f2)

direct <- paste (getwd(), "/plot4.png", sep = "", collapse = NULL)

png(filename = direct, width = 500, height = 500, units = "px")

# grep: search for matches to argument pattern within each element of a character vector:
# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE,
#                   fixed = FALSE, useBytes = FALSE, invert = FALSE)
coal_p <- grep("coal", f2$Short.Name, ignore.case = TRUE)
# ignore.case: if FALSE, the pattern matching is case sensitive and if TRUE, case is ignored during matching.

# coal_p

coal <- f2[coal_p, ]

# "%in%": To find the indexes of the specific elements inside a larger vector (notice the order): length(f1$SCC)=6497651, length(coal$SCC)=239
coal_data <- f1[f1$SCC %in% coal$SCC, ]

coalEmi <- aggregate(Emissions ~ year, coal_data, FUN = "sum")

head(coalEmi)
#   year Emissions
# 1 1999  602624.1
# 2 2002  564940.0
# 3 2005  569654.7
# 4 2008  358083.9

# coalEmi <- aggregate(coal_data$Emissions, list(coal_data$year), FUN = "sum")
# 
# head(coalEmi)
# #   Group.1        x
# # 1    1999 602624.1
# # 2    2002 564940.0
# # 3    2005 569654.7
# # 4    2008 358083.9

barplot(coalEmi$Emissions / 1e+3, names.arg = coalEmi$year, main = "Total Emissions from Coal Combustion-related\n Sources", xlab = "Year", ylab = expression('Total PM'[2.5]*" Emissions (Kilo-Tons)"), col = "blue")

# par(new=TRUE)    
# 
# plot(coalEmi$Group.1, coalEmi$x, axes=FALSE, xlab = NA, ylab = NA, ylim = c(0, max(coalEmi$x)), pch=16, col = 'red')

dev.off()
