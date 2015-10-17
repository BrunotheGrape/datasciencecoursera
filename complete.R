complete <- function(directory, id = 1:332) { # creates function
        list_files <- list.files(directory, full.names = TRUE) # generates list
        com <- data.frame() # generates data frame
        comn <- data.frame(id = character(0), nob = character(0))
        comn <- c("id", "nobs") #creates column headings for matrix
        for (i in id) { # generic funtcion to read the data into the matrix
                com <- read.csv(list_files[i]) # loads data into the data frame
                com_subset <- com[which(com[ , "ID"] %in% id), ] #subsets the data frame per the entered criteria
                x <- sum(complete.cases(com_subset)) # creates variable x to contain sum of selected columns
                y <- c(i, x)  #creates y vector to select rows
                comn <- rbind(comn, y) # combines rows into the matrix comn
        }
       
        print(comn) # prints results
}
