#insert tables into local postgres database from list of csv files and table names
#used to read ProTECT III data into db
#M.Lunney 2.18.17

#set appropriate R working directory
setwd("/Users/Mike/P3Rebuilt/original_csv")

#load R/postgres interface
library(RPostgreSQL)
pg = dbDriver("PostgreSQL")

#set and check connection *** <- password string
con = dbConnect(pg, user="Mike", password="***",
    host="localhost", port=5432, dbname="ProTECT")

#create function to make postgres safe column names
dbSafeNames = function(names) {
  names = gsub('[^a-z0-9]+','_',tolower(names))
  names = make.names(names, unique=TRUE, allow_=TRUE)
  names = gsub('.','_',names, fixed=TRUE)
  names
}

#read file list reference table
DCFTableRef <- read.csv("dcf_table_reference.csv", header = FALSE)

#create vector of origin file names
originvector <- as.vector(DCFTableRef[,1])

#create vector of destination table names
destinationvector <- as.vector(DCFTableRef[,2])
  
#start looping through vectors
for(i in 1:29) 
  {
  #set origin filename from originvector
  originfile <- originvector[i]
  
  #create origin data frame from originfile
  origin <- read.csv(originfile, header = TRUE) 

  #set safe column names
  colnames(origin) = dbSafeNames(colnames(origin))
 
  #create destination table name string from destinationvector
  destination <- destinationvector[i]
  toString(destination)
  
  #insert current iteration into postgres table
  dbWriteTable(con,destination,origin, row.names=TRUE)
  
  #loop to next i
  next()
}
print('files successfully inserted into db tables')
