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

  # 2. VARIABLE NAMES
  vars <- reactive({
    names(dataInput())
  })

  # 3. DYNAMIC UI
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

  # 4. DATA FOR THE ANALYSIS (NEW): frozen until "Update analysis" is clicked
  newdata <- eventReactive(input$analyze, {
    df <- dataInput()
    df[, c(input$x, input$y), drop = FALSE]
  })

  # 5. OUTPUTS (NEW)
  output$graph <- renderPlot({
    df <- newdata()
    x <- df[[1]]
    y <- df[[2]]
    if (is.factor(x) || is.character(x)) {
      boxplot(y ~ x, xlab = names(df)[1], ylab = names(df)[2])
    } else {
      plot(x, y, xlab = names(df)[1], ylab = names(df)[2], pch = 19)
    }
  })

  output$summary <- renderPrint({
    summary(newdata())
  })
}
