library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "dataset",
        label = "Choose a dataset:",
        choices = c("rock", "pressure", "cars")
      )
    ),
    mainPanel(
      plotOutput("graph"),
      verbatimTextOutput("summary")
    )
  )
)
