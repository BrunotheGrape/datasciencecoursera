
best <- function(state, outcome) { #create function

r <- data.frame() #establish dataframes for future use
rc <- data.frame()
r <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", header = TRUE, colClasses = "character") #read in data file


rc <- (((r[, c(1, 2, 7, 11, 17, 23)]))) #select columns I want to use and rename the outcome columns
colnames(rc) [4] <- "heart attack"
colnames(rc) [5] <- "heart failure"
colnames(rc) [6] <- "pneumonia"
rslt <- rc[,4:6]

        rslt4 <- lapply(rc[4], as.numeric) # convert outcome columns to numerics
        rslt5 <- lapply(rc[5], as.numeric)
        rslt6 <- lapply(rc[6], as.numeric)
        
        rc[4] <- rslt4 # replace outcome columns with new numeric versions
        rc[5] <- rslt5
        rc[6] <- rslt6
        
        # at this point, having groomed my data, I will code the sort
        bstate <- rc[grep("AL", rc$"State"),] # selects the state
        bhosp  <- bstate[order (bstate$"heart attack"),] # orders the outcome
        return(bhosp)
                          


}      
      

rc[1:6, 4]
b <- rc[4]
class(b)
b <- as.numeric.factor(b)
cr[1:5,]
