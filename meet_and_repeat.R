#1
BPRS<- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
str(BPRS)
summary(BPRS)
colnames(BPRS)
#The BPRS data frame has 40 observations and 11 variables. The variables are all integer values. 
#It is in wide form since each subjects are measured for a consecutive 8 weeks. Two treatment groups
#are measured. 

RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep = "", header = T)
str(RATS)
summary(RATS)
colnames(RATS)
#RATS data frame has 16 observations and 13 variables. It is similar to the BPRS that two groups
#are measured at different time points. 

#2.
library(dplyr)
library(tidyr)
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
RATS$Group <- factor(RATS$Group)
RATS$ID <- factor(RATS$ID)

#3
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))
glimpse(BPRSL)
RATSL <-  RATS %>% gather(key = WDs, value = rats, -Group, -ID)
RATSL <-  RATSL %>% mutate(Time = as.integer(substr(WDs,3,4)))
glimpse(RATSL)

#4
str(BPRSL)
summary(BPRSL)
colnames(BPRSL)
#
#Now the data frame has 360 observations and 5 variables. There are no wide week columns at different weeks. Instead, 
#they are all stacked into weeks columns. The data is arraged as each subject, assigned at different group, 
#have one specific value. In this long format, each row is one time point for each subject.
#So each subject have data in multiple rows. 

str(RATSL)
summary(RATSL)
colnames(RATSL)
#The same change can be applied to this dataset.First of all, the columns(wide) decrease to 5, instead the rows increase to 176(become longer)
#Now the dataframe shows the subjects(ID) assigned to specific group different rats value at different time points. The long form data shows that any variables that do not change
#across time will have the same value in all the rows, such as ID, and groups in this case. 




