
movies1<-read.csv(file='C:/Users/TOSHIBA PC/Desktop/Data/technical-test_data-scientist_evaluation_ratings.csv',sep=',')
movies2<-read.csv(file='C:/Users/TOSHIBA PC/Desktop/Data/metadata.csv',sep=';')
library(sqldf)
attach(movies2)
attach(movies1)
movies<-sqldf("select userId,  genres from movies1 INNER JOIN movies2 ON movies1.movieId=movies2.id")
write.csv(movies,"C:/Users/TOSHIBA PC/Desktop/Data/MoviesData.csv")



