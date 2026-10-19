library(shiny)

server <- function(input, output, session) {

  output$graph <- renderPlot({
    data <- switch(input$dataset,       # the same code...
                   rock = rock,
                   pressure = pressure,
                   cars = cars)
    plot(data[, 1:2])
  })

  output$summary <- renderPrint({
    data <- switch(input$dataset,       # ...written twice
                   rock = rock,
                   pressure = pressure,
                   cars = cars)
    summary(data[, 1:2])
  })
}
