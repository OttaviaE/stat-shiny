library(shiny)

server <- function(input, output, session) {

  # runs ONLY when the button is clicked
  dataInput <- eventReactive(input$load, {
    switch(input$dataset,
           rock = rock,
           pressure = pressure,
           cars = cars)
  })

  output$graph <- renderPlot({
    data <- dataInput()
    plot(data[, 1:2])
  })

  output$summary <- renderPrint({
    data <- dataInput()
    summary(data[, 1:2])
  })
}
