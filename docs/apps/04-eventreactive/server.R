library(shiny)

server <- function(input, output, session) {

  # runs ONLY when the button is clicked
  dataInput <- eventReactive(input$load, {
    if (input$dataset == 1) {
      rock
    } else if (input$dataset == 2) {
      pressure
    } else {
      cars
    }
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
