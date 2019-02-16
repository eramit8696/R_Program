train <- read.csv("G:/R_Program/data/Train_UWu5bXk.csv")
test <- read.csv("G:/R_Program/data/Test_u94Q5KV.csv")
dim(train)
dim(test)
table(is.na(train))
table(is.na(test))
colSums(is.na(train))
summary(train)
install.packages("ggplot2")
library(ggplot2)
ggplot(train, aes(x= Item_Visibility, y = Item_Outlet_Sales)) + geom_point(size = 1.5, color="navy") + xlab("Item Visibility") + ylab("Item Outlet Sales") + ggtitle("Item Visibility vs Item Outlet Sales")
install.packages("dplyr")
library(dplyr)
b <- train%>%
  group_by(Item_Identifier)%>%
  tally()
print(b)
c <- train%>%
  select(Outlet_Establishment_Year)%>% 
  mutate(Outlet_Year = 2013 - train$Outlet_Establishment_Year)
print(c)


## SuperStore
orderData <- read.csv("G:/R_Program/data/Superstore_order.csv")
table(is.na(orderData))
dim(orderData)
str(orderData)
library(dplyr)
### Super Store 
## Aggregating Data On the Basis of Profit Earned
groupByProduct <- orderData%>%group_by(Product.ID,sum(Profit))
# Sorting Data Set on the Basis of Profit Earned in Descending Order
order_groupByProduct <- groupByProduct[order(-groupByProduct$Profit),] 
head(order_groupByProduct)
# Getting Product.ID of First Row 
order_groupByProduct[1:2,c(1,2,3,5)]
names(order_groupByProduct)
# Showing Value for 1-5 rows and Column 14:21
order_groupByProduct[1:5,c(14,17,18,19,20,21)]





