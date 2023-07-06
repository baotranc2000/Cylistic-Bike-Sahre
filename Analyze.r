#First, check the cleaned data frame and summarised detail of cleaned dataset
str(tripdata_cleaned)
summary(tripdata_cleaned)

1. RIDE SUMMARY OF EACH USER TYPE

#COMPARISON BETWEEN MEMBERS CAUSAL RIDERS
ride_summary <- tripdata_cleaned %>%
  group_by(member_casual) %>% 
  summarise(total_rides = n(),
            total_rides_length = sum(ride_length),
            average_ride_length = mean(ride_length),
            median_length = median(ride_length), 
            max_ride_length = max(ride_length),
            min_ride_length = min(ride_length)) %>%
  mutate(ride_percentage = total_rides/sum(total_rides) *100)
ride_summary

2.COMPARISON TOTAL AND AVERAGE RIDE LENGTH OF EACH USER TYPE BY DAY OF MONTH
# First lets fix the days of the week order.
tripdata_cleaned$month <- ordered(tripdata_cleaned$month, 
                                  levels=c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

# Calculate total number of rides and average ride length by user type and month
rides_by_month <- tripdata_cleaned %>% 
  group_by(month, member_casual, ) %>%  
  summarise(number_of_rides = n(), average_ride_length = mean(ride_length), .groups="drop") %>% 
  arrange(month, member_casual)
rides_by_month

3. COMPARISON TOTAL AND AVERAGE RIDE LENGTH OF EACH USER TYPE BY DAY OF WEEK
#Fix the days of week
tripdata_cleaned$day_of_week <- ordered(tripdata_cleaned$day_of_week, 
                                        levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
#Total rides and average ride by day of week for each user type
rides_by_day_of_week <- tripdata_cleaned %>%
    group_by(day_of_week, member_casual) %>%
    summarise(rides_by_day = n(), average_ride_length = mean(ride_length))

rides_by_day_of_week

4. CALCULATE PEEK PER HOUR IN A DAY AND PEEK RIDE PER HOUR IN A DAY BY DAY OF WEEK
#Calculate peek ride by hour
peak_ride_hours <- tripdata_cleaned %>%
  group_by(member_casual,start_time) %>%
  summarise(ride_count = n()) %>%
  arrange(start_time,member_casual)
peak_ride_hours

5. CYCLISTIC ANALYSIS BY LOCATION
# top 5 start station for all user
 tripdata_cleaned %>%
    count(start_station_name) %>%
    arrange(desc(n)) %>%
    head(n=5)
