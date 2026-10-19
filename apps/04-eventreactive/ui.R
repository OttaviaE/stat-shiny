library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "dataset",
        label = "Choose a dataset:",
        choices = list("rock" = 1, "pressure" = 2, "cars" = 3)
      ),
      actionButton("load", "Select dataset")
    ),
    mainPanel(
      plotOutput("graph"),
      verbatimTextOutput("summary")
    )
  )
)
