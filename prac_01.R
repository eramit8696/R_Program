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
groupByProduct <- orderData %>%
  select(Product.ID,Profit) %>%
  group_by(Product.ID) %>%
  summarise(Profit = sum(Profit))
#dim(orderData)
#dim(groupByProduct)
# Sorting Data Set on the Basis of Profit Earned in Descending Order
order_groupByProduct <- groupByProduct[order(-groupByProduct$Profit),] 
head(order_groupByProduct)
dim(order_groupByProduct)
# Getting Product.ID of First 2 Row 
order_groupByProduct[1:2,c(1:2)]
#names(order_groupByProduct)

valur <- order_groupByProduct[1,1]
#https://www.r-bloggers.com/how-to-summarize-a-data-frame-by-groups-in-r/
#http://genomicsclass.github.io/book/pages/dplyr_tutorial.html

# Filter Data on the Basis of Product ID
groupByProduct <- orderData %>%
  select(Product.ID,Profit,Sales,Quantity,Discount) %>%
  filter(Product.ID == "TEC-CO-10004722")
dim(groupByProduct)
print(groupByProduct)

#rm(groupByProduct)
#rm(goupByProduct)








