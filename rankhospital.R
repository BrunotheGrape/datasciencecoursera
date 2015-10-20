

rankhospital <- function(state, outcome) { #create function
        
d1 <- as.vector(c(state, outcome)) # creates vector data from inputs

        
r <- data.frame() #establish dataframes for future use
rc <- data.frame()
bstate <- data.frame()
bhosp <- data.frame()
rcn <- data.frame()
rcs <- data.frame()



r <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", header = TRUE, colClasses = "character") #read in data file




rc <- (((r[, c(1, 2, 7, 11, 17, 23)]))) #select columns I want to use and rename the outcome columns
colnames(rc) [4] <- "heart attack"
colnames(rc) [5] <- "heart failure"
colnames(rc) [6] <- "pneumonia"
rslt <- rc[,4:6]
 


        rslt4 <- suppressWarnings(lapply(rc[4], as.numeric)) # convert outcome columns to numerics
        rslt5 <- suppressWarnings(lapply(rc[5], as.numeric))
        rslt6 <- suppressWarnings(lapply(rc[6], as.numeric))
 
        
        rc[4] <- rslt4 # replace outcome columns with new numeric versions
        rc[5] <- rslt5
        rc[6] <- rslt6
        
        
        
        rcn <- c(names(rc)) #makes data available for sort function and validation
        rcs <- unique(c(rc$State))
        
        t <- d1[1] %in% rcs # validations
        if(t == "FALSE") {stop("invalid state")}
        t <- d1[2] %in% rcn
        if(t == "FALSE") {stop("invalid outcome")}
        

        # at this point, having groomed my data, I will code the sort
        bstate <- rc[grep(d1[1], rc$State),] # selects the state
        
        
        bhosp  <- bstate[order (bstate[d1[2]], bstate$"Hospital.Name"),] # orders the outcome
        
        rk <- ave(bhosp[d1[2]], FUN=rank)
        bhosp <- cbind(bhosp, rk)
        #rt <- bhosp[1,2]
        return(bhosp)
        #return(rt)
                          


}      
      




