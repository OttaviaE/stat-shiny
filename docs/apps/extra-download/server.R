library(shiny)

server <- function(input, output, session) {

  dataInput <- eventReactive(input$load, {
    switch(input$dataset,
           rock = rock,
           pressure = pressure,
           cars = cars)
  })

  # descriptive statistics of the first two columns
  ddata <- reactive({
    df <- dataInput()[, 1:2]
    data.frame(variable = names(df),
               mean = sapply(df, mean),
               sd = sapply(df, sd),
               row.names = NULL)
  })

  output$graph <- renderPlot({
    plot(dataInput()[, 1:2])
  })

  output$summary <- renderPrint({
    ddata()
  })

  # downloadHandler = the "render" function of downloadButton()
  output$downloadSummary <- downloadHandler(
    filename = function() {
      paste0("descriptive-", input$dataset, ".csv")
    },
    content = function(file) {
      write.csv(ddata(), file, row.names = FALSE)
    }
  )

  output$downloadPlot <- downloadHandler(
    filename = function() {
      paste0("plot-", input$dataset, ".png")
    },
    content = function(file) {
      png(file, width = 800, height = 600)
      plot(dataInput()[, 1:2])
      dev.off()
    }
  )
}
