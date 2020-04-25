# demoing group support in the `choices` arg
shinyApp(

    ui = fluidPage(

        selectInput("numDice", "Number of dice:",
            list(`Numbers` = seq(1,20,1))
        ),
        selectInput("numSides", "Sides per die:",
            list(`Sides` = list(4,6,8,10,12,20,100))
        ),
        selectInput("bonus", "Bonus:",
            list(`Numbers` = seq(0,20,1))
        ),
        actionButton("roll", "Roll"),
        textOutput("result")
    ),


    server = function(input, output) {
        
        v <- reactiveValues(data = NULL)


        observeEvent(input$numDice, {
            v$numDice <- as.integer(input$numDice)
        })

        observeEvent(input$numSides, {
            v$numSides <-  as.integer(input$numSides)
        })  
        
        observeEvent(input$bonus, {
            v$bonus <-  as.integer(input$bonus)
        })  
        
        
        rollTotal <- eventReactive(input$roll, {
            sum(sample(1:v$numSides, v$numDice, replace = TRUE)) + v$bonus
        })

        output$result <- renderText({
            paste("Total:", rollTotal())
        })
        
    }
    
)