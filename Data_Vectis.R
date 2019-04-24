
movies1<-read.csv(file='C:/Users/TOSHIBA PC/Downloads/technical-test_data-scientist_evaluation_ratings.csv',sep=',')
movies2<-read.csv(file='C:/Users/TOSHIBA PC/Downloads/technical-test_data-scientist_movies_metadata.csv',sep=',')
library(sqldf)
library(reshape)
attach(movies1)
library(dplyr)
library(data.table)
View(movies2)
#Association rules
##Preprocessing the data: preparing   
userId<-as.character(userId)
movieId<-as.character(movieId)
names<-toString(names(movies1))
freq<- data.table(movies1)[,list(count= .N),by= names(movies1)]
hh<-cast(freq,userId~movieId,sum,value='count')


new<-as.data.frame(movies2[,c(4,6)])
attach(new)
movies<-sqldf("select userId, movieId, genres from movies1 INNER JOIN new ON movies1.movieId=new.id")
View(movies)
frequ<- data.table(movies)[,list(count= .N),by= names(movies)]
freqy<-as.data.frame(frequ)
attach(freqy)
library(sparklyr)
spark_install(version="2.1.0")
sc<-spark_connect(master = "local")

final_movies<-cast(freqy,userId~genres,sum,value='count')
summary(final_movies)






In<-as.data.frame(levels(nouvelle$Individu))
extraiti=subset(nouvelle,nouvelle$Individu==In[1,])
extraiti<-t(extraiti[,-2])
extraiti<-data.table(extraiti)
for(i in 2:300){
  extraiti2<-subset(nouvelle,nouvelle$Individu==In[i,])
  extraiti2<-t(extraiti2[,-2])
  extraiti2<-data.table(extraiti2)
  this<-list(extraiti,extraiti2)
  extraiti<-rbindlist(this,use.names=T,fill=T, idcol=F)
  
}

Interests<-as.data.frame(levels(periode1$Site))
Frequence1=data.frame(0,300,41)


for(i in 1:300){
  rep1<-as.data.frame(table(t(extraiti[i,])))
  myInterests<-as.character(rep1$Var1)
  for(k in 1:41){
    value<-is.na(match(Interests[k,],myInterests))
    z<-match(Interests[k,],myInterests)
    if(value=="TRUE") {Frequence1[i,k]<-0
    }else {Frequence1[i,k]<-rep1$Freq[z]}
  }
  
}

names(Frequence1)<-levels(periode1$Site)
View(Frequence1)
#write.table(Frequence1,'C:/Users/TOSHIBA PC/Desktop/Frequency.csv')



