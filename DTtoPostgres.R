#optional pre-function DT check
#View(Derived)

#Trim column names into postgres-suitable format
dbSafeNames = function(names) {
  names = gsub('[^a-z0-9]+','_',tolower(names))
  names = make.names(names, unique=TRUE, allow_=TRUE)
  names = gsub('.','_',names, fixed=TRUE)
  names
}
#append DT column names
colnames(Derived) = dbSafeNames(colnames(Derived))

#optional data check 
#summary(Derived)

#load dependencies
library(RPostgreSQL)
pg = dbDriver("PostgreSQL")

#instantiate db connection
con = dbConnect(pg, user="Mike", password="***",
                host="localhost", port=5432, dbname="ProTECT")
dbWriteTable(con,'derived',Derived, row.names=TRUE)