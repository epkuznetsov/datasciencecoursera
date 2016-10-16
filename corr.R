corr <- function(directory, threshold = 0){
        
        # set new working directory
        setwd(directory)
        
        # calculate overall complete cases
        cmpl_cases <- complete(directory)
        
        # filter complete cases by threshold
        flt_cases <- subset(cmpl_cases, nobs > threshold)

        # init data frame for correlation calculations
        dataCOR <- data.frame()

        # get a list of files to be processed
        filelist <- list.files(directory, pattern = "*.csv")

        # get the boundary of calculations
        id <- flt_cases$id

        # read data to a data frame to be processed
        for (i in id) {
                from_file <- read.csv(filelist[i], header = TRUE)

                # omit NA
                refined <- na.omit(from_file) 
                
                 # calculate correlation
                cor_res <- cor(refined$sulfate, refined$nitrate)
                
                # add appropriate data to data frame by rows
                dataCOR <- rbind(dataCOR, cor_res)
        }
        
        dataCOR
}