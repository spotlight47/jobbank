# 2019-01-30 Data Analysis Routine
# 1.  import date
  job_bank <- read.csv(file="listings2019-01-30.csv",header=TRUE, sep = ",")

#2. import tidyverse library
library(tidyverse)


#3. Add year column from the RIGHT part (extract last 4 characters fo the year):
job_bank$year<- substr(job_bank$posted_on, 7, 10)

#verify column / factor was added
View(job_bank)


#5. Chart jobs by year 
library(forcats)

g <- ggplot(job_bank, aes(state))
# number of job listings in each state
g + geom_bar()

# fill by year
g + geom_bar(aes(fill = job_bank$year)) +
  coord_flip() 

# format jobs by chapter
library(forcats)

h <- ggplot(job_bank, aes(chapter))
# number of job listings in each state
h + geom_bar()

# fill by year
h + geom_bar(aes(fill = job_bank$year)) +
  coord_flip() 


#6 subset 2019 data only

library(dplyr)

#assign filtered data set
jb_2019 <- filter(job_bank, job_bank$year == "2019")

#view filtered data set
View(jb_2019)

#7.  chart filtered dataset

library(forcats)

# show jobs by state
ggplot(data = jb_2019) + 
  stat_count(mapping = aes(x = state)) +
  coord_flip()

# format jobs by state
ggplot(jb_2019, aes (x=factor(state)))+
  geom_bar(width = 0.7, fill = "steelblue") +
  stat_count(geom = "text", aes(label = ..count..), vjust = 1.2) +
  coord_flip()

# format jobs by chapter
ggplot(jb_2019, aes (x=factor(chapter)))+
  geom_bar(width = 0.7, fill = "steelblue") +
  stat_count(geom = "text", aes(label = ..count..), vjust = 1.2) +
  coord_flip()

