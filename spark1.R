# Note that I am working on a mac, the only difference I could imagine 
# is the path I use to access the CDR_Sample.csv file. 

#install sparklyr if you haven't already
install.packages("sparklyr")

# connect to the local spark cluster
library(sparklyr)
sc <- spark_connect(master = "local")

# Load dplyr
library(dplyr)

# Upload the desired csv file to R as a dataframe. I am using
# CDR_Sample.csv. 
library(readr)
R_table <- read_csv("Desktop/CDR_Sample.csv")

#Convert this R dataframe into a Spark dataframe
S_table <- copy_to(sc, R_table)

# View the table
S_table

