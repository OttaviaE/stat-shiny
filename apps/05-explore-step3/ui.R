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
      uiOutput("x_ui"),
      uiOutput("y_ui"),
      actionButton("analyze", "Update analysis")   # NEW: second button
    ),
    mainPanel(
      plotOutput("graph"),                         # NEW
      verbatimTextOutput("summary")                # NEW
    )
  )
)
