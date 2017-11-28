library("ggplot2")
library("dplyr")
bleedrisk <- data.frame(riskscore = seq(0,210,5)
                        ,source = 'predicted'
                        ,rate = c(0.9,1.10,1.30,1.50,1.70,2.00,2.30,2.70,3.10,3.60,4.20,4.90,5.60,6.50,7.50,8.60,9.90,11.40,13.10,14.90,17.00,19.30,21.80,24.60,27.50,30.70,34.10,37.60,41.30,45.10,49.00,52.80,56.60,60.40,64.00,67.50,70.80,73.90,76.80,79.40,81.80,84.00,86.00)
                        )
bleedphc <- data.frame(riskscore = seq(0,170,5)
                       ,source = 'actual'
                       ,rate = c(0.26,1.15,0.72,1.18,1.42,1.65,1.94,2.38,3.43,2.90,3.11,3.87,3.99,3.85,4.56,5.54,5.97,9.30,8.05,12.44,14.21,16.78,25.00,33.72,29.85,22.64,34.09,52.17,52.63,36.36,47.06,71.43,80.00,36.36,100)
                       )
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
