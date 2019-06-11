library(caret)
bank <- read.csv("C:/Users/rc_as/Desktop/Data_science/R_Training/Assignment/bank-additional-full.csv",header=TRUE)
anyNA(bank)
str(bank)
bank = na.omit(bank)
bank$age = as.numeric(bank$age) #changed following CASE STUDY file
bank$duration = as.numeric(bank$duration)
bank$campaign= as.numeric(bank$campaign)
bank$pdays= as.numeric(bank$pdays)
bank$previous= as.numeric(bank$previous)
str(bank)
index = createDataPartition(y = bank$y, p = 0.7, list = FALSE)
bank_train = bank[index, ]
bank_test = bank[-index, ]
trctrl = trainControl(method = "repeatedcv", number = 10, repeats = 3)
knn_fit = train(y ~ ., data = bank_train, method = "knn",trControl = trctrl, preProcess = c("center", "scale"),tuneLength = 10)
knn_fit
table(bank_train$y)/ length(bank_train$y)
knn_test = predict(knn_fit, newdata = bank_test)
confusionMatrix(knn_test, bank_test$y)