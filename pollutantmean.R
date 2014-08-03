# coursera week 2 programming assignment 1
rm(list=ls())
pollutantmean <- function(directory, pollutant, id = 1:332) {
  setwd(directory)
  con <- pipe(paste("ls", directory))
  filelist <- readLines(con)
  close(con)
  # determine column data types
  data_extract <- numeric()
  # read through files specified by 'id'
  for (i in id) {
    data_extract <- c(data_extract, read.csv(filelist[i])[[pollutant]])
    }
  round(mean(data_extract, na.rm=TRUE),3)
}