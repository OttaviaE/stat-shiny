library(shiny)

server <- function(input, output, session) {

  # 1. LOAD THE DATASET
  dataInput <- eventReactive(input$load, {
    if (input$dataset == 1) {
      rock
    } else if (input$dataset == 2) {
      pressure
    } else {
      cars
    }
  })

  # 2. VARIABLE NAMES (NEW)
  vars <- reactive({
    names(dataInput())
  })

  # 3. DYNAMIC UI (NEW): the choices depend on the loaded data
  output$x_ui <- renderUI({
    selectInput("x", "X variable:",
                choices = vars(),
                selected = vars()[1])
  })

  output$y_ui <- renderUI({
    selectInput("y", "Y variable:",
                choices = vars(),
                selected = vars()[min(2, length(vars()))])
  })

  output$preview <- renderPrint({
    cat("x =", input$x, " | y =", input$y, "\n\n")
    head(dataInput())
  })
}
