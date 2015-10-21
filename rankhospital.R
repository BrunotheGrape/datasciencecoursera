

rankhospital <- function(state, outcome, num = "best") { #create function
        
d1 <- as.vector(c(state, outcome, num)) # creates vector data from inputs
msg <- c(NA)
        
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
        if ((num > nrow(bhosp)) & (num != "worst") & (num != "best")) return(msg) else
        
        
        
        

        # at this point, having groomed my data, I will code the sort
        bstate <- rc[grep(d1[1], rc$State),] # selects the state
        
        
        bhosp  <- bstate[order (bstate[d1[2]], bstate$"Hospital.Name", na.last = NA),] # orders the outcome and removes NAs
       
        if (num == "best") {d1[3] <- 1} # define "best" and "worst
        if (num == "worst") {d1[3] <- nrow(bhosp)}
            
        bhosp$rank <- 1:nrow(bhosp) # groom output
        rtn <- subset(bhosp, rank == d1[3])
        rt <- c(rtn[2])
        names(rt) <- c(NULL)
        return(rtn[,2])
       
        
                          


}   
      




