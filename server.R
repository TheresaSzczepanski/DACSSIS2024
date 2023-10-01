# Define server logic required to draw a histogram
server <- function(input, output){
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  output$plot2 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  ## Output for plots and tables in U1, uncomment as you
  
  # output$SG9Top_Loss_Bar<-renderPlot({
  #   SG9Top_Loss_Bar
  # })
  # 
  # output$EG10_Bar_Plot<-renderPlot({
  #   EG10_Bar_Plot
  # })
  # 
  # output$SG9_TopStudent_item_perf<- renderDataTable(SG9_TopStudent_item_perf)
  # 
  # output$EG10_student_item_perf_by_type<- renderDataTable(EG10_student_item_perf_by_type)
  # 
  # output$approvalBox <- renderValueBox({
  #   MF_Points<-Reporting_Cat_Points("science", "MF", SG9_item)[1,2]
  #   valueBox(
  #     MF_Points, "MF TEST", icon = icon("thumbs-up", lib = "glyphicon"),
  #     color = "yellow"
  #   )
  #})
  
  
  
}