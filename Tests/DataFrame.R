#
# Test with data frame
#

col1 <- seq(1, 10, 0.5)
print(col1)
col2 <- col1 + 2
print(col2)
col3 <- col1 + col2
print(col3)

df <- data.frame(col1, col2, col3)
View(df)

col4 <- col3 - col1 - col2
df1 <- data.frame(df, col4)
View(df1)

col4 <- col3 * 1.5 - col1 * 0.5 - col2
print(col4)
df1 <- data.frame(df, col4)
View(df1)
