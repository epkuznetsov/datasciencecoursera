polutantmean <- function(directory, pollutant, id = 1:332){
        
        setwd(directory)
        
        # get a list of files to be processed
        filelist <- list.files(directory, pattern = "*.csv")
        
        # init dataCSV frame
        dataCSV <- data.frame()
        
        # read data to a vector to be processed
        for (i in id) {
                rowCSV <- read.csv(filelist[i], header = TRUE)[pollutant]
                dataCSV <- rbind(dataCSV, rowCSV)
        }
        
        #calculate mean values for appropriate pollutant
        colMeans(dataCSV, na.rm = TRUE)
}