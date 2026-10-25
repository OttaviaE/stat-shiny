library(shiny)

server <- function(input, output, session) {

  # reactiveValues: a "shelf" where we put objects and change them later
  values <- reactiveValues()

  observeEvent(input$load, {
    values$data <- switch(input$dataset,
                          rock = rock,
                          pressure = pressure,
                          cars = cars)
  })

  output$var1 <- renderUI({
    nam <- names(values$data)
    selectInput("var1", "Select x:", choices = nam, selected = nam[1])
  })

  output$var2 <- renderUI({
    nam <- names(values$data)
    selectInput("var2", "Select y:", choices = nam, selected = nam[2])
  })

  observeEvent(input$select, {
    values$df <- values$data[, c(input$var1, input$var2)]
  })

  output$graph <- renderPlot({
    validate(need(input$select > 0, "Waiting for data"))
    plot(values$df[, 1:2])
  })

  output$summary <- renderPrint({
    validate(need(input$select > 0, "Waiting for data"))
    summary(values$df)
  })

  output$points <- renderPrint({
    req(values$df)
    pointID <- nearPoints(values$df, input$plot_click,
                          xvar = names(values$df)[1],
                          yvar = names(values$df)[2])
    validate(need(nrow(pointID) != 0, "Click on a point"))
    pointID
  })

  output$brush <- renderPrint({
    req(values$df)
    brushID <- brushedPoints(values$df, input$plot_brush,
                             xvar = names(values$df)[1],
                             yvar = names(values$df)[2])
    validate(need(nrow(brushID) != 0, "Highlight an area"))
    brushID
  })
}
