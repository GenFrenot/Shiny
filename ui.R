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

units<-c("Acre"=1
         ,"Hectare"=2
         ,"Square Kilometer"=3
         ,"Number of Football Field"=4)

# This is the User Interface for dataset viewer application
shinyUI(fluidPage(
    pageWithSidebar(
        # Application title
        headerPanel("Destination Island"),
        
        sidebarPanel(
            
            # input in the form of a pulldown list widget
            selectInput('inputValue', 'Pick up your favorite destintation'
                        , names(islands)
                        , selected = "Tasmania"),
            radioButtons('conversion'
                               , 'Choose the unit to convert the Island Size into'
                               , units
            )
        ),
        mainPanel(
            h3('Your dream island is'),
            verbatimTextOutput("island"),
            h4('It has a size of '),
            verbatimTextOutput("size"),
            h4('which represents also approximately:'),
            verbatimTextOutput("nbfields"),
            hr(),
            p("Context:"),
            p(paste("This simple application uses the R data set 'island'",
                    "which is a list of Island Names and their sizes",
                    "in thousand of square miles.")),
            p(paste("You have the possibility to see this size converted",
                    "either in Acres, in Hectares, in Square Kilometers",
                    "or for fun, in Number of Football Fields.")),
            p("Usage:"),
            p(paste("To proceed, go to the top left and select your dream island from the list. ",
                    "Then choose one measurement unit out of the four possibilities. ",
                    "The result will refresh automatically in the main panel."))
            
        )
    )
))
