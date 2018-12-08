### This script creates linear models by stratifying the
### tweet data by the amount of followers for each account.

library(ggplot2)
library(dplyr)
library(ggplot2)

tweet_data <- read.csv('dataWithPolarity.csv')
accounts_data <- read.csv('preliminary_analysis/pol_accounts.csv')
head(tweet_data)
names(tweet_data) # col names


# Function to min max normalize data
min_max_normalize <- function(x) {
  (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

# data frame with polarity followers retweets and likes min max normalized
norm_data <- select(tweet_data, polarity, latest_followers_count, retweet_count, favorites_count)
norm_data <- lapply(norm_data, min_max_normalize)

summary(norm_data$retweet_count)
head(norm_data$retweet_count)
summary(min_max_normalize(tweet_data$retweet_count))
head(min_max_normalize(tweet_data$retweet_count))

# examining the differences between modeling with and without min max normalization
fav_fit <- lm(favorites_count ~ polarity, data = tweet_data)
fav_fit_norm <- lm(favorites_count ~ polarity, data = norm_data)
summary(fav_fit)
summary(fav_fit_norm)

rt_fit <- lm(retweet_count ~ polarity, data = tweet_data)
rt_fit_norm <- lm(retweet_count ~ polarity, data = norm_data)
summary(rt_fit)
summary(rt_fit_norm)

names(tweet_data) # all column names
summary(tweet_data$latest_followers_count) # summary stats for number of followers for each tweet
summary(accounts_data$latest_followers_count) # summary stats for number of followers for each account

length(tweet_data$latest_followers_count) # num of observations in dataset

# number of tweets for accounts with under ___ followers
filter1 <- filter(tweet_data, latest_followers_count < 1000)
length(filter1$latest_followers_count) # amount of tweets
summary(filter1$latest_followers_count) # summary stats for the range of data
summary(lm(retweet_count ~ polarity, data = filter1)) # calculate linear model

filter2 <- filter(tweet_data, latest_followers_count > 1000 & latest_followers_count < 8000)
length(filter2$latest_followers_count)
summary(filter2$latest_followers_count)
summary(lm(retweet_count ~ polarity, data = filter2))

filter3 <- filter(tweet_data, latest_followers_count > 8000 & latest_followers_count < 15000)
length(filter3$latest_followers_count)
summary(filter3$latest_followers_count)
summary(lm(retweet_count ~ polarity, data = filter3))

filter4 <- filter(tweet_data, latest_followers_count > 15000 & latest_followers_count < 30000)
length(filter4$latest_followers_count)
summary(filter4$latest_followers_count)
summary(lm(retweet_count ~ polarity, data = filter4))

filter5 <- filter(tweet_data, latest_followers_count > 30000 & latest_followers_count < 100000)
length(filter5$latest_followers_count)
summary(filter5$latest_followers_count)
summary(lm(retweet_count ~ polarity, data = filter5))

filter6 <- filter(tweet_data, latest_followers_count > 100000 & latest_followers_count < 1000000)
length(filter6$latest_followers_count)
summary(filter6$latest_followers_count)
summary(lm(retweet_count ~ polarity, data = filter6))
length(filter(accounts_data, latest_followers_count > 100000 & latest_followers_count < 1000000)$latest_followers_count)
# only 46 accounts in this range

filter7 <- filter(tweet_data, latest_followers_count > 1000000)
length(filter7$latest_followers_count)
summary(filter7$latest_followers_count)
summary(lm(retweet_count ~ polarity, data = filter7))

###
###
### Do the same analysis for likes
summary(lm(favorites_count ~ polarity, data = filter1))

summary(lm(favorites_count ~ polarity, data = filter2))

summary(lm(favorites_count ~ polarity, data = filter3))

summary(lm(favorites_count ~ polarity, data = filter4))

summary(lm(favorites_count ~ polarity, data = filter5))

summary(lm(favorites_count ~ polarity, data = filter6)) # only 46 accounts in this range

summary(lm(favorites_count ~ polarity, data = filter7))




