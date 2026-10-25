library(shiny)

server <- function(input, output, session) {

  # 1. LOAD THE DATASET (only when "Load dataset" is clicked)
  dataInput <- eventReactive(input$load, {
    switch(input$dataset,
           rock = rock,
           pressure = pressure,
           cars = cars)
  })

  # check that the data arrived
  output$preview <- renderPrint({
    head(dataInput())
  })
}
