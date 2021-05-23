library(shiny)
library(shinydashboard)
library(ggplot2)
library(ggExtra)
library(shinyWidgets)


# 定义侧边栏
sidebar <- dashboardSidebar(
  checkboxInput("ggMarcolor", "Choose color", FALSE),
  conditionalPanel(
    condition = "input.ggMarcolor",
    h4("Choose margin plot color:",
       
    ),
    
    fluidRow(column(12, jscolorInput("var1", label = NULL, value = "#545A5C"))),
    h4("Choose scatter plot color:",
       
    ),
    
    fluidRow(column(12, jscolorInput("var5", label = NULL, value = "#000000"))),
  ),
  
  checkboxInput("ggMartitle", "Add plot title", FALSE) ,
                            conditionalPanel(
                              condition = "input.ggMartitle",
                              
                              textInput("ggMar_xTitle", h4("Plot x axis title:",
                                                           
                              ),value = c("X axis")),
                              
                              textInput("ggMar_yTitle", h4("Plot y axis title:",
                                                           
                              ),value = c("Y axis")),
                              ),
  checkboxInput("ggMarSize", "Adjust Plot parameter", FALSE),
  conditionalPanel(
    condition = "input.ggMarSize",
    sliderInput("var2", h4("Point size:"),
                min = 0, max = 10,
                value = 4.5,step = 0.5),
    sliderInput("var6", h4("Point shape:"),
                min = 0, max = 20,
                value = 20,step = 1),
    sliderInput("var3", h4("Axis size:"),
                min = 10, max = 30,
                value = 15,step = 1),
    sliderInput("var4", h4("Title size:"),
                min = 10, max = 50,
                value = 25,step = 1),
  ), actionButton("submit1",width = 200, strong("Submit"), styleclass = "success") ,
  
                            
   sidebarMenu(
        menuItem(text = "Input Data",  # item名字
                              tabName = "someplots", # 传递到tab的变量名称
                              icon = icon("archive")),
        
        menuItem(text = "Download",  # item名字
                 tabName = "download", # 传递到tab的变量名称
                 icon = icon("download")),
        
        menuItem(text = "Help",  # item名字
                 tabName = "help", # 传递到tab的变量名称
                 icon = icon("book"))
        
    ))
  


# 定义第一个选项卡
tab1 <- fluidRow(
    
    box(
      
      selectInput("seluploaddata", h4("Input Data",
                                      bsButton("bs00", label="", icon=icon("question"), style="info", size="small")
      ), c("Upload data" = "1","Paste data" = "2"), "2"),
      bsPopover("bs00", 'Select Input data type',"可下载或粘贴数据，数据集应该包含三列，第一列为名称，第二、三列为值",trigger = "focus"),
      conditionalPanel(condition="input.seluploaddata == '1'",
                       fileInput("Upload_data",label="",multiple = FALSE),
                       downloadButton("Example_data.txt", "Example data"),
      ),
      conditionalPanel(condition="input.seluploaddata == '2'",
                       textAreaInput("Paste_data",label="",width="100%", resize="vertical", 
                                     height="200px",placeholder = "Paste text to upload data"),
                       actionButton("Paste_example", strong("Paste example data"), styleclass = "info"),      
      ),
      
      selectInput('plot_type','Choose margin plot type:',c("histogram" = "1","density" = "2","boxplot" = "3"), "1"),
      conditionalPanel(condition="input.plot_type == '1'",
                       sliderInput("var7", h4("Width of histogram:"),
                                   min = 0.001, max = 1.0,
                                   value = 0.1,step = 0.001),
      ),
      conditionalPanel(condition="input.plot_type == '2'"),
      conditionalPanel(condition="input.plot_type == '3'",
                       radioButtons("outlier", label = "", 
                                    choices = list("Retain outliers" = 1, "Hide outliers" = 2),
                                    selected = 1))),
    box(plotOutput("ggplot", width = "70%", height = "600px")),

)



# 定义第2个选项卡内容
tab2_1<-downloadButton("downloadggMar.pdf", "Download PDF File")
tab2_2<-downloadButton("downloadggMar.svg", "Download SVG File")


# 定义第3个选项卡内容
tab3 <-fluidRow(box(width=20,
                    includeMarkdown("README.md")))

  
# 定义主体
body <- dashboardBody(
    tabItems(
        tabItem(tabName = "someplots", # 根据menuItem中的tabName进行联动
                              tab1), # 插入选项卡内容
        
        tabItem(tabName = "download",# 根据menuItem中的tabName进行联动
                tab2_1,tab2_2),# 插入选项卡内容
        
        tabItem(tabName = "help",# 根据menuItem中的tabName进行联动
                tab3 )# 插入选项卡内容
        
       
         )
 )


# 组合在一起
dashboardPage(
    dashboardHeader(title = "shinyggMarginal"),
    sidebar,
    body
  )