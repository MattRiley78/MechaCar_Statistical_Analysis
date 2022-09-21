## DELIVERABLE 1 ##
library(dplyr)
MC_mpg <- read.csv(file='MechaCar_mpg.csv' ,check.names=F,stringsAsFactors = F)
mpg_MLC <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MC_mpg)
summary(mpg_MLC)

## DELIVEREABLE 2 ##
sus_coil <- read.csv(file='Suspension_Coil.csv' ,check.names=F,stringsAsFactors=F)
total_summary <- sus_coil  %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')
lot_summary <-  sus_coil %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

## DELIVERABLE 3 ##
t.test(sus_coil$PSI,mu=1500)
t.test((subset(sus_coil,Manufacturing_Lot=='Lot1')$PSI),mu=1500)
t.test((subset(sus_coil,Manufacturing_Lot=='Lot2')$PSI),mu=1500)
t.test((subset(sus_coil,Manufacturing_Lot=='Lot3')$PSI),mu=1500)
