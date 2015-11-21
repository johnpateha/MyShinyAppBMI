library(shiny)
library(mixsmsn)
library(ggplot2)
data(bmi)

calcBMI <- function(height,weight,units) {
        if (height == 0) 0
        else {
                if (units == 1) {round((weight*10000)/(height*height),1)}
                else {round((weight * 703)/(height*height),1)} 
        }
}

shinyServer(function(input, output) {

        pl <- ggplot(aes(x=bmi), data=subset(bmi,bmi<=50)) + theme_bw() +
                geom_histogram(binwidth=1, fill="lightgrey", color="black") + 
                geom_vline(x=c(18.5,25),color="green",size=1) + 
                annotate("text", x = 21.5, y = 180, label = "norm", color="green") +
                geom_vline(x=30,color="red",size=1)+ 
                annotate("text", x = 34, y = 180, label = "obese", color="red") 

        output$resBMI <- renderPrint({ calcBMI(input$height,input$weight,input$units) })

        output$BMIPlot <- renderPlot({
                
                        pl + geom_vline(x=calcBMI(input$height,input$weight,input$units), color="blue",linetype="longdash",size=1.5) + 
                        annotate("text", x = 45, y = 100, label = paste("--You (",calcBMI(input$height,input$weight,input$units),")"), color="blue",face="bold",size=7)

        })
        
})




