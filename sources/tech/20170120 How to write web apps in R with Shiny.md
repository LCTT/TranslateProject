How to write web apps in R with Shiny
============================================================
 ![How to write web apps in R with Shiny](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUSINESS_lightbulbs.png?itok=70w-2-Ta "How to write web apps in R with Shiny") 
Image by : 

opensource.com

Happy new year! I'm in the thick of working on a couple of larger articles this month, so look for those in the coming weeks. For this month's Nooks and Crannies, I want to point out briefly a great R library I've been playing with for my own self-education.

A close friend of mine has been hacking things in R lately. I've been intrigued, and I've been trying to squeeze in a little time to at least learn more about R and the kinds of things you can do with it. Figuring out the number-crunching capabilities is an ongoing struggle for me, as I'm not nearly the brilliant math-oriented mind my friend is. It's kind of a slow go for me, but I've been trying to relate it to my experience in other areas, and I started thinking about even very simple web applications.

[Shiny][1] is a toolkit from RStudio that makes creating web applications much easier. Installation is easy from an R console, just one line, and the latest stable version will be loaded up for you to use. There's a great [tutorial][2] that walks you through the concepts of setting up application, building one skill on top of prior lessons. Shiny is licensed GPLv3, and the source is available on [GitHub][3].

Here's a simple little web application written with Shiny:

```

library(shiny)

server <- function(input, output, session) {
    observe({
	    myText <- paste("Value above is: ", input$textIn)
		updateTextInput(session, "textOut", value=myText)
    })
}

ui <- basicPage(
    h3("My very own sample application!"),
	textInput("textIn", "Input goes here, please."),
	textInput("textOut", "Results will be printed in this box")
)

shinyApp(ui = ui, server = server)
```

When you type in the input box, the text is copied after the prefix in the output box. This is nothing fancy, but it shows you the fundamental structure of a Shiny application. The "server" section lets you handle all your back-end work, such as calculations, database retrieval, or whatever else the app needs to happen. The "UI" section defines the interface, which can be as simple or as complicated as needed.

Included in Shiny are extensive capabilities for styling and display themes using [Bootstrap][4], so you can, after learning a bit, create extensive, feature-rich applications for the web in R. Add-on packages can extend the capabilities to even more advanced JavaScript applications, templating, and more.

You can handle the back-end work of Shiny in several ways. If you're just running your application locally, having the library loaded will do the trick. For applications you want to serve out to the web, you can share them on [RStudio's Shiny website][5], run an open source version of the Shiny server, or buy Shiny Server Pro from RStudio via a yearly subscription service.

Experienced R gurus may already know all about Shiny; it's been around a couple of years now. For people like me who come from a completely different sort of programming and want to learn a bit about R, I've found it quite helpful.

--------------------------------------------------------------------------------


作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/ruth1_avi.jpg?itok=I_EE7NmY)

D Ruth Bavousett - D Ruth Bavousett has been a system administrator and software developer for a long, long time, getting her professional start on a VAX 11/780, way back when. She spent a lot of her career (so far) serving the technology needs of libraries, and has been a contributor since 2008 to the Koha open source library automation suite.Ruth is currently a Perl Developer at cPanel in Houston, and also serves as chief of staff for two cats.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/writing-new-web-apps-shiny

作者：[D Ruth Bavousett][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:http://shiny.rstudio.com/
[2]:http://shiny.rstudio.com/tutorial
[3]:https://github.com/studio/shiny
[4]:http://getbootstrap.com/
[5]:http://shinyapps.io/
