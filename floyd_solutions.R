# there are more correct solutions than just mine!

reed_data <- read.table("data/floyd.txt", header=T, sep="\t", skip=2, 
                        na.stri="forgot to log, sorry professor")
str(reed_data)
# 'data.frame':	6 obs. of  4 variables:
#  $ Site         : Factor w/ 4 levels "H1","H3","K2",..: 1 1 2 1 4 3
#  $ moisture     : Factor w/ 3 levels "dry","moist",..: 3 2 2 1 NA 3
#  $ plant.height : int  154 120 173 134 143 167
#  $ stem_diameter: num  1.8 0.95 2.6 1.25 1.35 2.7

# NA badly encoded, Space in column name, Units / allowed categories missing in meta-data

# Data + Object types: see slide 'Overview: data types' et seq.

c(pi, "pi") # converts all numerics to character (see order of coercion)
# hence you cannot compute with it anymore

chemics <- data.frame(Location=c("H1","H2","H3","K1"), Carbon=c(29,45,36,31),
                      Salinity=c(87,93,76,75))

reedchem <- merge(reed_data, chemics, by.x="Site", by.y="Location", all=TRUE)
plot(reedchem$Carbon, reedchem$plant.height)

par(mfrow=c(3,2), mar=c(2, 2, 1.5, 0.1), mgp=c(2, 0.7, 0), las=1)
for(cn in colnames(reedchem[,-(1:3)]))
  plot(reedchem[, c("plant.height", cn)], main=cn, 
       col=ifelse(reedchem[,cn]>=20, "pink", "black"))
