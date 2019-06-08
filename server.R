#
# This is a Shiny web application that proposes the list of islands from
# the R data "islands". Selecting an island displays the corresponding
# island size in square miles and, for fun, in number of football fields
# 
# You can run the application by using
# the 'runApp()' function.
#
# To use the already published application:
#
#   https://genfrenot.shinyapps.io/Shiny/ 
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Loads the island size data set on the server
data("islands")

# A table of conversion from the square miles provided in the "island" data set
# to the wished unit
conversions<-c(
    # 1 square miles corresponds to 640 acre
    "Acres"=640
    # 1 square miles corresponds to 258.999 hectar            
    ,"Hectares"=258.999
    # 1 square miles corresponds to 2.589 square kilometer
    ,"Square Kilometers"=2.589
    # 1 square miles represents the size of 484 football fields
    ,"Number of Football Fields"=484)


# The server takes the name of the selected island
# and populates data to be displayed as a result:
# the island name, the size in square miles and in number of football fields
shinyServer(
    function(input, output) {
        
        # reactive function to get the island size in square miles 
        mySizeFun <- reactive ({ 
            
                # calculating the island size in square miles based on the ui input:
                # get the selected island size out of the "islands" data set
                size <- as.numeric(islands[input$inputValue]) * # islands data is in thousand square miles
                    1000                            # convert to number of square miles
                    
                # format the outcome
                paste(format(size, big.mark="'")
                          ,"square miles"
                          ,sep=" ")
                
        })
        
        # reactive function to get the converted size
        myNbfieldsFun <- reactive({ 
            convertedSize <- round(islands[input$inputValue] * # islands data is in thousand square miles
                                   conversions[as.numeric(input$conversion)])* # convert to wished unit
                             1000 # multiply by thousand because the original data is in thousand square miles
                                  # we do this multiplication after rounding as the conversion rates are approximate
                                 
            # format the outcome
            paste(format(convertedSize, big.mark="'")
                  ,names(conversions[as.numeric(input$conversion)])
                  ,sep=" ")
            
        })
        
        
        # the island name
        output$island <- renderPrint({ input$inputValue })
        
        # the island size in square miles 
        output$size <- renderPrint({ mySizeFun() })
        
        # the island size in nb of football fields
        output$nbfields <- renderPrint({ myNbfieldsFun()  })
        
        
    }
)