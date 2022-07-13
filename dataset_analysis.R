

#loading the dataset into R :

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

filename<-"./ranking_products.csv"

download.file(fileurl,filename,method = "curl")

dt<-read.csv("ranking_products.csv", skip = 4)

#tidying the dataset : 

#quick overview of the dataset :

dim(dt)
summary(dt)

#the dimension of the dataset is 326*10 , with columns X.2,X.6:x.9 with full
#NA values , as for X.5 it only contains empty string so we remove them all

dt<-dt[,c(1,2,4,5)]

#renaming the columns  : 
names(dt)<-c("CountryCode","Ranking","CountryName","GDP")


dt$GDP<-gsub(",","",dt$GDP) %>% as.numeric(.) 


#geenrating the codebook for the dataset : 

library(tibble)

codebook<-enframe(names(dt))
descriptives<-dt %>% describe() %>% select("n","min","max","mean")

codebook<-cbind(codebook,descriptives)



