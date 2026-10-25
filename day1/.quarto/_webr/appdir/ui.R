library(shiny)

ui <- fluidPage(
  titlePanel("Explore a dataset"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "dataset",
        "Choose a dataset:",
        choices = c("rock", "pressure", "cars",
                    "Upload data" = "upload")              # NEW option
      ),
      # NEW: shown only when "Upload data" is selected
      conditionalPanel(
        condition = "input.dataset == 'upload'",
        fileInput("file", "Select a CSV file", accept = ".csv"),
        radioButtons("sep", "Column separator",
                     choices = c(";" = ";", "," = ","))
      ),
      actionButton("load", "Load dataset"),
      hr(),
      uiOutput("x_ui"),
      uiOutput("y_ui"),
      actionButton("analyze", "Update analysis")
    ),
    mainPanel(
      plotOutput("graph"),
      verbatimTextOutput("summary")
    )
  )
)

