library(ggplot2)
library(dplyr)
library(RODBC)

bleedrisk <- data.frame(riskscore = seq(0,210,5)
                        ,source = 'predicted'
                        ,rate = c(0.9,1.10,1.30,1.50,1.70,2.00,2.30,2.70,3.10,3.60,4.20,4.90,5.60,6.50,7.50,8.60,9.90,11.40,13.10,14.90,17.00,19.30,21.80,24.60,27.50,30.70,34.10,37.60,41.30,45.10,49.00,52.80,56.60,60.40,64.00,67.50,70.80,73.90,76.80,79.40,81.80,84.00,86.00)
                      )
db <- odbcConnect("exasol")
pci <- sqlQuery(db,paste("SELECT LOC, SCORE, RATE FROM DEV_MPL.BLEEDFACILITY;")) #PHC;"))


bleedphc <- rename(pci,"source"="LOC","riskscore"="SCORE","rate"="RATE")

bleedmerge <- full_join(bleedrisk,bleedphc)
qplot(data = bleedmerge
      ,geom = "point"
      ,x = riskscore
      ,xlab = "Risk score bin"
      ,y = rate
      ,ylab = "Bleeding rate"
      ,color = source
      ,main = "Post-PCI bleeding predicted vs actual"
)

bleedall <- sqlQuery(db,paste("SELECT ID, LOC, SCORE, BLEEDFLG FROM DEV_MPL.BLEEDALL;"))

boxplot(SCORE ~ LOC
        ,data = bleedall
        ,main = "Bleeding Risk Score Distribution by PHC Facility"
        #,horizontal = TRUE
        ,col = palette(rainbow(6)) 
        ,ylab = "Bleeding Risk Score"
        )
text(y=fivenum())