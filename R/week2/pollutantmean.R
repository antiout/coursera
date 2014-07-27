pollutantmean <- function(directory, pollutant, id = 1:332) {
  means = NULL
  for ( i in id ) {
    f <- sprintf("%s/%0.3d.csv", directory, i)
    d<-read.csv(f)
    if ( is.null(means) ) {
      means = d[,pollutant]
    } else {
      means = c(means, d[,pollutant])
    }
  }
  mean(means, na.rm=TRUE)
}
