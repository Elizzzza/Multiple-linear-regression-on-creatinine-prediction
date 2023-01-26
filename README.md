#### BIOST 515/518: Homework 3
#### Instructor:  Amy Willis

## Scientific Background 

“MRI dataset”, which contains data from an observational study conducted in the 1990’s to investigate the incidence of cardiovascular (e.g., heart attacks) and cerebrovascular (e.g., strokes) disease and relate these events to lifestyle and other health factors. Adults over 65 years old were randomly selected from Medicare rolls and invited to participate in the study. The dataset and a description of the variables are available in the repository.

## Questions
1. Body mass index, or BMI, is an easily-calculated estimate of body fat. Research the definition of
BMI and briefly summarise your findings. Calculate the BMI of each participant in the MRI dataset.
Calculate descriptive statistics for creatinine levels, age, sex, and BMI, and present the results in a
format suitable for a scientific publication. Hint: Take care regarding the units in the calculation of
BMI.

2. We are interested in examining how mean creatinine levels vary by BMI and sex. In the questions
below, you do not need to provide full statistical inference; you need only respond to the questions.
- a) Create a scatterplot of creatinine levels versus BMI. Use different symbols and/or colors for
each sex, and include the LOESS curve for each sex. What observations do you make from the
scatterplot regarding the association between creatinine levels and BMI?
- b) Perform an analysis to determine whether mean creatinine levels differ between the sexes. Briefly
describe the analysis that you performed and clearly state the basis of your conclusion regarding
an association.
- c) Perform an analysis to determine whether there is a linear trend in mean creatinine levels by BMI.
Briefly describe the analysis that you performed and clearly state the basis of your conclusion
regarding an association.
- d) Perform an analysis to determine whether there is a linear trend in mean creatinine levels by BMI
after adjustment for sex. Briefly describe the analysis that you performed and clearly state the
basis of your conclusion regarding an association.
- e) Contrast your analyses and findings from (c) and (d).

3. Fit a multiple linear regression with creatinine level as the response and the variables age, sex, and
BMI as predictors.
- a) Write out the fitted model. Hint: Be clear about the possible values of the covariates in your
model.
- b) Interpret the intercept term in your regression model. Is the intercept estimate scientifically
meaningful?
- c) In 4-5 sentences, summarize the results of your model in language suitable for a scientific publication.
Give full inference for the coefficient on age, the coefficient on sex, and the coefficient on BMI in
your model.
