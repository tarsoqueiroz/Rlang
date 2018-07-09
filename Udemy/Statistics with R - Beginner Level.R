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

# 11. Using Base R to Generate Statistical Indicators





