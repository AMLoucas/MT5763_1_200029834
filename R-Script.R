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
seoul_Bikes$Date <- as.Date(seoul_Bikes$Date)


  
