library(tidyverse)

# 1. load the data
train <- read.csv("data/train.csv", na="")

# 2. exploratory anlysis
str(train)
head(train)

# convert feature data types
train$Sex <- as.numeric(as.factor(train$Sex))
train$Embarked <- as.numeric(as.factor(train$Embarked))

# TODO: hote one vectorize the no order categortical featuraes
# TODO: normalize data
# TODO: split dataset in {train, test}
# TODO: train svm
