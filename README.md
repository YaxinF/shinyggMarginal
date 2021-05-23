 <h1><center> Help of shinyggMarginal</center></h1>

>This is the help for the Shiny application presented in "shinyggMarginal": make marginal plot in R with shiny.  This document can solve some common problems encountered by users.

*****


# What is  shinyggMarginal?


>This is a tool for making  marginal plot.   This tool can add marginal distributions to the X and Y axis of a ggplot2 scatterplot.   It can be done using histogram, boxplot or density plot using the ggExtra library.  In addition, shinyggMarginal is good at details, including choosing color, text labels, color labels, layout, etc.  It also supports you to download PDF or SVG files.

*****

# How to use shinyggMarginal? 

### Under the Input data option, you can click the select box to  upload data or paste data.

### **1.  The uploaded data or paste data needs to be in numeric matrix format.**

>About the data to be uploaded or paste, the dataset should contain three columns, the first column is name, the second and third columns are value.  You can click on the question mark icon to get help.

### **2.  Choose margin plot type**

>There are three types to choose, which are histogram, density and boxplot.  If you select histogram,  you can set the width of the histogram by dragging the slider from 0.01 to 1.  If you select boxplot, you can choose whether to retain outliers or hide outliers.



### In the left sidebar there are three checkbox buttons to modify the parameters of the image

### **1.  Choose color**

>The color of the margin plot and scatter plot color can be customized, you can Choose the different color spectra you want.

### **2.  Add plot title**

>Click the Add plot title button to change the x axis title and y axis title.

### **3.  Adjust Plot parameter**

>Drag the slider to modify Point size, Point shape, Axis size and Title size.

####      When you upload all the data and adjust all the parameters, click the "Submit" button to generate the picture.



####      Under the Download option , we provides two file download formats, respectively PDF and SVG files, users can choose to download the file format to save to the local. 






