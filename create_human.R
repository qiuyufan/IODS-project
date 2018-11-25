hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(hd)
dim(hd)
summary(hd)

str(gii)
dim(gii)
summary(gii)

colnames(hd)
names(hd)[1] <-"HDI_rank"
names(hd)[3] <-"HDI_index"
names(hd)[4] <- "LE_ab"
names(hd)[5] <-"Exp_years_Edu"
names(hd)[6] <-"mean_years_edu"
names(hd)[7] <-"GNI"
names(hd)[8] <-"GNI-HDI"

colnames(gii)
names(gii)[1] <-"GII_rank"
names(gii)[3] <-"GII_index"
names(gii)[4] <- "MM_ratio"
names(gii)[5] <-"Ad_birthrate"
names(gii)[6] <-"%parliament"
names(gii)[7] <-"edu2F"
names(gii)[8] <-"edu2M"
names(gii)[9] <-"labF"
names(gii)[10] <-"labM"
colnames(gii)

gii <- mutate(gii, ratioedu = edu2F/edu2M)
gii <- mutate(gii, ratiolab = labF/labM)
dim(gii)

library(dplyr)
human <- inner_join(hd,gii, by = c("Country"), suffix = c(".hd", ".gii"))
str(human)

