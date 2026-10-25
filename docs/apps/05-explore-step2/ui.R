library(shiny)

ui <- fluidPage(
  titlePanel("Explore a dataset"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "dataset",
        "Choose a dataset:",
        choices = c("rock", "pressure", "cars")
      ),
      actionButton("load", "Load dataset"),
      hr(),
      uiOutput("x_ui"),   # NEW: empty slot, the server will put a selectInput here
      uiOutput("y_ui")    # NEW
    ),
    mainPanel(
      verbatimTextOutput("preview")
    )
  )
)
