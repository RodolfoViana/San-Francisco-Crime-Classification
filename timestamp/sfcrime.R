#train <- read.csv("~/Documents/kaggle/sfcrime/train.csv")
#sampleSubmission <- read.csv("~/Documents/kaggle/sfcrime/sampleSubmission.csv")
test <- read.csv("~/Documents/kaggle/sfcrime/test.csv")

library(dplyr)
str(test)


sfcrime_timestamp_test <- test %>% select(Dates)
write.table(sfcrime_timestamp_test, "sfcrime-timestamp-test.csv",row.names = FALSE, sep = ",", quote = FALSE)

###Geracao do arquivo sfcrime-timestampt-test.csv atraves do script dates_script.py

sfcrime_timestamp_test <- read.csv("~/Documents/kaggle/sfcrime/sfcrime-dates/sfcrime-timestamp-test.csv")
sfcrime_timestamp_test <- sfcrime_timestamp_test %>% select(-seconds)

#Gerando variavel Season
sfcrime_timestamp_test$season <- ifelse((sfcrime_timestamp_test$month > 2) & (sfcrime_timestamp_test$month < 6),"spring",
                                ifelse((sfcrime_timestamp_test$month > 5) & (sfcrime_timestamp_test$month < 9), "summer",
                                ifelse((sfcrime_timestamp_test$month > 8) & (sfcrime_timestamp_test$month < 12),"fall", 
                                "winter")))

sfcrime_timestamp_test$is_winter <- ifelse(sfcrime_timestamp_test == "winter", TRUE, FALSE)
sfcrime_timestamp_test$fall_ending <- ifelse(sfcrime_timestamp_test$month == 10, TRUE, FALSE)
sfcrime_timestamp_test$spring_ending <- ifelse(sfcrime_timestamp_test$month == 5, TRUE, FALSE)


sfcrime_timestamp_test$is_thirty_first <- ifelse(sfcrime_timestamp_test$day == 31, TRUE, FALSE)
sfcrime_timestamp_test$is_first_of_month <- ifelse(sfcrime_timestamp_test$day == 1, TRUE, FALSE)


write.table(sfcrime_timestamp_test, "sfcrime-timestamp-test.csv", sep=",", quote = FALSE)
