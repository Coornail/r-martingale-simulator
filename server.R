
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(foreach)
library(compiler)

library(ggplot2)

source("martingale.R")

shinyServer(function(input, output) {
  output$maxMoneyPlot <- renderPlot({
    compiledMartingale <- cmpfun(martingaleRun);
    
    maxMoney <- c();
    foreach (i=1:input$obs) %dopar% {
      game <- compiledMartingale(input$startMoney, baseBet = input$baseBet);
      maxMoney[i] <- game$maxMoney;
    }
    
    qplot(maxMoney, geom="histogram", binwidth=max(maxMoney)/100)
  })
  
})
