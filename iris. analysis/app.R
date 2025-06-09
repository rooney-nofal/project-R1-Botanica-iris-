# Load libraries
library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

# UI
ui <- fluidPage(
  theme = shinytheme("cerulean"),
  titlePanel("🌸 Iris Dataset Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "X-axis Variable:", 
                  choices = names(iris)[1:4], 
                  selected = "Petal.Length"),
      selectInput("yvar", "Y-axis Variable:", 
                  choices = names(iris)[1:4], 
                  selected = "Petal.Width"),
      selectInput("species", "Filter by Species:", 
                  choices = c("All", unique(iris$Species)), 
                  selected = "All")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Scatter Plot", plotOutput("scatterPlot")),
        tabPanel("Summary Stats", verbatimTextOutput("summaryStats")),
        tabPanel("Boxplot", plotOutput("boxPlot"))
      )
    )
  )
)

# Server
server <- function(input, output) {
  
  filtered_data <- reactive({
    if (input$species == "All") {
      iris
    } else {
      filter(iris, Species == input$species)
    }
  })
  
  output$scatterPlot <- renderPlot({
    ggplot(filtered_data(), aes_string(x = input$xvar, y = input$yvar, color = "Species")) +
      geom_point(size = 3, alpha = 0.8) +
      theme_minimal() +
      labs(title = "Scatter Plot", x = input$xvar, y = input$yvar)
  })
  
  output$summaryStats <- renderPrint({
    summary(filtered_data()[, c(input$xvar, input$yvar)])
  })
  
  output$boxPlot <- renderPlot({
    ggplot(filtered_data(), aes_string(x = "Species", y = input$yvar, fill = "Species")) +
      geom_boxplot() +
      theme_minimal() +
      labs(title = "Boxplot by Species", y = input$yvar)
  })
}

# Run App
shinyApp(ui = ui, server = server)

