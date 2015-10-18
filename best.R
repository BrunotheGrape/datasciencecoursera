for (i in 1:10) {
r <- data.frame()
rc <- data.frame()
r <- read.table("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", header = TRUE, sep = ",",  stringsAsFactors = FALSE)


rc <- (((r[, c(1, 2, 7, 11, 17, 23)])))
colnames(rc) [4] <- "heart attack"
colnames(rc) [5] <- "heart failure"
colnames(rc) [6] <- "pneumonia"


        rslt <- c(rslt, as.numeric(as.character(rc[i, 4])))


        
      
}


best <- function(state, outcome = "heart attack") {
        
        
}
rc[1:6, 4]
b <- rc[4]
class(b)
b <- as.numeric.factor(b)
cr[1:5,]
