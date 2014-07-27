corr <- function(directory, threshold = 0) {
  corrs = NULL
  m <- 1
  for ( i in 1:332 ) {
    f <- sprintf("%s/%0.3d.csv", directory, i)
    d<-read.csv(f)
    cc<-complete.cases(d)
    clean <- d[cc,]
    if ( nrow(clean) > threshold ) {
      cr <- cor(clean$nitrate, clean$sulfate)
      corrs[m] = cr
      m=m+1
    }
  }
  if ( is.null(corrs) ) {
    vector(mode="numeric", length=0)
  } else {
    corrs
  }
}

