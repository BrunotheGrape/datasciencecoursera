complete <- function(directory, id = 1:332) {
        list_files <- list.files(directory, full.names = TRUE)
        com <- data.frame()
        comn <- matrix( , 2)
        comn <- c("id", "nobs")
        for (i in id) {
                com <- read.csv(list_files[i])
                com_subset <- com[which(com[ , "ID"] %in% id), ]
                x <- sum(complete.cases(com_subset))
                y <- c(i, x)
                comn <- rbind(comn, y)
        }
       
        print(comn)
}

