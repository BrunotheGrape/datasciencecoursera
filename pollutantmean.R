pollutantmean <- function(directory, pollutant, id = 1:332) { #creates function
        list_files <- list.files(directory, full.names = TRUE) # creates a list of table names
        pol <- data.frame() # creates a data frame
        for (i in id) {
                pol <- rbind(pol, read.csv(list_files[i])) # combines the indicated data in the data frame "pol"
        }
        pol_subset <- pol[which(pol[ , "ID"] %in% id), ] #creates a subset of pol called "pol_subset that incudes the data tables indicated by the "id" input
        mean(pol_subset[ , pollutant], na.rm = TRUE) #gives the mean of the column in "pol_subset" whose column header is indicated by the "pollutant" entered
}


