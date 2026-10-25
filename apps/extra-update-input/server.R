library(shiny)

server <- function(input, output, session) {   # session is needed by update*()

  dataInput <- eventReactive(input$load, {
    switch(input$dataset,
           rock = rock,
           pressure = pressure,
           cars = cars)
  })

  # observeEvent: DO something (a side effect) when the data change.
  # It returns nothing: it updates the menus that already exist in the UI
  observeEvent(dataInput(), {
    vars <- names(dataInput())
    updateSelectInput(session, "x", choices = vars, selected = vars[1])
    updateSelectInput(session, "y", choices = vars,
                      selected = vars[min(2, length(vars))])
  })

  # freeze data + chosen variables when "Update analysis" is clicked
  analysisInput <- eventReactive(input$analyze, {
    req(input$x, input$y)
    list(data = dataInput(), x = input$x, y = input$y)
  })

  output$graph <- renderPlot({
    obj <- analysisInput()
    plot(obj$data[[obj$x]], obj$data[[obj$y]],
         xlab = obj$x, ylab = obj$y, pch = 19)
  })

  output$summary <- renderPrint({
    obj <- analysisInput()
    summary(obj$data[, c(obj$x, obj$y)])
  })
}
