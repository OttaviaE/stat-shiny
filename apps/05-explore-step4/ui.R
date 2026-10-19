library(shiny)

ui <- fluidPage(
  titlePanel("Explore a dataset"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "dataset",
        "Choose a dataset:",
        choices = c("rock" = 1, "pressure" = 2, "cars" = 3,
                    "Upload data" = 4)                     # NEW option
      ),
      # NEW: shown only when "Upload data" is selected
      conditionalPanel(
        condition = "input.dataset == '4'",
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
