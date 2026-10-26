library(shiny)

ui <- fluidPage(
  fileInput("file", "fileInput(): upload any CSV file", accept = ".csv"),
  verbatimTextOutput("file_out")
)
