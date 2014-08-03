# coursera week 2 programming assignment 1
rm(list=ls())
complete <- function(directory, id = 1:332) {
  setwd(directory)
  con <- pipe(paste("ls", directory))
  filelist <- readLines(con)
  close(con)
  loop_count <- 0
   # read through files specified by 'id'
  for (i in id) {
      each <- data.frame(id = i, nobs = sum(complete.cases(read.csv(filelist[i]))))
      loop_count <- loop_count + 1
      if (loop_count == 1) {
        agg <- each
        } else
      {
        agg <- rbind(agg, each)
      }
  }
  return(agg)
}