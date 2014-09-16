
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
source("martingale.R")

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    res <- c();

    for(i in 1:input$obs) {
      game <- martingaleRun(500);
      res[i] <- game$maxMoney;
    }
    
    plot(hist(res));
  })
  
})
