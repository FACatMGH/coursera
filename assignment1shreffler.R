# coursera week 2 programming assignment 1
rm(list=ls())
pollutantmean <- function(directory = getwd(), pollutant, id = 1:332) {
  setwd(directory)
  con <- pipe(paste("ls", directory))
  filelist <- readLines(con)
  close(con)
  # determine column data types
  data_extract <- numeric()
  # read through files specified by 'id'
  for (i in id) {
#    con <- file(filelist[i])
    data_extract <- c(data_extract, read.csv(filelist[i])[[pollutant]])
#    close(con)
    }
  round(mean(data_extract, na.rm=TRUE),3)
}