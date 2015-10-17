
        

corr <- function(directory, threshold = 0, id = 1:332) { #creates function
        list_files <- list.files(directory, full.names = TRUE) #creates data frame to recieve variables
        pol <- data.frame()# At this point I create all the data frames I will need going forward
        rslt <- data.frame()
        cr <- data.frame()
        for (i in id) { #This function tests each table for the threshold 
                
                pol <- read.csv((list_files[i]))
                q <- sum(complete.cases(pol))
                if (q > threshold) { #This function calculates the correlation fortables that pass the threshold test and adds the results to dataframe "cr"
                        cr <- rbind(cr,cor(pol[, 2], pol[3], use = "pairwise.complete.obs"))
                        
                }
                
        }
        
        x <-cr[1:6, ] #these lines manage the output
        print(x)
        names(cr) <- ""
        summary(cr)
       
}



