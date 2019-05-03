library(reshape)
library(data.table)
Importmovies<-read.csv(file="C:/Users/TOSHIBA PC/Desktop/Data/MoviesData.csv")
names<-toString(names(movies))
freq<- data.table(movies)[,list(count= .N),by= names(movies)]
#freq_genre<-cast(freq,userId~genres,sum,value='count') Error: cannot allocate vector of size 1.1 Gb
memory.limit(4100)
gc()
library(bigmemory)
freq_genre<-as.big.matrix(cast(freq,userId~genres,sum,value='count'))
View(freq_genre)
#Association rules
##Preprocessing the data: preparing   
userId<-as.character(userId)
movieId<-as.character(movieId)

