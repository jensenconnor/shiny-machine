library(shiny)
rstdata <- read.csv("D:/Workspace/Programming/R/wrkdir/researchDB/data/researchdata.csv", header = TRUE, sep = ",")

shinyUI(fluidPage(
  titlePanel('Iowa Soybean Association Research Database'),
  sidebarLayout(
    sidebarPanel(
      h2("Instructions"),
      p("Limit trial results as desired by selecting one or more values for Year, Crop, Trial Type, Trial Detail, Crop District, Watershed, Landform Region, and County. Hold the ", 
        em("CTRL"), 
        " key and click to select multiple items."),
      br(),
      # Create a new Row in the UI for selectInputs
      #Year
      selectInput("Year","Year:",c("All",unique(as.character(rstdata$Year))),selected = "All", multiple = TRUE),
      #Crop
      selectInput("Crop","Crop:",c("All",unique(as.character(rstdata$Crop)))),
      #Trial Type
      selectInput("TrialType","Trial Type:",c("All",unique(as.character(rstdata$TrialType)))),
      #Trial Detail
      selectInput("TrialDetail","Trial Detail:",c("All",unique(as.character(rstdata$TrialDetail)))),
      #County
      selectInput("County","County:",c("All",unique(as.character(rstdata$County))),selected = "All", multiple = TRUE),
      #Watershed
      selectInput("Watershed","Watershed:",c("All",unique(as.character(rstdata$Watershed))),selected = "All", multiple = TRUE),
      br(),
      br(),
      img(src = "ISAlogo.png", height = 62, width = 220),
      img(src = "ofnlogo.png", height = 69, width = 172)   
    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel('Strip Trials', conditionalPanel('input.dataset === "Strip Trials"',
          checkboxGroupInput('show_vars', 'Show/Hide Columns:',
          names(rstdata), selected = names(rstdata), inline = TRUE)), 
          dataTableOutput('rsttable')),
        tabPanel('Guided Stalk Sampling', dataTableOutput('mytable2')),
        tabPanel('Summary Statistics', dataTableOutput('mytable3'))
      )
    )
  )
))                                                                                                                                                                    