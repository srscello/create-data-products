library(shiny)
library(datasets)

data_desc = c(
  LakeHuron             = "Level of Lake Huron 1875-1972",
  co2                   = "Mauna Loa Atmospheric CO2 Concentration",
  nhtemp                = "Average Yearly Temperatures in New Haven",
  sunspot.year          = "Yearly Sunspot Data, 1700-1988",
  treering              ="Yearly Treering Data, -6000-1979"
  )


# Define server logic required to plot various variables against mpg
shinyServer(function(input,output) {

  
  output$instructionsheader <-renderText("Instructions")
  output$instructions <- renderText(
    "Select one or more \ntime series data sets from base R package.")
  output$caption <- renderText({
      if(input$compare) {
        cap1 <- paste(input$dataset," vs.", input$dataset1)
      } else {
        cap1 <- paste(input$dataset,":", data_desc[input$dataset])
      }
      cap1
  })

  output$tsPlot <- renderPlot({
    if(input$compare) {
      
      ds1 <- window(get(input$dataset),frequency=1)
      ds2 <- window(get(input$dataset1),frequency=1)
      if(input$trimrange || input$crossplot) {
        t1 <- max(start(ds1)[1],start(ds2)[1])
        t2 <- min(end(ds1)[1],end(ds2)[1])
        if(t2>t1) {
          ds1 <- window(ds1,t1,t2)
          ds2 <- window(ds2, t1,t2)
        }
      }
      
      df = cbind(ds1,ds2)
      colnames(df) = c(input$dataset,input$dataset1)
      if(input$compare) {
        cap1 <- paste(input$dataset," vs.", input$dataset1)
      } else {
        cap1 <- input$dataset
      }
      if(input$crossplot) {
        df1 <- data.frame(as.numeric(ds1),as.numeric(ds2))
        colnames(df1) <- c(input$dataset,input$dataset1)
        fm1 <- paste(input$dataset1,"~",input$dataset)

        fit1 <-lm(as.formula(fm1),data=df1)
        sumfit1 <- summary(fit1)
        r2val <- sumfit1$r.squared
        
        plot(as.formula(fm1), data=df1,main=paste(fm1,", r-squared:",round(r2val,2)))

        lines(df1[[1]],predict(fit1),col="red")
      } else {
        plot(df,main=cap1)
      }
    } else {
  
      # Just plot a single time series, but put in mean and linear trend
      ds1 <- window(get(input$dataset))
      df1=data.frame(t=time(ds1),y=ds1)
      fit1=lm(y~t,df1)
      
      # Plot data
      f.slope=round(fit1$coefficients[2],2)
      f.mean=round(mean(ds1))
      maintitle=paste(input$dataset,", mean=",f.mean,", slope=",f.slope)
      plot(ds1,ylab=input$dataset,main=maintitle)

      # Plot mean
      abline(h=mean(ds1),col="red")

      # Plot linear trend line
      abline(fit1,col="blue")
    }
  })
})