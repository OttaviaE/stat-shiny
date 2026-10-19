library(shiny)

server <- function(input, output, session) {

  # 1. LOAD THE DATASET (only when "Load dataset" is clicked)
  dataInput <- eventReactive(input$load, {
    if (input$dataset == 1) {
      rock
    } else if (input$dataset == 2) {
      pressure
    } else {
      cars
    }
  })

  # check that the data arrived
  output$preview <- renderPrint({
    head(dataInput())
  })
}
