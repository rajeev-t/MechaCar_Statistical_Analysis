library(dplyr)
mpg_df <- read.csv('data/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
lm.mpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_df)
summary(lm.mpg)

coil_df <- read.csv('data/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
summary_total <- coil_df %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
summary_lot <- coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

t.test(coil_df$PSI, mu = 1500)
t.test(subset(coil_df,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(coil_df,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(coil_df,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)
