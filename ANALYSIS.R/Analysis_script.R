{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #Load necessary packages & library\
install.packages("tidyverse")\
install.packages("janitor")\
install.packages("lubridate")\
library(janitor)\
library(tidyverse)\
library(lubridate)\
library(dplyr)\
library(readr)\
\
#import data in R studio\
q6_2022 <- read_csv("q6_2022.csv")\
q7_2022 <- read_csv("q7_2022.csv")\
q8_2022 <- read_csv("q8_2022.csv")\
q9_2022 <- read_csv("q9_2022.csv")\
q10_2022 <- read_csv("q10_2022.csv")\
q11_2022 <- read_csv("q11_2022.csv")\
q12_2022 <- read_csv("q12_2022.csv")\
q1_2023 <- read_csv("q1_2023.csv")\
q2_2023 <- read_csv("q2_2023.csv")\
q3_2023 <- read_csv("q3_2023.csv")\
q4_2023 <- read_csv("q4_2023.csv")\
q5_2023 <- read_csv("q5_2023.csv")\
\
#Check data sets for consistency \
colnames(q6_2022)\
colnames(q7_2022)\
colnames(q8_2022)\
colnames(q9_2022)\
colnames(q10_2022)\
colnames(q11_2022)\
colnames(q12_2022)\
colnames(q1_2023)\
colnames(q2_2023)\
colnames(q3_2023)\
colnames(q4_2023)\
colnames(q5_2023)\
#Check structure of each dataset\
str(q6_2022)\
str(q7_2022)\
str(q8_2022)\
str(q9_2022)\
str(q10_2022)\
str(q11_2022)\
str(q12_2022)\
str(q1_2023)\
str(q2_2023)\
str(q3_2023)\
str(q4_2023)\
str(q5_2023)\
\
#Combine all data frames into a single data frame\
tripdata <- bind_rows(q6_2022, q7_2022, q8_2022, q9_2022, q10_2022, q11_2022, q12_2022, q1_2023, q2_2023, q3_2023, q4_2023, q5_2023)}