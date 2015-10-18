r <- read.csv("outcome-of-care-measures.csv", header = TRUE)
r[,1:6]
str(r)
names(r)
r[,7]
r[c(2, 7, 11)]
a <- r[2]
b <- r[7]
c <- r[11]
d <- cbind(a, b)
d <- cbind(d, c)
d[1:6,]
a
b
c
