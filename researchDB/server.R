library(shiny)
rstdata <- read.csv("D:/Workspace/Programming/R/wrkdir/researchDB/data/researchdata.csv", header = TRUE, sep = ",")
shinyServer(function(input, output) {
  
  # a large table, reative to input$show_vars
  output$rsttable <- renderDataTable({
    if (input$Year != "All"){
      rstdata <- rstdata[rstdata$Year == input$Year,]
    }
    if (input$Crop != "All"){
      rstdata <- rstdata[rstdata$Crop == input$Crop,]
    }
    if (input$TrialType != "All"){
      rstdata <- rstdata[rstdata$TrialType == input$TrialType,]
    }
    if (input$TrialDetail != "All"){
      rstdata <- rstdata[rstdata$TrialDetail == input$TrialDetail,]
    }
    if (input$County != "All"){
      rstdata <- rstdata[rstdata$County == input$County,]
    }
    if (input$Watershed != "All"){
      rstdata <- rstdata[rstdata$Watershed == input$Watershed,]
    }
    rstdata[, input$show_vars, drop = FALSE]
  
  })
  
})