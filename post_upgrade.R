### Keeping R and Rstudio up to date
## Command for terminal - Ubuntu
# sudo su
# echo "deb http://www.(whatever repository for R)
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
# apt-get update
# apt-get upgrade 

### Update packages after updating R 
update.packages(ask = FALSE, checkBuilt = TRUE)

# Check if packages are built on the current version of R
pkgs <- as.data.frame(installed.packages(), stringsAsFactors = FALSE, row.names = FALSE)
pkgs[, c("Package", "Version", "Built")]
getwd()
list.files()

# Check which packages are installed
library()
# Check which packages are actually loaded
search()

# Practice with loaded package "seqinr" 
library(seqinr)
data(package = "seqinr")
data(aaindex)
?aaindex
aaindex$ANDN920101
aaindex$PONJ960101
## Plot amino acid codes by hydrophobicity and volume 
plot(aaindex$FASG890101$I,
     aaindex$PONJ960101$I, 
     xlab="hydrophobicity", ylab="volume", type="n")
text(aaindex$FASG890101$I, 
     aaindex$PONJ960101$I, 
     labels=a(names(aaindex$FASG890101$I)))

choosebank("swissprot")
mySeq <- query("mySeq", "N=MBP1_YEAST")
mbp1 <- getSequence(mySeq)
closebank()
x <- AAstat(mbp1[[1]])
barplot(sort(x$Compo))

# Useful tool to find out a suitable function contained in a particular package
if (!require(sos, quietly=TRUE)) {
  install.packages("sos")
  library(sos)
}
## Example code to use "sos" 
findFn("moving average")

# Practice with seq()
seq(-5, 3)
sequence1 <- seq(-2, 2, by = 1/3)
seq(length.out = 30, 1, 100)

objectInfo(3.0)
