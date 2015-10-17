
        

corr <- function(directory, threshold, id = 1:332) {
        list_files <- list.files(directory, full.names = TRUE)
        pol <- data.frame()
        rslt <- data.frame()
        cr <- data.frame()
        b <- data.frame()
        for (i in id) {
                pol <- read.csv((list_files[i]))
                q <- sum(complete.cases(pol))
                if (q > threshold) {
                        #rslt <- c(cor(pol[, 2], pol[3], use = "pairwise.complete.obs"))
                        #rslt <- rbind(rslt,q)
                        #pol <- (rbind(pol, read.csv(list_files[i])))
                        cr <- rbind(cr,cor(pol[, 2], pol[3], use = "pairwise.complete.obs"))
                        #cr <- rbind(cr, b)
                        
                }
                
        }
        ##pol_subset <- (pol[which(pol[ , "ID"] %in% id), ])
        ##b <- cor(pol_subset[, 2], pol_subset[3], use = "pairwise.complete.obs")
        x <-cr[1:6, ]
        print(x)
        summary(cr)
        ##print(b)

}



