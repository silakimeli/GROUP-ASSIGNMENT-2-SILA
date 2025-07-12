#1.Load Necessary Libraries
# Install (if needed) and load required packages
install.packages(c("tidyverse", "ggplot2", "caret", "corrplot", "ROCR"))
library(tidyverse)
library(caret)
library(corrplot)
library(ROCR)
#2. Import Your Dataset
data <- read.csv("financial_risk_dataset.csv", stringsAsFactors = TRUE)
data <- read.csv(file.choose())
glimpse(data)
summary(data)
#3. Clean and Prepare the Data
# Handle missing values (remove or impute)
data <- na.omit(data)

# Convert Default_Status to factor for classification
data$Default_Status <- as.factor(data$Default_Status)

# Optional: scale numeric features
data$Debt_to_Income_Ratio <- data$Existing_Debt / (data$Applicant_Income + data$Coapplicant_Income + 1)
data <- read.csv(file.choose(), stringsAsFactors = TRUE)  # or your correct file path
head(data)
nrow(data)
data$Debt_to_Income_Ratio <- data$Existing_Debt / (data$Applicant_Income + data$Coapplicant_Income + 1)
#Exploratory Data Analysis (EDA)
# Histogram of Credit Score
ggplot(data, aes(Credit_Score)) + 
  geom_histogram(fill = "skyblue", bins = 30) + 
  theme_minimal() + 
  labs(title = "Credit Score Distribution")

# Boxplot of Loan Amount by Default Status
ggplot(data, aes(Default_Status, Loan_Amount)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Loan Amount vs. Default Status")
#Correlation matrix:
numeric_data <- data %>% select_if(is.numeric)
corrplot(cor(numeric_data, use = "complete.obs"), method = "circle")
#Predictive Model_Logistic Regression
set.seed(123)
trainIndex <- createDataPartition(data$Default_Status, p = 0.8, list = FALSE)
train <- data[trainIndex, ]
test <- data[-trainIndex, ]

model <- glm(Default_Status ~ Credit_Score + Debt_to_Income_Ratio + Payment_Delays_6mo + Credit_Utilization_Ratio,
             data = train, family = binomial)

summary(model)
table(data$Default_Status)
str(data$Default_Status)
data$Default_Status <- as.factor(data$Default_Status)
table(data$Default_Status)  # Should show at least 2 levels
library(caret)
set.seed(123)
trainIndex <- createDataPartition(data$Default_Status, p = 0.8, list = FALSE)

train <- data[trainIndex, ]
test  <- data[-trainIndex, ]
model <- glm(Default_Status ~ Credit_Score + Debt_to_Income_Ratio +
               Payment_Delays_6mo + Credit_Utilization_Ratio,
             data = train, family = binomial)

summary(model)
table(train$Default_Status)
colSums(is.na(train))
train_clean <- na.omit(train)
apply(train_clean[, c("Credit_Score", "Debt_to_Income_Ratio",
                      "Payment_Delays_6mo", "Credit_Utilization_Ratio")], 2, var)
model <- glm(Default_Status ~ Credit_Score + Payment_Delays_6mo,
             data = train_clean, family = binomial)

summary(model)
table(train$Default_Status)
install.packages("caret")       # for confusionMatrix
install.packages("e1071")       # required dependency
library(caret)
library(e1071)
# Predict probabilities
pred_probs <- predict(model, newdata = test, type = "response")

# Classify using a 0.5 threshold
pred_class <- ifelse(pred_probs > 0.5, 1, 0)

# Ensure both predicted and actual are factors
pred_class <- as.factor(pred_class)
test$Default_Status <- as.factor(test$Default_Status)
conf_matrix <- confusionMatrix(pred_class, test$Default_Status, positive = "1")
print(conf_matrix)
# Create a table
cm_table <- table(Predicted = pred_class, Actual = test$Default_Status)

# Plot it
library(ggplot2)
library(reshape2)

cm_melt <- melt(cm_table)
ggplot(cm_melt, aes(x = Actual, y = Predicted, fill = value)) +
  geom_tile() +
  geom_text(aes(label = value), color = "white", size = 8) +
  scale_fill_gradient(low = "steelblue", high = "darkred") +
  labs(title = "Confusion Matrix", x = "Actual", y = "Predicted") +
  theme_minimal()

