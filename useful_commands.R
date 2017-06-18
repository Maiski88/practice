#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# This file contains useful commands to get started with R
# Choices are solely based on my experience
# ==========================
#  Date: June 18th, 2017
#  Authur: Mai Yamamoto










#shortcuts to work efficiently on keyboard
#https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts

## Excute command
Ctrl + Enter

## adding comments 
Ctrl + Shift + C

## Adding and removing multiple tabs
### Select the section first
Tab
Tab + Shift

# randomly generates 500 normally distributed numbers with mean 0, standard deviation 1
set.seed(2707)
x1 <- rnorm(500, 0, 1)
y1 <- rnorm(500, 0, 1)

############# useful commands #################################################
#1 Setting up the environment 
getwd()
setwd()

#2 Check which packages are already installed and available 
library()
search()

#3 If the packages are available on CRAN, use this.
install.packages("")

## check which version of packages are installed 
pkgs <- as.data.frame(installed.packages(), stringsAsFactors = FALSE, row.names = FALSE)
pkgs[, c("Package", "Version", "Built")]

if (!require(sos, quietly=TRUE)) {
  install.packages("sos")
  library(sos)
}

findFn("scatter plot")

#4 Check the structure of data 
head(x1)
tail(x1)
str(x1)
summary(x1)

#5 Getting help: two different ways 
?rnorm
help("rnorm")

#6 Install data into the environment: csv
ibs <- read.csv("ibs.csv")

#7 Check the data structure
str(ibs)
class(ibs)
colnames(ibs)
nrow(ibs)
ncol(ibs)

#8 Subset the data
ctl_lysine <- ibs$lysine[1:20]

#9 modify data
ibs$lysine <- scale(ibs$lysine)
head(ibs$lysine)

#10 output data 
write.csv(ibs, file = "modified_ibs.csv")
