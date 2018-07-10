#
# Udemy
#
#     Statistics with R - Beginner Level
#

# Section 2
#
# 2. Filtering Data using Brackets

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

demo2 <- demo[demo$gender == "Female",]
View(demo2)

demo2 <- demo[demo$income > 100,]
View(demo2)

demo2 <- demo[demo$income > 100, c(1, 3, 7)] # keep only columns 1, 3 and 7
View(demo2)

demo2 <- demo[demo$income > 100, -c(6:8)] # drop columns 6, 7 and 8
View(demo2)

demo2 <- demo[demo$gender == "Female" & demo$income > 100,] 
View(demo2)

# 3. Filtering Data with the Subset Command

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

demo2 <- subset(demo, marital == "Married")
View(demo2)

demo2 <- subset(demo, marital == "Married" & age > 35)
View(demo2)

demo2 <- subset(demo, marital == "Married" & age > 35, select = c(1:3))
View(demo2)

demo2 <- subset(demo, marital == "Married" & age > 35, select = -c(4:6, 8)) # retired education/car price/car category/retired 
View(demo2)

# 4. Filtering Data with dplyr

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

require(dplyr)

demo2 <- filter(demo, marital == "Unmarried")
View(demo2)

demo2 <- filter(demo, marital == "Unmarried", age < 50)
View(demo2)

demo2 <- select(demo, age, marital, income)
View(demo2)

demo2 <- filter(demo2, marital == "Unmarried", age < 50)
View(demo2)

# 5. Recoding Categorical Variables

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

demo$gender2[demo$gender == "Male"] = "1"
demo$gender2[demo$gender == "Female"] = "2"
View(demo)

require(plyr)
demo$gender3 = revalue(demo$gender, c("Male"="1", "Female"="2"))
View(demo)

demo$gender = factor(demo$gender)

demo$gender = revalue(demo$gender, c("Male"="1", "Female"="2"))
View(demo)

# 6. Recoding Continuous Variables

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

demo$incat1[demo$income < 200] = "Low income"
demo$incat1[demo$income >= 200] = "High income"
View(demo)

demo$incat2 = cut(demo$income, breaks = c(-Inf, 150, 300, Inf), labels=c("Low income", "Medium income", "High income"))
View(demo)

demo$incat3 = cut(demo$income, breaks = c(-Inf, 150, 300, Inf), labels=c("Low income", "Medium income", "High income"), right = FALSE)
View(demo)

demo2 <- subset(demo, incat2 != incat3)
View(demo2)

# 7. Sorting Data Frames

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

demo2 <- demo[order(demo$income), ]
View(demo2)

demo2 <- demo[order(-demo$income), ]
View(demo2)

demo2 <- demo[order(demo$income, demo$age), ]
View(demo2)

demo2 <- demo[order(demo$income, -demo$age), ]
View(demo2)

# 8. Compute New Variables

math <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/math.csv")
View(math)

math$diff = math$grade2 - math$grade1
math$avg = (math$grade1 + math$grade2) / 2
View(math)

# Section 3
#
# 11. Using Base R to Generate Statistical Indicators

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# mean
mean(demo$income)
# or
m <- mean(demo$income)
print(m)

# standard deviation and variation
sd(demo$income)
var(demo$income)

# min, max and range
min(demo$income)
max(demo$income)
range(demo$income)

max(demo$income) - min(demo$income)

# median
median(demo$income)

# quartile
quantile(demo$income)

# 12. Descriptive statistics with the psych package

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# create a matrix with the variables of interest
demo2 <- cbind(demo$age, demo$income, demo$carpr)
View(demo2)

# give suggestive names to the matrix columns
colnames(demo2) <- c("age", "income", "price")
View(demo2)

# load the psych package
require(psych)

# use the describe function to generate the statistics table
describe(demo2)

## the trimmed mean is computend with a default trim of 0.1
## mad - median absolut deviation
describe(demo2, na.rm = TRUE, trim = 0.05, check = TRUE)

# 13. Deseriptibe statistics with the pastecs package

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# create a matrix with the variables of interest
# give suggestive names to the matrix columns
demo2 <- cbind(demo$age, demo$income, demo$carpr)
colnames(demo2) <- c("age", "income", "carpr")
View(demo2)

# load the pastecs package
require(pastecs)

# set some options in base R
options(scipen = 100) ## force R to use the standart notation, not the exponential notation
options(digits = 2)   ## make R show only the first two decimals

# run the sat.desc function from pastecs
stat.desc(demo2)
stat.desc(demo2, basic = FALSE) ## omit the basic statistics
stat.desc(demo2, desc = FALSE)  ## show only the basic statistics

# 14. Determining the skewness and kurtosis

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# load the package
require(e1071)

skewness(demo$income)

kurtosis(demo$income)

# 15. Computing quantiles

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# compute the following percentiles
# 17%, 55% and 97%

quantile(demo$income, probs = c(0.17, 0.55, 0.97))
quantile(demo$income)

# to get the quartile
quantile(demo$income, probs = c(0.25, 0.5, 0.75))

# 16. Determine the mode

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# load the package
require(modeest)

mlv(demo$income, method = "mfv") ## mvf = most frequent value

# 17. Getting the statistical indicators by group with doby

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# load the package
require(doBy)

func <- function(x) { descStat(x, na.rm = TRUE) }

summaryBy(income~gender, data = demo, FUN = func)

summaryBy(income+age~gender, data = demo, FUN = func)

# 18. Getting the statistical indicators by group with DescribeBy

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

# load the package
require(psych)

describeBy(demo$income, demo$educ)

# 19. Getting the statistical indicators by Group with stats

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

aggregate(demo$age, by = list(demo$marital), FUN=mean)   # compute the mean
aggregate(demo$age, by = list(demo$marital), FUN=sd)     # compute the standard deviation
aggregate(demo$age, by = list(demo$marital), FUN=median) # compute the meddian
aggregate(demo$age, by = list(demo$marital), FUN=var)    # compute the var

## very useful when we want to combine the factor categories
aggregate(demo$age, by = list(demo$marital, demo$gender), FUN=mean)

# Section 4
#
# 22. Frequency Tables in Base R

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

mytable <- table(demo$educ, exclude = NULL) ## missing value will be excluded
print(mytable)
View(mytable)

cumul <- cumsum(mytable)
print(cumul)
View(cumul)

relative <- prop.table(mytable)
print(relative)
View(relative)

n <- nrow(demo) ## number of rows (cases) of the data frame demo
cumulfreq <- cumul / n
print(cumulfreq)

mytable2 <- cbind(Freq=mytable, Cumul=cumul, Relative=relative, CumFreq=cumulfreq)
View(mytable2)

# 23. Frequency Tables with plyr

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

require(plyr)

mytable <- count(demo, 'educ')
print(mytable)

perc <- mytable$freq / nrow(demo)
print(perc)

cumul <- cumsum(mytable$freq)
print(cumul)

cumperc <- cumul / nrow(demo)
print(cumperc)

mytable <- cbind(mytable, cumul, perc, cumperc)

# 24. Building Cross Tables using xtabs

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

ct <- xtabs(~gender+carcat, data = demo)
View(ct)
ftable(ct)

# 25. Building Cross Tables with CrossTable

demo <- read.csv("./Udemy/Statistics with R - Beginner Level - csv-data-frames/demographics.csv")
View(demo)

require(gmodels)

CrossTable(demo$gender, demo$carcat, prop.chisq = FALSE)

###
### Copy and test at home
###

































