library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      actionButton("load", "Load data"),
      conditionalPanel(
        condition = "input.load >= 1",       # shown after the first click
        uiOutput("var1"),
        uiOutput("var2"),
        actionButton("select", "Select & Display")
      )
    ),
    mainPanel(
      plotOutput(
        "graph",
        click = clickOpts(id = "plot_click"),  # click -> input$plot_click
        brush = brushOpts(id = "plot_brush")   # drag  -> input$plot_brush
      ),
      fluidRow(
        column(4, verbatimTextOutput("summary")),
        column(4, verbatimTextOutput("points")),
        column(4, verbatimTextOutput("brush"))
      )
    )
  )
)
