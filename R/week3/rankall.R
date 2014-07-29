rankall <- function(outcome, num="best") {
  #validate outcome
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  
  # validate the num value num%%1 = mod
  if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num") 
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"

  states <- data[, 2]
  states <- unique(states)
  
  data <- data[data[outcome] != 'Not Available', ]
  
  # Order the data
  data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
  data <- data[order(data$name, decreasing = FALSE), ]
  data <- data[order(data[outcome], decreasing = FALSE), ]

  # For each state, find the hospital of the given rank
  newdata <- data.frame("hospital"=character(), "state"=character())
  for(s in states) {
    sdf <- data[data$state==s, ]
    values <- sdf[, outcome]
    if( num == "best" ) {
      rowNum <- which.min(values)
    } else if( num == "worst" ) {
      rowNum <- which.max(values)
    } else {
      rowNum <- num
    }
    h <- sdf[rowNum, ]$name
    newdata <- rbind(newdata, data.frame(hospital=h, state=s))
  }
  
  # Return a data frame with the hospital names and the (abbreviated) state name
  newdata[order(newdata['state'], decreasing = FALSE), ]
}