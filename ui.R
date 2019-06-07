#
# This is a Shiny web application that proposes the list of islands from
# the R data "islands". Selecting an island displays the corresponding
# island size in square miles and, for fun, in number of football fields
# 
# You can run the application by clicking
# the 'runApp()' fiunction.
#
# To use the already published application:
#
#   https://genfrenot.shinyapps.io/Shiny/ 
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# This is the User Interface for dataset viewer application
shinyUI(fluidPage(
    pageWithSidebar(
        # Application title
        headerPanel("Destination Island"),
        
        sidebarPanel(
            
            # input in the form of a pulldown list widget
            selectInput('inputValue', 'Pick up your favorite destintation'
                        , names(islands)
                        , selected = "Tasmania")
        ),
        mainPanel(
            h3('Your dream island is'),
            verbatimTextOutput("island"),
            h4('and has a size of '),
            verbatimTextOutput("size"),
            h4(' thousand square miles,'),
            h4(' which represents the size of'),
            verbatimTextOutput("nbfields"),
            h4(' football fields!')
        )
    )
))
