#HW3
#Q1
# Make a table of descriptive statistivs with vairables

# load libraries and data
library(tidyverse)
library(rigr)
mri <- read_csv("~/Desktop/UW MS Biostat/BIOST Winter 2022/Biost 515/R dataset/mri.csv")

# create variable BMI and sex_male 
mri <- mri %>%
  mutate(height_m = height/100) %>% 
  mutate(weight_kg = weight*0.45359237) %>% 
  mutate(BMI = weight_kg / height_m^2) %>% 
  mutate(sex_male = ifelse(sex == "Male", 1, 0))

# calculate descriptive statistics
tab1 <- mri %>%  select(crt, age, sex_male, BMI) %>%  descrip()

# values want for the table, make into data frame
tab1 <- tab1[,1:9] %>% data.frame()

# change column names
names(tab1) <- c("N","Msng", "Mean/Proportion", "Std Dev", "Min", 
                 "25th pct","Median", "75th pct", "Max")
tab1 <- tab1 %>% mutate(`Mean/Proportion` = as.character(signif(`Mean/Proportion`, 3)),
                 `Std Dev` = as.character(signif(`Std Dev`, 3)),
                 `Min` = as.character(signif(`Min`, 3)),
                 `25th pct` = as.character(signif(`25th pct`, 3)),
                 `Median` = as.character(signif(`Median`, 3)),
                 `75th pct` = as.character(signif(`75th pct`, 3)),
                 `Max` = as.character(signif(`Max`, 3)))

#delete values we don't need for binary variable
tab1$`Std Dev`[3] <- "---"
tab1$`Min`[3] <- "---"
tab1$`25th pct`[3] <- "---"
tab1$`Median`[3] <- "---"
tab1$`75th pct`[3] <- "---"
tab1$`Max`[3] <- "---"

# change row names
rownames(tab1) <- c("Creatinine (mg/dl)","Age (years)", "Male sex", "BMI (kg/m^2)")

# use knitr's kable function to build table with nice formatting
knitr::kable(tab1, bookstabs = TRUE, format = "markdown",
             caption = "Descriptive statistivs for creatinine, age, sex, and BMI in the MRI dataset")

#Q2 a)
# scatter plot of creatinine vs BMI by sex
mri %>%
  ggplot(aes(x = BMI, y = crt, col = sex)) +
  geom_point(cex = 0.5) +
  xlab("BMI (kg/m^2)") +
  ylab("Creatinine level (mg/dl)") +
  theme_bw() +
  geom_smooth(method = "loess", se=F,show.legend=T) +
  scale_color_manual(values = c("#E69F00", "#56B4E9"))

#Q2 b)
# Here's a linear model for creatinine vs. sex from mri dataset using rigr:regress
mri_model1 <-mri %>% 
  na.omit() %>% 
  regress("mean", crt ~ sex, data = .) %>% coef %>% round(5)
mri_model1

#Q2 c)
# Here's a linear model for creatinine vs. BMI from mri dataset using rigr:regress
mri_model2 <- mri %>% 
  regress("mean", crt ~ BMI, data = .) %>% coef %>% round(5)
mri_model2

# Q2 d)
# Here's a linear model for creatinine vs. BMI and sex from mri dataset using rigr:regress
mri_model3 <- mri %>% 
  regress("mean", crt ~ BMI + sex, data = .) %>% coef %>% round(5)
mri_model3

# Q3 a)
# Here's a linear model for creatinine vs. BMI + sex + age from mri dataset using rigr:regress
mri_model4 <- mri %>% 
  regress("mean", crt ~ BMI + sex + age, data = .) %>% coef %>% round(5)
mri_model4
