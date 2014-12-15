# Prepare -----------------------------------------------------------------
pkg <- c("shiny")
inst <- pkg %in% installed.packages()
if(length(pkg[!inst]) > 0) install.packages(pkg[!inst])
lapply(pkg,library,character.only=TRUE)
rm(inst,pkg)


# Define server logic required to draw a plot
shinyServer(function(input, output) {
  
  output$predPlot <- renderPlot({
    pred1 <- round(43.00103 + (-11.72829*(input$Cause==2)) + (-0.05837*input$sDay),0)
    Season <- c(7,4,39,11,13,5,115,2,2,5,7,21,187,13,38,4,2,13,1,1,4,2,17,8,15,97,89,36,145,19,11,13,5,1,14,13,153,59,4,19,43,21,4,22,6,53,9,6,6,4,11,5,28,22,396,30,8,2,2,23,65,51,82,8,32,5,10,22,13,20,59,9,1,3,2,2,13,85,3,21,191,282,18,2,18,5,4,60,11,13,46,5,4,2)
    hist(Season,breaks=60,xlab="Days Out",col="blue",
         main=paste0("Histogram of 2013-14 Injuries \n",pred1," Days Predicted for Injury"))
    abline(v=pred1,col="red",lwd=5)
  })
})
