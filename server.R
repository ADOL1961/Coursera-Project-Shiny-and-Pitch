#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
mtcars$cyl <- as.factor(mtcars$cyl)
shinyServer(function(input, output) {
        model <- reactive({
                lm(mpg ~ mtcars[,input$predictor], data = mtcars)
        })
        
        rsquare <- reactive({
                summary(lm(mpg ~ mtcars[,input$predictor], data = mtcars))$adj.r.squared
        })
        
        
        output$slopeOut <- renderText({
                model()[[1]][2]
        })
        
        output$intOut <- renderText({
                model()[[1]][1]
        })
        
        output$squareOut <- renderText({
                rsquare()
        })
        
        output$plot1 <- renderPlot({
                plot <- ggplot(data=mtcars, aes(x=mtcars[,input$predictor], y = mpg))+
                        geom_point(aes(color = cyl), size=3)+
                        geom_smooth(method = "lm")+
                        ggtitle("Linear Model for MPG (see legend for number of cylinders)")+ 
                                xlab(input$predictor)+ylab("Miles Per Gallon")+labs(colour = 'Cylinders')+
                        theme(
                                plot.title = element_text(size=16, face="bold.italic"),
                                axis.title.x = element_text(size=14, face="bold"),
                                axis.title.y = element_text(size=14, face="bold"),
                                legend.title = element_text(size=12, face="bold"),
                                legend.text = element_text(size=10, face="bold")
                        )
                plot
                                })
        
})