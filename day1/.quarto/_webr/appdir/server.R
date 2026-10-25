library(shiny)

now <- function() format(Sys.time(), "%H:%M:%OS2")

server <- function(input, output, session) {

  dataInput <- reactive({
    get(input$dataset)
  })

  output$summary <- renderPrint({
    cat("computed at", now(), "\n\n")
    summary(dataInput())
  })

  output$rows <- renderPrint({
    cat("computed at", now(), "\n\n")
    head(dataInput(), input$n)
  })
}
