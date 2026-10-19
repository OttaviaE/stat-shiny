library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      actionButton("load", "Select dataset")
    ),
    mainPanel(
      plotOutput("graph"),
      downloadButton("downloadPlot", "Download plot"),
      verbatimTextOutput("summary"),
      downloadButton("downloadSummary", "Download summary")
    )
  )
)
