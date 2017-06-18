#shortcuts 
#https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts

## adding comments 
Ctrl + Shift + C

## Adding and removing multiple tabs
### Select the section first
Tab
Tab + Shift

### useful commands
#1
getwd()
setwd()

#2 
library()
search()

#3 
install.packages()

pkgs <- as.data.frame(installed.packages(), stringsAsFactors = FALSE, row.names = FALSE)
pkgs[, c("Package", "Version", "Built")]

#4
head()
tail()
str()
summary()

#5
?

setwd("/home/maiski/R/workshop2017/mydata")
ibs_data <- read.csv("IBSCTL_Osm_all_cor.csv")
colnames(ibs_data)
ctrl <- ibs_data[1:20,]
IBS1 <- ibs_data[21:62, ]
IBS2 <- ibs_data[63:96, ]
galOHlysine_ctrl <- ctrl$X325.1605..0.720
galOHlysine_IBS1 <- IBS1$X325.1605..0.720
galOHlysine_IBS2 <- IBS2$X325.1605..0.720
mydata <- as.data.frame(c(galOHlysine_ctrl, galOHlysine_IBS1, galOHlysine_IBS2))

setwd("/home/maiski/R/workshop2017/mydata")
ibs_data <- read.csv("IBSCTL_Osm_all_cor.csv")
# PCA plot
metabolite <- ibs_data[, 15:148]
metab <- na.omit(metabolite)
PCA_IBS_metabolite <- prcomp(metab)
plot(PCA_IBS_metabolite, n = 15)

library(scales)
ibsPlot <- function(x, y, groupname, sex, age,
                    main = "",
                    xlab = "",
                    ylab = "") { ## it's advantageous to have variable names same as how you name variables normally
  
  # Purpose:
  #     Create a plot of IBS data in which individual points
  #     are colored by classes, shaped by gender and scaled by
  #     age.
  # Version:  1.0
  # Date:     2016-06-17
  # Author:   Mai Yamamoto
  #
  # Parameters:
  #     x: numeric   x-coordinates of point
  #     y: numeric   y-coordinates of point
  #     classes: factors with level CTL, IBS1 and IBS2
  #     sex: integer of 0 for male, 1 for female
  #     age: numeric
  # Value:
  #     None. Creates plot as side-effect
  
  N <- length(x)  #  number of points
  
  # 1. Create a color vector computed from species and sex factors. Taken as
  #    integers, both factors can be either 1 or 2. We use this to
  #    pick a color value from a vector of four colours. The first factor
  #    is transformed to (0, 2) , the second is (1,2), the index to get
  #    a color from the colSet vector is obtained by adding the two.
  
  colSet <- c("red", "red4", "chartreuse2", "green4", "royalblue", "darkblue")
  colIndex <- ((as.integer(groupname) - 1) * 2) + as.integer(sex)
  crabCols <- adjustcolor(colSet[colIndex], alpha.f = 0.7)
  
  # 2. create a vector of plotting characters. M: 0; F: 1
  pchSet <- c(15, 16)
  crabPch <- pchSet[as.integer(sex)]
  
  # 3. create a scale vector from sMin to sMax
  sMin <- 2
  sMax <- 4
  crabCex <- (age - min(age)) / (max(age) - min(age)) # transform to [0, 1]
  ### standard way to transform values
  crabCex <- crabCex * ((sMax - sMin) + sMin)         # scale to [sMin, sMax]
  
  # 4. Plot ...
  plot(x, y,
       main = main, xlab = xlab, ylab = ylab,
       pch = crabPch,
       col = crabCols,
       bg  = crabCols,
       cex = crabCex)
}
ibsPlot(PCA_IBS_metabolite$x[, 2], PCA_IBS_metabolite$x[, 3],
        ibs_data$Class, ibs_data[ , 4], ibs_data[ , 3],
        main = "Principal components 2 and 3 IBS Urine",
        xlab = "PC2",
        ylab = "PC3")
ibsPlot(PCA_IBS_metabolite$x[, 1], PCA_IBS_metabolite$x[, 2],
        ibs_data$Class, ibs_data[ , 4], ibs_data[ , 3],
        main = "Principal components 2 and 3 IBS Urine",
        xlab = "PC1",
        ylab = "PC2")
ibsPlot(PCA_IBS_metabolite$x[, 1], PCA_IBS_metabolite$x[, 3],
        ibs_data$Class, ibs_data[ , 4], ibs_data[ , 3],
        main = "Principal components 2 and 3 IBS Urine",
        xlab = "PC1",
        ylab = "PC3")
summary(PCA_IBS_metabolite)
plot(PCA_IBS_metabolite)
head(PCA_IBS_metabolite$x)
str(PCA_IBS_metabolite$x)
