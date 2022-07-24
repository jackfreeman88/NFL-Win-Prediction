library(readr)
nfl_data <- read_csv("SC324_final.csv", col_types = cols(home_ODVOA_dif = col_number(), 
+     home_DDVOA_dif = col_number(), home_SDVOA_dif = col_number(), 
+     home_DVOA_dif = col_number()))

attach(nfl_data)
set.seed(5)
train = sample(1:dim(nfl_data)[1], dim(nfl_data)[1] / 2)
test <- -train
nfl_data.train <- nfl_data[train, ]

cor <- cor(nfl_data)
cor2 <- round(cor,2)
View(cor2)

hist(home_DVOA_dif)
hist(home_DDVOA_dif)
hist(home_ODVOA_dif)
hist(home_SDVOA_dif)
hist(home_elo_diff)
hist(Home_QB_diff)

table(home_win)

boxplot(home_DVOA_dif ~ home_win)
boxplot(home_DDVOA_dif ~ home_win)
boxplot(home_ODVOA_dif ~ home_win)
boxplot(home_SDVOA_dif ~ home_win)
boxplot(home_elo_diff ~ home_win)
boxplot(Home_QB_diff ~ home_win)

pairs(nfl_data[2:7])

nfl_reg <- glm(home_win ~ . -home_DVOA_dif, data = nfl_data.train, family = binomial)
summary(nfl_reg)


probs <- predict(nfl_reg, nfl_data.test, type = "response")
pred.glm <- rep("Loss", length(probs))
pred.glm[probs > 0.5] <- "Win"
table(pred.glm, nfl_data.test$home_win)


probs2 <- predict(nfl_reg, nfl_data.train, type = "response")
pred.glm2 <- rep("Loss", length(probs2))
pred.glm2[probs2 > 0.5] <- "Win"
table(pred.glm2, nfl_data.train$home_win)


fit.lda <- lda(home_win ~ . -home_DVOA_dif, data = nfl_data.train)
fit.lda

pred.lda <- predict(fit.lda, nfl_data.test)
table(pred.lda$class, nfl_data.test$home_win)

pred.lda2 <- predict(fit.lda, nfl_data.train)
table(pred.lda2$class, nfl_data.train$home_win)

fit.qda <- qda(home_win ~ . -home_DVOA_dif, data = nfl_data.train)
fit.qda

pred.qda <- predict(fit.qda, nfl_data.test)
table(pred.qda$class, nfl_data.test$home_win)

pred.qda2 <- predict(fit.qda, nfl_data.train)
table(pred.qda2$class, nfl_data.train$home_win)
