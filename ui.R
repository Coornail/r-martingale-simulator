
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Martingale Simulation"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", 
                "Number of observations:", 
                min = 1, 
                max = 1000, 
                value = 50),
    numericInput("startMoney", "Starting money", 500, min=1),
    numericInput("baseBet", "Base bet", 1, min=1),
    sliderInput("raiseBetMultiplier", "Raise bet multiplier (if lost)", value=2, min=-10, max=10, step=0.1)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("maxMoneyPlot"),
    textOutput("generatedStats")
  )
))
