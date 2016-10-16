complete <- function(directory, id = 1:332){
        
        setwd(directory)
        
        # get a list of files to be processed
        filelist <- list.files(directory, pattern = "*.csv")
        
        # init dataCSV frame for id & nobs
        dataCSV <- data.frame()
        
        # read data to a data frame to be processed
        for (i in id) {
                from_file <- read.csv(filelist[i], header = TRUE)
                
                # omit NA
                distilled <- na.omit(from_file) 
                
                # count amount of the rows 
                row_count <- nrow(distilled)
                
                # and save the results
                dataCSV <- rbind(dataCSV, c(i, row_count))
        }
        
        # set column names
        colnames(dataCSV) <- c("id", "nobs")
        
        # return results
        dataCSV
}