如何用 R 语言的 Shiny 库编写 web 程序
============================================================
 ![How to write web apps in R with Shiny](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUSINESS_lightbulbs.png?itok=70w-2-Ta "How to write web apps in R with Shiny") 

图片提供： opensource.com

我这个月在写一些更加长的文章，所以你们可以在几周后再来看看。本月，我想简要地提下我自己一直在玩的一个很棒的 R 库。

我的一个亲密朋友最近在用 R 编写东西。我一直都对它很感兴趣，也一直在试图挤时间，学习更多关于 R 的知识以及可用它做的事情。探索 R 的超强数字处理能力对我而言有些困难，因为我并不如我朋友那样有一个数学头脑。我进展有点慢，但我一直试图将它与我在其他领域的经验联系起来，我甚至开始考虑非常简单的 web 程序。

[Shiny][1] 是一个来自 RStudio 的工具包，它让创建 web 程序变得更容易。它能从 R 控制台轻松安装，只需要一行，就可以加载好最新的稳定版本来使用。这里有一个很棒的[教程][2]，它可以在前面课程基础上，带着你理解应用架设的概念。 Shiny 的授权是 GPLv3，源代码可以在 [GitHub][3] 上获得。

这是一个用 Shiny 写的简单的小 web 程序：

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

当你在输入框中输入文字时，它会被复制到输出框中提示语后。这并没有什么奇特的，但它向你展示了一个 Shiny 程序的基本结构。“server”部分允许你处理所有后端工作，如计算、数据库检索或程序需要发生的任何其他操作。“ui”部分定义了接口，它可以根据需要变得简单或复杂。

包括在 Shiny 中的 [Bootstrap][4] 有了大量样式和主题，所以在学习了一点后，就能用 R 创建大量功能丰富的 web 程序。使用附加包可以将功能扩展到更高级的 JavaScript 程序、模板等。

有几种方式处理 Shiny 的后端工作。如果你只是在本地运行你的程序，加载库就能做到。对于想要发布到网络上的程序，你可以在 [RStudio 的 Shiny 网站][5]上共享它们，运行开源版本的 Shiny 服务器，或通过按年订阅服务从 RStudio 处购买 Shiny Server Pro。

经验丰富的 R 大牛可能已经知道 Shiny 了；它已经存在大约几年了。对于像我这样来自一个完全不同的编程语言，并且希望学习一点 R 的人来说，它是相当有帮助的。

--------------------------------------------------------------------------------


作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/ruth1_avi.jpg?itok=I_EE7NmY)

D Ruth Bavousett - D Ruth Bavousett 作为一名系统管理员和软件开发人员已经很长时间了，她的专业生涯开始于 VAX 11/780。在她的职业生涯（迄今为止）中，她花费了大量的时间在满足库的需求上，她自 2008 年以来一直是 Koha 开源库自动化套件的贡献者. Ruth 目前在休斯敦的 cPanel 任 Perl 开发人员，他也作为首席员工效力于双猫公司。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/writing-new-web-apps-shiny

作者：[D Ruth Bavousett][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:http://shiny.rstudio.com/
[2]:http://shiny.rstudio.com/tutorial
[3]:https://github.com/studio/shiny
[4]:http://getbootstrap.com/
[5]:http://shinyapps.io/
