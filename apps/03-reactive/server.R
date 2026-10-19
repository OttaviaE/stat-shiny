library(shiny)

server <- function(input, output, session) {

  # written once, used everywhere
  dataInput <- reactive({
    switch(input$dataset,
           rock = rock,
           pressure = pressure,
           cars = cars)
  })

  output$graph <- renderPlot({
    data <- dataInput()                 # note the ()
    plot(data[, 1:2])
  })

  output$summary <- renderPrint({
    data <- dataInput()
    summary(data[, 1:2])
  })
}
