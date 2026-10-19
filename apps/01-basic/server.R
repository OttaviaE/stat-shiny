library(shiny)

server <- function(input, output, session) {
  output$myOutput <- renderPrint({
    paste("This is my choice:", input$mySelection)
  })
}
