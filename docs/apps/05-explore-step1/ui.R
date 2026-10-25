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
      actionButton("load", "Load dataset")
    ),
    mainPanel(
      verbatimTextOutput("preview")
    )
  )
)
