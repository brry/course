# Weather datasets: selection, download, processing 
# for admission test to advanced R course
# Berry Boessenkool, berry-b@gmx.de, Dec 2018

tdir <- paste0(tempdir(),"/admission_data")
dir.create(tdir)

# rdwd package ----
if(!requireNamespace("rdwd", quietly=TRUE)) install.packages("rdwd")
library(rdwd) # for selectDWD, dataDWD, readDWD, readVars, geoIndex


# select gauges and download data ----
urls <- selectDWD(res="daily", var="kl", per="recent")
set.seed(42) #  random number generator startpoint for reproducibility of 'sample'
url_sel <- sort(sample(urls, size=100))
localfiles <- dataDWD(url_sel, dir="data/DWDdata", read=FALSE)


# column names (variables) ----
columns <- unique(do.call(rbind, readVars(localfiles)))
columns <- columns[order(columns$Par),]
write.table(columns, paste0(tdir,"/columns.txt"), row.names=FALSE, quote=FALSE, sep="|")


# Geographical meta data ----
data("geoIndex")
ids <- substr(sapply(strsplit(localfiles, "KL_"), "[", 2), 1,5)
meta <- geoIndex[geoIndex$id %in% as.numeric(ids), 1:6]
write.table(meta, paste0(tdir,"/meta.txt"), row.names=FALSE, quote=FALSE, sep="|")


# read data, select columns ----
kl_data <- readDWD(localfiles)
selcols <- c("MESS_DATUM","FX","FM","RSK","SDK","SHK_TAG","NM","VPM","PM","TMK","UPM","TXK","TNK")
kl_data <- lapply(kl_data, "[", , j=selcols) # reduce data size
names(kl_data) <- ids


# manual error ----

colnames(kl_data[[20]])[1] <- "BERRY_DATUM"

# write and zip files ----
for(id in ids) write.table(kl_data[[id]], file=paste0(tdir,"/",id,".txt"), 
                           row.names=FALSE, quote=FALSE, dec=",")
owd <- setwd(tdir)
zip("S:/Dropbox/R/course/data/admission.zip", dir())
setwd(owd)


