library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      actionButton("load", "Load dataset"),
      hr(),
      # the menus exist from the start, but they are empty
      selectInput("x", "X variable:", choices = NULL),
      selectInput("y", "Y variable:", choices = NULL),
      actionButton("analyze", "Update analysis")
    ),
    mainPanel(
      plotOutput("graph"),
      verbatimTextOutput("summary")
    )
  )
)
