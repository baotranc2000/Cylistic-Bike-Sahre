Before we start analyzing, it is necessary to make sure data is clean, free of error and in the right format
#WRANGLE DATA, CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
##Check the combined data frame
#Following code chunks

# View the first few rows of combined_data
head(tripdata)
# View the last few rows of combined_data
tail(tripdata)
#Get an overview of the data structure
str(tripdata)
# Use glimpse() for a more readable overview of the data structure
glimpse(tripdata)
# Use summary() to get a statistical summary of the data
summary(tripdata)

#Adding date, month, year, day of week columns and converting ride_length to numeric
tripdata <- tripdata %>%
  mutate(year = format(started_at, "%Y"),# extract year 
         month = format(started_at, "%B"),#extract month
         date = format(started_at, "%d"),# extract date
         day_of_week = format(started_at, "%A"),# extract day of week
         ride_length = as.numeric(difftime(ended_at, started_at, units = "min")),
         start_time = format(started_at, "%H"))

#check ride_length is in the right format
is.numeric(tripdata$ride_length)

##Remove bad data
#The dataframe includes a few hundred entries when bikes were taken out of docks 
#check for quality ride_length was negative or 'zero'
tripdata_cleaned <- tripdata[!tripdata$ride_length <= 0, ]
#Remove NA's value
tripdata_cleaned <- na.omit(tripdata_cleaned)
