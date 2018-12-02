human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
str(human)
dim(human)
#This data is human development index from 195 countries. They are ranked based on the key dimensions of human development, 
#such as life expectation, education, incomes etc. 

#1. mutate the data
library(stringr)
str(human$GNI)
human$GNI <- str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric


#2. Exclude unneeded variables
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))
colnames(human)

#3. remove all rows with missing values
complete.cases(human)
data.frame(human[-1], comp = complete.cases(human))
human_ <- filter(human, complete.cases(human))

#4. Remove the observations which relate to regions instead of countries
tail(human_, 10)
last <- nrow(human_) - 7
human_ <- human_[1:last, ]

#5.define row names by country names and remove it
rownames(human_) <- human_$Country
keep2 <- c("Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human_<- select(human_, one_of(keep2))
