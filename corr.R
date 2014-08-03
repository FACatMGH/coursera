# coursera week 2 programming assignment 1
rm(list=ls())
corr <- function(directory, threshold) {
  setwd(directory)
  con <- pipe(paste("ls", directory))
  filelist <- readLines(con)
  close(con)
  corr_vector <- numeric()
   # read through files specified by 'id'
  for (i in 1:length(filelist))
    {
    # check for complete cases threshold
    if (sum(complete.cases(read.csv(filelist[i]))) >= threshold)
      {
      corr_vector[i] <- cor(read.csv(filelist[i])$sulfate, read.csv(filelist[i])$nitrate, use = "complete.obs")
      }
    }
    return(round(corr_vector[!is.na(corr_vector)], 5))
 }