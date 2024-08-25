
fom<-read.csv("Weather_Data.csv",header =T,sep = ";")

fom

install.packages("FactoMineR")
library(FactoMineR)



fom.c<- scale(fom, center = TRUE, scale = TRUE)
res<-PCA(fom.c)

R <- cor(fom)

round(res.PCA$var$cos2,2)

