## R Code to underatke MT5763 Individual Project
## GitHub Repository URL : https://github.com/AMLoucas/MT5763_1_200029834
## GitHub Cloning URL : https://github.com/AMLoucas/MT5763_1_200029834.git

## Importing libray tidyverse
library(tidyverse)

## Reading CSV files to apply computations on.
seoul_Bikes <- read.csv("BikeSeoul.csv")
## Showing data read
head(seoul_Bikes)
washington_Bikes <- read.csv("BikeWashingtonDC.csv")
## Showing data read
head(washington_Bikes)

## Data wrangling on file BikeSeoul
## Task 1 Remove Rows that Functioning Day is No, after remove column.
## Number of rows before Removing :
nrow(seoul_Bikes)
seoul_Bikes <- seoul_Bikes %>%
  filter(Functioning.Day != "No") %>%
  select(-Functioning.Day)
## Number of rows after Removing Rows
nrow(seoul_Bikes)
## New Table after structure after removing Column Functioning.Day
head(seoul_Bikes)

## Task 2 Renaming Column Names Where needed [Date,Count,Hour,Temperature,WindSpeed,Season,Holidy]
## Header Names before Renaming
head(seoul_Bikes)
seoul_Bikes <- seoul_Bikes %>%
  rename(Count = Rented.Bike.Count, Temperature = Temperature.C., WindSpeed = Wind.speed..m.s., Season = Seasons)
## Header Names after Renaming
head(seoul_Bikes)

## Task 3 changing column date type to Date.
## Importing Library lubridate that helps fix Date, since we need to change the format of the date.
library(lubridate)
## Printing first 6 rows to show the old Date format.
head(seoul_Bikes$Date)
## Changing the Column Date to type Date and putting it correct R format.
seoul_Bikes$Date <- as.Date(parse_date_time(seoul_Bikes$Date,"dmy"))
## Printing first 6 rows to show the new Date format.
head(seoul_Bikes$Date)

## Task 4 Adding new Column of FullDate 
## Printing first 6 rows to show the old data structure without column
head(seoul_Bikes$Date)
seoul_Bikes <- seoul_Bikes %>%
  mutate(FullDate = make_datetime( year = as.integer(format(Date, format="%Y")) 
                                  , month = as.integer(format(Date, format="%m"))
                                  ,day = as.integer(format(Date, format="%d"))
                                  , hour = Hour , min = 0, sec = 0 ))
## Printing first 6 rows to show the new data structure with FullDate column and its values.
head(seoul_Bikes)

## Task 5 Changing the Levels of Factors and order of Holiday
## Printing the 6 fist rows to show factor values before change and the class
head(seoul_Bikes$Holiday)
class(seoul_Bikes$Holiday)
seoul_Bikes <- seoul_Bikes %>%
  mutate(Holiday = ifelse(Holiday == "No Holiday", "No", "Yes")) %>%
  mutate(Holiday = factor(Holiday, levels = c("Yes", "No")))
## Printing the 6 fist rows to show factor values before change of class
head(seoul_Bikes$Holiday)
class(seoul_Bikes$Holiday)

## Task 6 Changing the Levels order of Season [Spring, Summer, Autumn and Winter]
## Printing the 6 fist rows to show factor levels order before change and the class
head(seoul_Bikes$Season)
class(seoul_Bikes$Season)
seoul_Bikes <- seoul_Bikes %>%
  mutate(Season = factor(Season, levels = c("Spring", "Summer", "Autumn", "Winter")))
## Printing the 6 fist rows to show factor levels order after the change of class
head(seoul_Bikes$Season)
class(seoul_Bikes$Season)

## Task 7 Removing unwanted columns [visibility, dew point temperature, solar radiation, rainfall and snowfall]
## Printing first 6 Rows to show the Data Structure of table before removing the columns.
head(seoul_Bikes)
seoul_Bikes <- seoul_Bikes %>%
  select(-Visibility..10m., -Dew.point.temperature.C.,-Solar.Radiation..MJ.m2.,-Rainfall.mm.,-Snowfall..cm.)

## Printing first 6 Rows to show the Data Structure of table after removing the columns.
head(seoul_Bikes)

















