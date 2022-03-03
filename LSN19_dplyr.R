# SE370 22-2
# Lesson 19: dplyr


library(dplyr)
library(readr)

#The basics: Verbs are dplyr commands for manipulating data. Command structure (for all dplyr verbs): 
###first argument is a data frame, return value is a data frame, nothing is modified in place 

#1.Pick observations by their values ( filter() ).
#2.Reorder the rows ( arrange() ).
#3.Pick variables by their names ( select() ).
#4.Create new variables with functions of existing variables ( mutate() ).
#5.Collapse many values down to a single summary ( summarise() ).
#6.Changes the scope of each function from operating on the entire dataset to operating on it group-by-group: group_by()

# We'll use the flight data provided



#-selecting columns


#-filtering rows based on a condition
#Note: Logical operators: $ is 'and'; | is 'or'; ! is 'not'



#-adding a new column



#-modify an existing column



#-sort the data by a variable


#flip the order


#or



#-chaining it all together


#-aggregating data
#let's count the number of flights that depart each airport


#how about the mean delay per airport?


#-your turn - do all of these steps in the same procedure:
#subset to only flights traveling from ALB to BWI


#add a line to select only the origin, dest, and departure time variables


#add a line (or 2) to convert origin and dest as factors


#order by dep_time (descending)


#rename the variables to be lower case


#-ok, now start a new procedure
#figure out the top 5 destination airports that have the most canceled flights (i.e., where's the worst place to try to fly into?)

  
#subset the original flights data by the top 5 DEST cities


#find the top 10 origin cities that these flights are coming from









