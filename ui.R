shinyUI(fluidPage(
        titlePanel(h1("My Shiny app. BMI calculator", align = "center")),
        
        sidebarLayout(
                sidebarPanel(
                        radioButtons("units", label = h4("Units"),
                                     choices = list("cm / kg" = 1, "inches / pounds" = 2), 
                                     selected = 1),
                        numericInput("height", label = h4("Your height ( cm / inches )"), 0, min=0),
                        numericInput("weight", label = h4("Your weight ( kg / pounds )"), 0, min=0),
                        submitButton("Calc"),
                        hr(),
                        h4("Your BMI"),
                        verbatimTextOutput("resBMI"),
                        hr(),
                        helpText("Note: Choose unit system.",
                                "Input your height (cm or inches) and weight (kg or pounds).",
                                "And push 'Calc' button."),
                        helpText("The app will calc Body Mass Index (BMI).",
                                "At the histogram your BMI marked by blue line.")
                        
                        
                ),
                mainPanel( plotOutput("BMIPlot"))
        )
        
))