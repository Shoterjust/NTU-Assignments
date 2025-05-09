data1<- fread("Project_TestData4.csv")

data1$Gender <- factor(data1$Gender)
data1$Married <- factor(data1$Married)
data1$HasCrCard <- factor(data1$HasCrCard)
data1$Mortgage <- factor(data1$Mortgage)
data1$BusinessOwner <- factor(data1$BusinessOwner)
data1$LifeInsurance <- factor(data1$LifeInsurance)
data1$Churn <- factor(data1$Churn)
data1$ETF_Med <- factor(data1$ETF_Med)
data1[ ,`:=`(RowNumber = NULL, Surname = NULL, CustomerID = NULL,Retention = NULL, CLV = NULL, ETF_Med = NULL)]

library(lubridate)
data1$date2 <- anydate(data1$LastTransactionDate)
library(anytime)  
install.packages("anytime")
todaydate <- anydate("2019-06-01") # we can assume any cut off date but don't choose one too current or it may not yield good results
data1$NumDaysSinceLastTxn <- difftime(todaydate, data1$date2, units = "days")
View(data1)