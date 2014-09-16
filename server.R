
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(compiler)
library(ggplot2)

source("martingale.R")

shinyServer(function(input, output) {
  output$maxMoneyPlot <- renderPlot({
    
    compiledMartingale <- cmpfun(martingaleRun);
    
    game <- rep(input$startMoney ,input$obs)
    maxMoney <- sapply(game,
                       function(startingMoney) {
                         compiledMartingale(startingMoney,input$baseBet,input$raiseBetMultiplier)$maxMoney
                         }
                       );
    qplot(maxMoney, geom="histogram", binwidth=max(maxMoney)/100)
  })
  
})
