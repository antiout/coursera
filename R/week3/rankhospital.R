rankhospital <- function(state, outcome, num="best") {
  #validate outcome
  outcomes = c("heart attack", "heart failure", "pneumonia")
  if( outcome %in% outcomes == FALSE ) stop("invalid outcome")
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  data <- data[c(2, 7, 11, 17, 23)]
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  #validate the state
  states <- data[, 2]
  states <- unique(states)
  if( state %in% states == FALSE ) stop("invalid state")
  
  # validate the num value num%%1 = mod
  if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num") 
  
  data <- data[data$state==state & data[outcome] != 'Not Available', ]
  
  # Order the data
  data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
  data <- data[order(data$name, decreasing = FALSE), ]
  data <- data[order(data[outcome], decreasing = FALSE), ]
  
  # Process the num argument
  vals <- data[, outcome]
  if( num == "best" ) {
    rowNum <- which.min(vals)
  } else if( num == "worst" ) {
    rowNum <- which.max(vals)
  } else {
    rowNum <- num
  }
  # return hospital name in that state with lowest 30-day death rate
  data[rowNum, ]$name
}