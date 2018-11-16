# INFO 370 Project Data

This repository holds the data (specifically the code) related to GoTeam's data science project in relation to political sentiment
within digital social environments (specifically Twitter).

There are a number of files each of which builds on another for specificity and clarity for analysis.

As of right now here is what we are working on individually for the project:
EVEN
 (1) Visualualizations of FOLLOWERS, FOLLOWING => pol_accounts file that you cleaned
 (2) LIKES AND RETWEETS => rerun the summary from the latest merged file

JAYLEN
	(1) Linear regression – like we did in lab => early results
		
NIKI 
  (1) Turn democrat and republican into zeros and ones and do summary statistics 
	(2) Datetime try to get the strings into dates
  
ALLY 
  (1) Correlation matrix for followers, following, polarity, num_tweets,

EXTRA 
  Summary statistics of polarity
  Code for removing outliers => data =data[~(np.abs(data.distance-data.distance.mean()) > (3*data.distance.std()))] #remove outliers


