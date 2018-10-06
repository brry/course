knit_course <- function() knitPres::knit_hand_pres("RcourseBerry.Rnw", presname=" pres")

clean_course <- function() unlink(c("uni.html","README.html"))

unlink(c(
"Test-concordance.tex", 
"Test.nav", 
"Test.snm", 
"Test.synctex.gz", 
"Test.toc", 
"Test.vrb"))

if(.Platform$OS.type=="unix") 
{
.libPaths("/home/berry/R/libBerry/")
if(requireNamespace("installB", quietly=TRUE)) installB::loadPackages(ask=FALSE)
}

