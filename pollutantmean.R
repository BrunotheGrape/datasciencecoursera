pollutantmean <- function(directory, pollutant, id = 1:332) {
        list_files <- list.files(directory, full.names = TRUE)
        pol <- data.frame()
        for (i in id) {
                pol <- rbind(pol, read.csv(list_files[i]))
        }
        pol_subset <- pol[which(pol[ , "ID"] %in% id), ]
        mean(pol_subset[ , pollutant], na.rm = TRUE)
}
