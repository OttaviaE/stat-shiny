library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      sliderInput("n", "Rows to show:", min = 1, max = 10, value = 3)
    ),
    mainPanel(
      h4("Summary (uses only the dataset)"),
      verbatimTextOutput("summary"),
      h4("First rows (uses the dataset AND the slider)"),
      verbatimTextOutput("rows")
    )
  )
)
