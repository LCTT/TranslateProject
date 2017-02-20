如何用 R 语言的 Shiny 库编写 web 程序
============================================================
 ![How to write web apps in R with Shiny](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUSINESS_lightbulbs.png?itok=70w-2-Ta "How to write web apps in R with Shiny") 
图片提供： 

opensource.com

新年快乐！我这个月在写一些更加长的文章，所以你可以在未来几个星期内寻找它们。对于这个月的 Nooks 和 Crannies，我想简要地提一个我一直在自己在玩的一个很棒的 R 库。

我的一个亲密朋友最近在用 R 编写东西。我一直都对它很感兴趣，一直在试图挤一点时间，至少学习更多关于 R 以及你可以做的事情的种类。探索 R 的数字处理能力对我而言是一个持续斗争，因为我并不是如我朋友那样有一个数学头脑。这对我来说很慢，但我一直试图将它与我在其他领域的经验联系起来，我甚至开始考虑非常简单的 web 程序。

[Shiny][1]是一个来自 RStudio 的工具包，它让创建 web 程序变得更容易。它能从 R 控制台轻松安装，只需要一行，最新的稳定版本将加载供你使用。这里有一个很棒的[教程][2]，它会通过设置应用程序的概念、通过前面的课程构建技能的方式引导你。 Shiny 的授权是 GPLv3，源代码可以在 [GitHub][3] 上获得。

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

当你在输入框中输入时文字时，它会复制提示语句后面的文字。这并没有什么奇特的，但它向你展示了一个 Shiny 程序的基本结构。“服务端”部分允许你处理所有后端工作，如计算、数据库检索或程序需要发生的任何其他操作。“UI”部分定义了接口，它可以根据需要变得简单或复杂。

Shiny 中包含的大量样式和主题使用的是 [Bootstrap][4]，所以你可以在学习了一点后，就能用 R 创建广泛的、功能丰富的 web 程序。附加包可以扩展功能，甚至更高级的 JavaScript 程序、模板等。

你可以以几种方式处理 Shiny 的后端工作。如果你只是在本地运行你的程序，加载库会就能做到。对于想要发布到网络上的程序，你可以在[ RStudio 的 Shiny 网站][5]上共享它们，运行开源版本的 Shiny 服务器，或通过年度订阅服务从 RStudio 处购买 Shiny Server Pro。

经验丰富的 R 大牛可能已经知道 Shiny 了;它已经存在大约几年了。对于像我这样从一个完全不同的编程语言来的人并希望学习一点 R 的人来说，我发现它是相当有帮助的。

--------------------------------------------------------------------------------


作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/ruth1_avi.jpg?itok=I_EE7NmY)

D Ruth Bavousett - D Ruth Bavousett 已经成为一名系统管理员和软件开发人员很长时间了，他的专业生涯开始于 VAX 11/780。在她的职业生涯（迄今为止）中，她花费了大量的时间在满足库的需求上，她自 2008 年以来一直是 Koha 开源库自动化套件的贡献者. Ruth 目前是休斯敦 cPanel 的 Perl 开发人员， 的两只猫的工作人员。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/writing-new-web-apps-shiny

作者：[D Ruth Bavousett][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:http://shiny.rstudio.com/
[2]:http://shiny.rstudio.com/tutorial
[3]:https://github.com/studio/shiny
[4]:http://getbootstrap.com/
[5]:http://shinyapps.io/
