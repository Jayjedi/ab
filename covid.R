rm(list = ls())#remove all prev stored variables
install.packages("Hmisc")
data=read.csv("F:/R_LAB_FILES/COVID19_line_list_data.csv")
require(Hmisc)
describe(data)
#cleaned up death column any value other than 0 and 1 we should remove
data$death_dummy = as.integer(data$death!=0)
#death rate
sum(data$death_dummy)/nrow(data)
#age claim:those are die are older people
dead = subset(data,death_dummy==1)
alive = subset(data,death_dummy==0)
mean(dead$age,na.rm = TRUE)
mean(alive$age,na.rm = TRUE)
#is this statistically significant?
t.test(alive$age,dead$age,alternative = "two.sided",conf.level = 0.99)
# if p value <0.05, we reject the null hypothesis
# p value ~ 0 we reject the null hypo and conclude tht this is significant 

#gender claim: gender has no effect
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy,na.rm = TRUE)
mean(women$death_dummy,na.rm = TRUE)
t.test(men$death_dummy,women$death_dummy,alternative="two.sided", conf.level= 0.99)

