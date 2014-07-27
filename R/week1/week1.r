setwd("/home/timout/proj/coursera/R")

x <- 4
class(x)

x <- c(4, "a", TRUE)
x
class(x)

x <- list(2, "a", "b", TRUE)
x[[2]][1]

x <- 1:4
y <- 2
class(x + y)

x <- c(3, 5, 1, 10, 12, 6)
x[x<6] <- 0
x 



x <- 1:4 
y <- 2:3
x+y

x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)


data<-read.csv("week1/hw1_data.csv")
names(data)
data[1:2,]
nrow(data)
data[(nrow(data)-1):nrow(data),]
data["Ozone"] == NA
data$Ozone[47]
ozone<-data["Ozone"]
ozone
bad<-is.na(ozone)
ona <- ozone[bad]
ona
length(ona)
mean(ozone[!bad])

good<-complete.cases(data)
clean <- data[good,]
mean(clean[clean$Ozone>31 & clean$Temp>90,]$Solar.R)
mean(clean[clean$Month==6,]$Temp)

mean(data[data$Month==6,]$Temp)

max(data[data$Month==5,]$Ozone)
max(clean[clean$Month==5,]$Ozone)

y<-rnorm(1000)
z<-rep(NA,1000)
my_data <-sample(c(y,z),100)
my_data
my_data[is.na(my_data)]
y<-my_data[!is.na(my_data)]
y
y[y>0]
my_data[ ! is.na(my_data) & my_data >0 ]

my_data[c(3,5,7)]
my_data[c(-2,-10)]
my_data[-c(2,-0)]

#Selection: 6
my_vector<-1:20
dim(my_vector)
length(my_vector)
dim(my_vector)<-c(4,5)
attributes(my_vector)
my_vector
class(my_vector)
my_matrix <- my_vector
my_matrix2<-matrix(data=1:20,nrow=4,ncol=5)
identical(my_matrix,my_matrix2)
patients<-c("Bill", "Gina", "Kelly","Sean")
cbind(patients,my_matrix)
my_matrix)
my_data<-data.frame(patients,my_matrix)
class(my_data)
cnames<-c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data)
colnames(my_data) <-cnames
my_data



