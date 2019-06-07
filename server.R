#
# This is a Shiny web application that proposes the list of islands from
# the R data "islands". Selecting an island displays the corresponding
# island size in square miles and, for fun, in number of football fields
# 
# You can run the application by clicking
# the 'runApp()' fiunction.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

data("islands")

# The server takes the name of the selected island
# and populates data to be displayed as a result:
# the island name, the size in square miles and in number of football fields
shinyServer(
    function(input, output) {
        
        # reactive function to get the island size in square miles 
        mySizeFun <- reactive ({ 
            
                # calculating the island size in square miles based on the ui input:
                # get the selected island size out of the "islands" data set
                ifelse(is.null(input$inputValue)
                      ,0
                      ,as.numeric(islands[input$inputValue])
                )
            })
        
        # reactive function to get the nb of football fields
        myNbfieldsFun <- reactive({ 
            
                # the island size in number of football fields
                # 1 square miles represents the size of 484 football fields
                ifelse(is.null(input$inputValue)
                      ,0
                      ,format(islands[input$inputValue]*484
                                              , big.mark="'")
                )
            })
        
        # the island name
        output$island <- renderPrint({ input$inputValue })
        
        # the island size in square miles 
        output$size <- renderPrint({ mySizeFun() })
        
        # the island size in nb of football fields
        output$nbfields <- renderPrint({ myNbfieldsFun()  })
        
        
    }
)