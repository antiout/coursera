complete <- function(directory, id = 1:332) { 
  nobs<-numeric(length(id))
  m <- 1
  for ( i in id ) {
    f <- sprintf("%s/%0.3d.csv", directory, i)
    d<-read.csv(f)
    cc<-complete.cases(d)
    clean <- d[cc,]
    nobs[m] <-nrow(clean)
    m<-m+1
  }
  data.frame(id=c(id),nobs=c(nobs))
}
