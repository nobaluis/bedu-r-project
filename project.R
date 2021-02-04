# Data tools
library(dplyr)  # for data wrangling
library(rsample)  # for data spliting
library(recipes)  # for data transformation tasks

# Data visualization
library(ggplot2)  # for graphics
library(visdat)  # for data visualization

# Model tools
library(caret)  # for classification training
library(kernlab)  # for fitting SVMs
library(mlbench)  # for measure performance

# Load the data
data.all <- read.csv("data/train.csv", na="")

# Describe the data
str(data.all)  # structure in the dataset
head(data.all)  # observations sample

# Assign correct data types
data.all$Survived <- as.factor(data.all$Survived)
data.all$Pclass <- as.factor(data.all$Pclass)
data.all$Sex <- as.factor(data.all$Sex)
data.all$Embarked <- as.factor(data.all$Embarked)
data.all$Name <- as.character(data.all$Pclass)
data.all$Cabin <- as.character(data.all$Cabin)
data.all$Ticket <- as.character(data.all$Ticket)
data.all$Age <- as.integer(data.all$Age)
str(data.all) # verify changes

# Data visualization
vis_dat(data.all)

# Missing values viz
vis_miss(data.all, cluster=TRUE)

# Counting missing values
for(col in c("Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked")){
  print(sprintf("%s NA count: %d", col, sum(is.na(data.all[, col]))))
}

# Feature engineering
rec <- recipe(
  Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
  data = data.all
)

# Impute missing values
rec <- rec %>% step_knnimpute(all_predictors(), neighbors = 6)

# Normalize numeric values
rec <- rec %>% step_BoxCox(all_numeric(), -all_outcomes())

# Standardize numeric values
rec <- rec %>% 
  step_center(all_numeric(), -all_outcomes()) %>%
  step_scale(all_numeric(), -all_outcomes())

# Dummy encode for categorical features
rec <- rec %>% step_dummy(all_nominal_predictors())

# Prepare the recipe
rec <- prep(rec, training = data.all)

# Perform all operations
data.clean <- bake(rec, new_data = data.all)

# Vizualization the clean data
vis_dat(data.clean)

# Split data in training and test set
set.seed(123)  # for reproducibility
spliter <- initial_split(data.clean, prob=0.8, strata = "Survived")
data.train <- training(spliter)
data.test <- testing(spliter)

# Model (SVM radial) parameters
caret::getModelInfo("svmRadial")$svmRadial$parameters # model infor

# Model fitting
set.seed(6465)
model <- train(
  Survived ~ .,  # target fromula
  data = data.train,  # training data
  method = "svmRadial",  # SVM with radial basis fuunction: K(x,x') = exp(gamma norm(x-x')^2),
  trControl = trainControl(method="repeatedcv", number=10, repeats=3),   # repeted k-fold cross valdiation
  preProcess = c("center","scale"),
  tuneLength = 10
)

model

# Trainning results
ggplot(model)

# Test the model
predictions <- predict(model, data.test)

# Measuring model performance
confusionMatrix(data = predictions, reference = data.test$Survived)
