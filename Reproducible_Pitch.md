Course Project: Reproducible Pitch for the Shiny App
========================================================
author: Adolfo Corrales
date: 22nd June 2018
autosize: true

Synopsis
========================================================
<small>
This pitch is to explain the main features of a Shiny App developed for the **Developing Data Products** assignment. It is based on the "mtcars" database available in R. This data frame combines a variable for fuel consumption, (mpg), with ten other features of 32 cars (number of cylinders, weight, horsepower, number of carburetors, gears, ect.). All in all, there are 11 variables for 32 observations (cars in the US market in 1973-74). 

The App shows the relationship between "Miles Per Gallon (mpg)" and some predictors avialbel in the "mtcars" base.

**URLs:**
- The App can be run at: https://adol1961.shinyapps.io/Shiny/
- Source code for ui.R and server.R files as well as other additional files are available on the GitHub repo:https://github.com/ADOL1961/Coursera-Project-Shiny-and-Pitch 

</small>

Main features of the App
========================================================
From the 10 possible explanatory variables available in "mtcars" the App uses only 4:
<small>
- Horsepower (hp)
- Weight (wt)
- Number of gears (gear)
- Number of carburetors (carb)

Another variable Number of Cylinders (cyl) is considered, not as a regressor, but to give color to the picture points and graphically assess its relationship both with the output and with the rest of predictors. 

The user is required to select one predictor and the App automatically fits a univariate linear model and gives the following outputs:
- The coefficients of the regression:Slope and Intercept
- The adjusted R-squared, so as to assess the goodness of fit
- A plot showing "Miles per Gallon" in the y-axis and the selected predictor in the x-axis. The plot depicts the regression line estimated by the model as well as the confidence intervals of the forecast.

</small>

An alternative model for qualitative variables
========================================================
<small>
Two of the four predictors are non-continuous: Gears (gear) and Carburetors (carb). The suggested linear model may be not the most appropriate for this type of variables, basically because it assumes a uniform reaction that may not be the case. An alternative model for the qualitative predictor "gear" could be:

*mpg = bo+b1*gear(4)+b2*gear(5)+e*

with the following coefficients:


|            |  Estimate| Pr(>&#124;t&#124;)|
|:-----------|---------:|------------------:|
|(Intercept) | 16.106667|          0.0000000|
|gear4       |  8.426667|          0.0000726|
|gear5       |  5.273333|          0.0384222|

***

MPG reaction to number of gears is not uniform:
</small>

![plot of chunk BoxPlot](Reproducible_Pitch-figure/BoxPlot-1.png)

Conclusions
========================================================
<small>
The App described above shows a simple exercise of comparison between different univariate linear models to assess mileage using the "mtcras" dataset.

The app is easy to use, requires few inputs from the users, but offers enough information so as to make some interesting conclusions regarding oil consumption in USA cars:
<small>
- The best predictor, out of the four suggested,  is Weight (wt).
- The variables "gear" and "carb" show the poorest performance in terms of R-squared.
- Cylinders are highly correlated with the rest of predictors. 

</small>
