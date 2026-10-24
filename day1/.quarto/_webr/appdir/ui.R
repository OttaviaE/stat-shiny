library(shiny)

ui <- fluidPage(
  selectInput(
    inputId = "mySelection",            # name used by the server
    label = h3("Select box"),           # what the user reads
    choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
    selected = 1
  ),
  verbatimTextOutput(outputId = "myOutput")  # empty box, filled by the server
)

