#### Preamble ####
# Purpose:  Build a shiny model that to create an interactive graph and an 
# interactive table, to create an interactive graph and an interactive table.
# User can specify the groups they are interested in seeing data for.
# Author: Siqi Fei
# Date: 28 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites:install pacakge shiny, ggplo2, DT and here
# Any other information needed? Make sure the raw data file is located at 
#'data/raw_data/Auschwitz_Death_Certificates_1942-1943 - Auschwitz.csv' 
# before running this script.

#### Work space Setup ####
library(shiny)
library(ggplot2)
library(DT)

# Load dataset
data <- read.csv("data/analysis_data.csv")


# Define UI
ui <- fluidPage(
  titlePanel("Number of Holocaust Victims"),
  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Select Category:", choices = c("Birthplace", "Religion"), selected = "Birthplace"),
      uiOutput("group_select") #  allow multiple selections
    ),
    mainPanel(
      plotOutput("plot"),
      DTOutput("table")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  output$group_select <- renderUI({
    selectInput("group", "Select Group:", choices = unique(data[[input$category]]), multiple = TRUE) # Enable multiple selection
  })
  
  filtered_data <- reactive({
    if (length(input$group) > 0) {
      data[data[[input$category]] %in% input$group,]
    } else {
      data.frame() # Return an empty data frame if no group is selected
    }
  })
  
  output$plot <- renderPlot({
    df <- filtered_data()
    if(nrow(df) > 0) {
      # Count the occurrences of each category
      df_count <- as.data.frame(table(df[[input$category]]))
      colnames(df_count) <- c("Category", "Count")
      
      # Calculate proportions for the pie chart
      df_count$Proportion <- df_count$Count / sum(df_count$Count)
      
      ggplot(df_count, aes(x = "", y = Proportion, fill = Category)) +
        geom_bar(width = 1, stat = "identity") +
        coord_polar("y", start = 0) +
        labs(fill = input$category, title = paste("Proportion of People by", input$category)) +
        theme_void() +
        scale_fill_viridis_d() # Using viridis for a visually appealing color scale
    }
  })
  
  output$table <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 5))
  }, server = FALSE) # Set server = FALSE for client-side processing, useful for interactive filtering
}

# Run the application
shinyApp(ui = ui, server = server)

