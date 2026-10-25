library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "dataset",
        label = "Choose a dataset:",
        choices = c("rock", "pressure", "cars")
      ),
      actionButton("load", "Select dataset")
    ),
    mainPanel(
      plotOutput("graph"),
      verbatimTextOutput("summary")
    )
  )
)
