library(shiny)
library(tidyverse)
#setwd("~/Documents/STAT\ 545/stat545_participation/bcl")
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

#a <- 5

# Define UI for application that draws a histogram
ui <- fluidPage(titlePanel("BC Liquor price app", 
                           windowTitle = "BCL app"),
                sidebarLayout(
                  sidebarPanel(
                    sliderInput("priceInput", "Select your desired price range.",
                                min = 0, max = 100, value = c(15, 30), pre="$"),
                    radioButtons("typeInput", "Select your beverage.",
                                 choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                                 selected = "WINE")
                  ),
                  mainPanel(
                    plotOutput("price_hist"),
                    tableOutput("bcl_data")
                  )
                )
)

##ui should not have any R code which does not output HTML code

# Define server logic required to draw a histogram
server <- function(input, output) {
  observe(print(input$priceInput))
  bcl_filtered <- reactive({
    bcl %>% 
      filter(Price < input$priceInput[2],
             Price > input$priceInput[1],
             Type == input$typeInput)
  })
  output$price_hist <- renderPlot({
    bcl_filtered() %>%  
      ggplot(aes(Price)) +
      geom_histogram()
  })
  output$bcl_data <- renderTable({
    bcl_filtered()
  })
}

##R is non-reactive. To make an object reactive in Shiny, use reactive().
##The object then becomes a function.

# Run the application 
shinyApp(ui = ui, server = server)


# "This is some text",
#  br(),
# br(),
#"More text",
#tags$h1("Level 1 header"),
#tags[["h1"]]("tags are named lists, so this works too"),
#  h1(em("Level 1 header, part 2")),
# HTML("<h1>Level 1 header, part 3</h1>"),
#  tags$blockquote("This is a block quote."),
# tags$ol(
#  tags$li("First list item"), 
#  tags$li(strong("Second list item")), 
#  tags$li("Third list item")),
#tags$a(href="https://shiny.rstudio.com/articles/tag-glossary.html", "Shiny tags"),
#print(a)
