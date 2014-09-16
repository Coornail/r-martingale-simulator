
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
  compiledMartingale <- cmpfun(martingaleRun);
  
  maxMoney <- function() {
    game <- rep(input$startMoney ,input$obs);
    sapply(game, function(startingMoney) {
      compiledMartingale(
        startingMoney,
        baseBet = input$baseBet,
        betIncrease = input$raiseBetMultiplier,
        houseEdge = input$houseEdge)$maxMoney
    })
  }
  
  getMaxMoneyPlot <- function() {
    money <- maxMoney();
    qplot(money, geom="histogram", binwidth=max(money)/200)
  }
  
  output$maxMoneyPlot <- renderPlot({
    getMaxMoneyPlot();
  })
  
})
