library(shiny)
# Define UI for Earthquest application
shinyUI(pageWithSidebar(
  
    # Application title
    headerPanel("EarthQuest"),
    
    sidebarPanel(
      selectInput("dataset","Time Series Dataset:",
                  list("Sunspots"="sunspot.year",
                       "Lake Huron Level" = "LakeHuron",
                       "CO2 ppm on Mauna Loa" = "co2",
                       "New Haven Temp (deg F)" = "nhtemp",
                       "Tree Ring Width (normalized)" = "treering"
                  )),

    checkboxInput("compare","Compare Datasets",FALSE),
      conditionalPanel(
        condition = "input.compare == true",
            selectInput("dataset1","Time Series Dataset:",
                  list("CO2 ppm on Mauna Loa" = "co2",
                       "Sunspots"="sunspot.year",
                       "Lake Huron Level" = "LakeHuron",
                       "New Haven Temp (deg F)" = "nhtemp",
                       "Tree Ring Width (normalized)" = "treering"
                  )),
        checkboxInput("trimrange","Trim Time Range",TRUE),
        checkboxInput("crossplot","Cross Plot",FALSE)
      ),
      h3(textOutput("instructionsheader")),
      p(textOutput("instructions")),
      a(href="earthquest-documentation.html","Documentation",target="_blank"),
      p(""),
      a(href="http://github.com/srscello/create-data-products.git",
        "GitHub Repository for Project with Slides",target="_blank"),
    p(""),
    a(href="http://github.com/srscello/create-data-products/tree/gh-pages/earthquest",
      "GitHub Repository for Source",target="_blank")
    
    
      ),
        
    mainPanel(
        h3(textOutput("caption")),
        plotOutput("tsPlot")
    )
    
))
