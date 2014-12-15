# Prepare -----------------------------------------------------------------
pkg <- c("shiny")
inst <- pkg %in% installed.packages()
if(length(pkg[!inst]) > 0) install.packages(pkg[!inst])
lapply(pkg,library,character.only=TRUE)
rm(inst,pkg)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Injury Effect Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="Cause",
                  label=h3("Injury Caused During:"),
                  choices=list("Match"=1,"Training"=2)),
      sliderInput(inputId="sDay",
                   label=h3("Days into the Season:"),
                   min=0,max=200,step=10,value=30)),
    mainPanel(
      h5("Instructions:  This application predicts how long a soccer player will be out for injury, given two inputs:  whether the injury occurred in training/match & how far into the season the injury happened. The model is built on actual results from Arsenal Football Club's 2013 season. The histogram shows all injuries, for context. The red line is the expected number of days out for your scenario."),
      plotOutput("predPlot")
      )
    )
))

