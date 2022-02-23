# SE370 22-2
# Lesson 19: dplyr


library(dplyr)
library(readr)

#The basics: Verbs are dplyr commands for manipulating data. Command structure (for all dplyr verbs): 
###first argument is a data frame, return value is a data frame, nothing is modifid in place 

#1.Pick observations by their values ( filter() ).
#2.Reorder the rows ( arrange() ).
#3.Pick variables by their names ( select() ).
#4.Create new variables with functions of existing variables ( mutate() ).
#5.Collapse many values down to a single summary ( summarise() ).
#6.Changes the scope of each function from operating on the entire dataset to operating on it group-by-group: group_by()

# We'll use the flight data provided


flights <- read_csv('Flight_Data_JAN18_Southwest_EastCoast.csv')

#-selecting columns
df <- flights %>%
  select(ORIGIN, DEST)

df <- flights %>%
  select(DEST, DEP_TIME:WHEELS_ON)

#-filtering rows based on a condition
#Note: Logical operators: $ is 'and'; | is 'or'; ! is 'not'

big_delay <- flights %>%
  filter(DEP_DELAY >= 60)


out_of_state <- flights %>%
  filter(ORIGIN_STATE_NM != DEST_STATE_NM)


ga_fl <- flights %>%
  filter(DEST_STATE_NM %in% c("Florida", "Georgia"))

ga_fl_big <- flights %>%
  filter(DEST_STATE_NM %in% c("Florida", "Georgia") & DEP_DELAY >= 60)

#-adding a new column
time_gain <- flights %>% 
  mutate(GAIN = DEP_DELAY - ARR_DELAY)


#-modify an existing column
hours <- flights %>%
  mutate(ACTUAL_ELAPSED_TIME = ACTUAL_ELAPSED_TIME/60, AIR_TIME = AIR_TIME / 60)


#-sort the data by a variable
low_to_high <- flights %>%
  arrange(DEP_DELAY)

#flip the order
high_to_low <- flights %>%
  arrange(-DEP_DELAY)

#or
high_to_low <- flights %>%
  arrange(desc(DEP_DELAY))


#-chaining it all together
ga_fl_biggest <- flights %>%
  filter(DEST_STATE_NM %in% c("Florida", "Georgia") & DEP_DELAY >= 60) %>%
  arrange(-DEP_DELAY) %>%
  select(ORIGIN, DEST, DEP_DELAY)

#-aggregating data
#let's count the number of flights that depart each airport
count_flights <- flights %>%
  group_by(ORIGIN) %>%
  summarise(count = n())

#how about the mean delay per airport?
delays <- flights %>%
  group_by(ORIGIN) %>%
  summarise(avg_delay = mean(DEP_DELAY, na.rm = TRUE))

#-your turn - do all of these steps in the same procedure:
#subset to only flights traveling from ALB to BWI


#add a line to select only the origin, dest, and departure time variables


#add a line (or 2) to convert origin and dest as factors


#order by dep_time (descending)


#rename the variables to be lower case


#-ok, now start a new procedure
#figure out the top 5 destination airports have the most canceled flights (i.e., where's the worst place to try to fly into?)

  
#subset the original flights data by the top 5 DEST cities


#find the top 10 origin cities that these flights are coming from









