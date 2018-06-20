#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
                tabsetPanel(type="tab",

        tabPanel("Main",
        titlePanel("Select a predictor and check the Model Output"),
                 br(),
        selectInput("predictor", "Predictor:",
                    c("Horsepower" = "hp",
                      "Weight" = "wt",
                      "Gears" = "gear",
                      "Carburetors" = "carb")
        ),
        sidebarLayout(
                sidebarPanel(
                        h2("Model coefficients and R-square"),
                        h3("Slope"),
                        textOutput("slopeOut"),
                        h3("Intercept"),
                        textOutput("intOut"),
                        h3("R-square"),
                        textOutput("squareOut")
                ),
                
                mainPanel(
         plotOutput("plot1"))
        )),
        
    tabPanel("Instructions",
             h1("This App runs univariate linear models to predict Milleage 
                using some of the predictors available in the 'mtcars' dataset"),
             h2("To run this App, follow the instructions below:"),
             br(),
             h3("1.- Select a predictor from the banner in the 'Main' tab"),
             h3("2.- See how the picture changes according to the predictor you have selected"),
             h3("3.- Check the coefficients (Slope and Intercept) of the linear model"),
             h3("4.- Check the R-squared to assess the goodness of fit of the choosen predictor")
             )
    )
                        
                ))

