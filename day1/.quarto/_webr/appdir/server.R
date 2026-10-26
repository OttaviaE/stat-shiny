library(shiny)

inspect <- function(x) {
  cat("class:", class(x), "\n")
  str(x)
}

server <- function(input, output, session) {
  output$file_out <- renderPrint(inspect(input$file))
}
