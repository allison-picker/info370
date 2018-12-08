### This script creates visualizations of early data analysis
### work on the politicians twitter dataset

library(ggplot2)
library(dplyr)

tweet_data <- read.csv('dataWithPolarity.csv')
head(tweet_data)
accounts_data <- read.csv('clean_accounts.csv')
head(accounts_data)

# creating histograms of each accounts following and follower stats
followers_plot <- ggplot(data = accounts_data) +
  stat_bin(mapping = aes(x = latest_followers_count), bins = 30) +
  scale_x_log10(
    breaks = scales::trans_breaks("log10", function(x) 10^x),
    labels = scales::trans_format("log10", scales::math_format(10^.x))
  ) +
  labs(
    title = 'Distribution of Follower Amounts for Politicians',
    x = 'Amount of Followers',
    y = 'Frequency'
  )

followers_plot
summary(accounts_data$latest_followers_count)
sd(accounts_data$latest_followers_count)

following_plot <- ggplot(data = accounts_data) +
  stat_bin(mapping = aes(x = latest_following_count)) +
  scale_x_log10(
    breaks = scales::trans_breaks("log10", function(x) 10^x),
    labels = scales::trans_format("log10", scales::math_format(10^.x))
  ) + 
  labs(
    title = 'Distribution of Total Accounts Following for Politicians',
    x = 'Amount of Accounts Following',
    y = 'Frequency'
  )
following_plot
summary(accounts_data$latest_following_count)
sd(accounts_data$latest_following_count, na.rm = TRUE)

# plot for the amount of tweets posted by politicians
tweets_posted <- ggplot(data = accounts_data) +
  stat_bin(mapping = aes(x = num_tweets)) +
  labs(
    title = 'Distribution of Total Tweets Posted for Politicians',
    x = 'Number of Tweets',
    y = 'Frequency'
  )
tweets_posted
summary(accounts_data$num_tweets)
sd(accounts_data$num_tweets, na.rm = TRUE)

# histogram for amount of interaction
favorites_plot <- ggplot(data = tweet_data) +
  stat_bin(mapping = aes(x = favorites_count)) +
  scale_x_log10(
    breaks = scales::trans_breaks("log10", function(x) 10^x),
    labels = scales::trans_format("log10", scales::math_format(10^.x))
  ) +
  labs(
    title = 'Distribution of Number of Favorites for All Tweets',
    x = 'Total Favorites',
    y = 'Frequency'
  )
favorites_plot
summary(tweet_data$favorites_count)
sd(tweet_data$favorites_count, na.rm = TRUE)

retweet_plot <- ggplot(data = tweet_data) +
  stat_bin(mapping = aes(x = retweet_count)) +
  scale_x_log10(
    breaks = scales::trans_breaks("log10", function(x) 10^x),
    labels = scales::trans_format("log10", scales::math_format(10^.x))
  ) +
  labs(
    title = 'Distribution of Number of Retweets for All Tweets',
    x = 'Total Retweets',
    y = 'Frequency'
  )
retweet_plot
summary(tweet_data$retweet_count)
sd(tweet_data$retweet_count, na.rm = TRUE)

# histogram of the polarity values for tweets

polarity_plot <- ggplot(data = tweet_data) +
  stat_bin(mapping = aes(x = polarity), binwidth = 0.1) +
  labs(
    title = 'Distribution of Sentiment Polarity for All Tweets',
    x = 'Sentiment Polarity',
    y = 'Frequency'
  )
polarity_plot
summary(tweet_data$polarity)
sd(tweet_data$polarity, na.rm = TRUE)
