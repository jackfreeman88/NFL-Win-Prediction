
NFL Win Projection

Introduction 

The NFL is a multi-billion-dollar league with a great appreciation for statistics and their ability to shape rosters, drafts, and other 
decisions. In addition, the market for NFL gambling is one of the largest in the industry. Prediction of NFL game outcomes has made Vegas and their  
respective sportsbooks millions.  If a user-generated win projection model performed better than an oddsmakers win projection model, they would expect to 
generate profit in the long run. This realization, coupled with the increasing overlap between the football and statistics communities, has led to the 
development of advanced football metrics and complex win projection models. The first two predictors included in the model presented come from 
FiveThirtyEight’s NFL prediction model. The first predictor, the ELO rating, judges teams based on head-to-head results of zero-sum games. 
FiveThirtyEight’s implementation of ELO in the NFL consists of a k-factor of 20, a forecast delta that weighs the difference of the binary result of the 
game and its prior probability, and a margin-of-victory multiplier.


	
The second predictor used is the Quarterback VALUE metric provided by FiveThirtyEight. This statistic is a regression between ESPN’s QBR yards above 
replacement and box score numbers.


While the VALUE predictor takes in many aspects of an NFL game, the ELO rating is only a representation of outcomes and margins of victory. More 
predictors are needed to capture more aspects of the game. The remaining predictors included in the model come from Football Outsider’s DVOA (Defense-
adjusted Value Over Average) metric. This metric can evaluate at team or unit level (offense, defense, special teams). It is measured and reported in 
percentage points (1=1%). DVOA takes every play over the course of the year and compares it to the league average. For example, a team with an offensive 
DVOA of 10 is 10% better than the league average for any given offensive situation. There will be a team (DVOA), offensive (ODVOA), defensive (DDVOA) and 
special-teams (SDVOA) included in the model as predictors. As DVOA considers the strength of opposing defenses in games prior, the dataset consists of 
all the NFL games played this year after week 8 (102 games). The decision to create such a dataset weighed the disadvantages of less observations with 
the advantage of stronger predictors. The dataset features a response variable named “home_win” which is value 0 if the home team lost and 1 if the home 
team won. Since an NFL win largely depends on the strength of the opponent, all predictors are measured in difference. For example, the “home_elo_diff” 
variable is the difference between the home and away team’s respective ELO values. The model will be used to predict whether a home team will win its 
football game. 


Classification of Game Outcome 
	
A comparison of three classification methods will compare error rates to make conclusions about the classification method and its application to NFL game 
prediction. Test and training subsets of equal lengths were seed-generated from the original dataset. This ensures the greatest resemblance between the 
test and training sets.

Logistic Regression:
The first method used to classify NFL game outcome is logistic regression. Logistic regression is useful to predict categorical response variables. This 
type of regression determines coefficients using a method known a maximum likelihood estimation (MLE). Given the data we have, MLE aims to choose 
coefficients that will maximize the probability the given training observation belongs to its true class. Once this process is completed the coefficients 
allow for prediction as they produce the logistic odds of the outcome in a range between 0 and 1. Analysis of confusion matrices show a misclassification 
rate of 17.6% on the training data and 21.5% on the test data. Classifications were made at a threshold of 0.5. In the context of game prediction, these 
errors are tolerable because of the unpredictable nature of the game.                        


Linear Discriminant Analysis
While logistic regression is based on maximum likelihood estimation, linear discriminant analysis (LDA) is based on least squares estimation. Because the 
groups have similar values of n and relatively little presence of outliers, LDA should fit the data well. The confusion matrices result in a 15.6% error 
rate on the training data and a 23.5% error rate on the test data. This difference in error rates could be a result of overfitting the training data. LDA 
would benefit from a larger dataset because of its sensitivity. The classes are also not well separated which could lead to the relative lack of 
performance. 


Quadratic Discriminant analysis:

With n = 51 in the training data set, I do not have the greatest of expectations for QDA because of the variance associated with it. As QDA is 
more flexible than LDA, one should expect a gap in error rates between the training and test datasets. The covariance matrices are similar to one 
another, so QDA might fit very closely to LDA. 
After analyzing the confusion matrices, the error rate for the prediction of the training set outcomes was 13.7% (Table 5). For the prediction of the 
test set outcomes, the error rate was 19.6% (Table 6). 

Based on the comparison of the three classification methods, QDA boasts the best train and test error rate. This is unexpected due to the number of 
classes equaling two and the relatively low number of observations. Because of QDA’s performance, one could infer that the decision boundary has some 
non-linear properties or that the classes share a common covariance matrix. 

Conclusion 

The classification of NFL game outputs is a lucrative endeavor that can be performed with moderate success. Football is a game with few possessions which 
results in the better having fewer chances to prove that they are so. This idea, coupled with factors that are out of team’s control, can lead to less 
likely outcomes with greater frequency than high possession games such as basketball or chess. QDA was able to predict outcomes at a 81% rate on novel 
data which in this setting is a satisfactory performance. This also marks the best test error rate out of the three methods (Table 7). It would be 
tremendously difficult for a model to capture all the variability and therefore tremendously difficult to classify at a much higher rate. Additionally, 
the ramifications of misclassification are not as high as, for example, the misclassification of a cancer diagnosis. The low cost of misclassification in 
this setting allows models of this mediocre error rate to still warrant use and application. The error rate would’ve decreased if the model included 
prior years data past week 8. The week 8 specification is to confirm the strength of the defense-adjusted metrics. Without proper quantification of 
opposing defenses, teams who face weak opponents are rewarded. The inclusion of prior year’s data is a tangible next step toward minimizing 
misclassification rate. 

Statistical Method

Training Error Test Error 

Logistic Regression 
17.6%  21.5%
LDA
15.6%  23.5%
QDA
13.7%  19.6%

