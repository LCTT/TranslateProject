2017 年 Go 语言编程的五大关注点
============================================================

### 今年像动态插件，Serverless Go 以及 HTTP/2 这些创新对你的开发意味着什么？

Go 1.8 刚刚发布，它有几个新功能，包括：

* [HTTP/2 Push][1]
* [HTTP 服务器平滑关闭][2]
* [插件][3]
* [缺省 GOPATH][4]

这些新功能的影响力取决于你和开发团队如何使用 Go。 自从 Go 1.0 于 2012 年发布以来，其简单性、并发性和内置支持使其保持[普及度][9]不断增长，所以对“Go 擅长什么”的答案一直在增长。

这里我会提供一些想法，包括新到来的版本及 Go 世界最近其它吸引我的地方。这不是一个详尽的列表，所以请[让我知道][10]你认为在 2017 年 Go 还会发生哪些重要的事。

### Go 的超级可部署性 + 插件 = 容器、任何东西？

[1.8 版本][11]已经发布，我已经与其中几个人交谈过添加动态插件会如何影响像容器之类的事物，动态插件是为了加载在编译时不是程序一部分的共享库的代码。 动态插件使容器中的高并发微服务变得更加简单。 你可以轻松地以外部进程的方式加载插件，同时具备在容器中微服务的所有好处：保护你的主进程不会崩溃，并且没有任何东西会搞乱你的内存空间。 对插件的动态支持应该是在 Go 中使用容器的福音。

*关于专家现场 Go 培训，请注册 [ Go Beyond the Basics][12]。*

### 跨平台支持仍在吸引开发人员

在 Go 开源之后的 7 年里，它已被全球采用。[Daniel Whitenack][13] 是一名数据科学家和工程师，他为 Jupyter 维护 Go 内核，告诉我最近他[在西伯利亚做数据科学和 Go 语言培训][14]，（是的，在西伯利亚！数据科学和 Go - 之后再细讲一下...）并 “很惊讶地看到那里 Go 社区是如此活跃和积极。” 人们继续在项目中采取 Go 的另一个很大的原因是交叉编译，对此，几个 Go 专家解释说[这在 Go 1.5 版本中变得更容易了][15]。来自其他语言（如 Python）的开发人员应该发现，在没有 VM 的目标平台上，能够为多个操作系统构建捆绑的、可部署的应用程序是在 Go 中工作的关键。

在 1.8 版本中对跨平台的支持，再加上[提升了 15% 的编译速度][16]，你就可以看到为什么 Go 是初创公司最喜欢的语言。

*有兴趣了解 Go 的基础知识吗？查看 [Go 基础学习路径][17] 让 O’Reilly 专家来带你开始。*

###  Go 解释器在开发中；再见 Read-Eval-Print-Loop

有一些聪明的家伙正在做一个 [Go 解释器][18]，我一定会持续关注它。如你所知的那样，有几个 Read-Eval-Print-Loop（REPL）的解决方案可以用来评估表达式，以确保代码如你预期的工作，但那些方法通常意味着容忍一些不便，或需要费力从几个方案中找到一个适合你的用例的。有一个健壮、一致的解释器就太好了，一旦我了解到更多消息，我会告诉你们。

*在开发中使用 Go 复杂特性？观看 O'Reilly 的视频训练 [中级 Go ][19]*。

### Go 的 serverless - 会是什么样子？

是的，现在围绕 serverless 架构（功能即服务（FaaS））有很多炒作。但有时候也有些捉摸不定的地方，那么关于 Go 的 serverless 发生了什么？我们能在今年看到一个 Go 语言原生支持的 serverless 服务么？

AWS Lambda 是最知名的 serverless 提供商，不过 Google 最近也推出了 [Google Cloud Functions][20]。这两个 FaaS 解决方案使你可以在无须管理服务器的情况下运行代码，你的代码存储在别人为你管理的服务器集群上，并且仅在触发事件调用它时运行。AWS Lambda 目前支持 JavaScript、Python 和 Java，还可以启动 Go、Ruby 和 bash 进程。 Google Cloud Functions 只支持 JavaScript，但很可能不久将支持 Java 和 Python。许多物联网设备已经使用 serverless 方案，随着 Go 越来越多地被创业公司采用，serverless 似乎是一个可能的增长点，所以我在关注这些 serverless 解决方案中 Go 的开发情况。

已经有[几个框架][25]可以支持 AWS Lambdas：

* [λ Gordon][5] - 使用 CloudFormation 创建、连接及部署 AWS Lambdas
* [Apex][6] - 构建、部署及管理 AWS Lambda 函数
* [Sparta][7] - AWS Lambda 微服务的 Go 框架

还有一个 AWS Lambda 替代品支持 Go：

* [Iron.io][8]：建立在 Docker 和 Go 之上；语言未知；支持 Golang、Python、Ruby、PHP 和 .NET

*有关 serverless 架构的更多信息，请观看 Mike Roberts 在旧金山 O'Reilly 软件架构会议上的演讲主题：[_serverless介绍_][22]。*

### 数据科学中的 Go

我在本文开头暗示了这一点：也许令人惊讶的是很多人都在使用 Go 进行数据科学和机器学习。关于它是否适合还有一些争论，但基于像 [Gopher 学院之 2016 年终][23]那样的年度文章中，你会注意到 30 篇文章中至少有 4 篇是关于机器学习或分布式数据处理，它们正在像我们走来。

我之前关于 Go 的易部署性的观点可能是数据科学家使用 Go 的一个关键原因：他们可以更轻松地在易读而可用于生产环境的应用程序中向他人展示数据模型。与此相结合的是 Go 的广泛使用（正如我前面提到的，它正变得越来越流行！），而且有数据专家创建“可用并且与其它程序配合”的程序。任何使用 Go 构建的应用数据科学家会在公司其他部分使用相同的语言，或者至少它非常适合现代架构。

*更多关于 Go 的数据科学，Daniel Whitenack 写了一个很好的概述，解释了如何使用它： [Data Science Gophers][24]。*

--------------------------------------------------------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/1*MFGykrfk6_HjkJzePBtaMw.png)

O'Reilly Media 的监督编辑，与编辑团队合作，涵盖各种各样的编程主题。

--------------------------------------------------------------------------------

via: https://medium.com/@sconant/5-things-to-watch-in-go-programming-in-2017-39cd7a7e58e3#.8t4to5jr1

作者：[Susan Conant][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@sconant?source=footer_card
[1]:https://golang.org/doc/go1.8#h2push
[2]:https://golang.org/doc/go1.8#http_shutdown
[3]:https://golang.org/doc/go1.8#plugin
[4]:https://golang.org/doc/go1.8#gopath
[5]:https://github.com/jorgebastida/gordon
[6]:https://github.com/apex/apex
[7]:http://gosparta.io/
[8]:https://www.iron.io/
[9]:https://github.com/golang/go/wiki/GoUsers
[10]:https://twitter.com/SuConant
[11]:https://golang.org/doc/go1.8
[12]:https://www.safaribooksonline.com/live-training/courses/go-beyond-the-basics/0636920065357/
[13]:https://www.oreilly.com/people/1ea0c-daniel-whitenack
[14]:https://devfest.gdg.org.ru/en/
[15]:https://medium.com/@rakyll/go-1-5-cross-compilation-488092ba44ec#.7s7sxmc4h
[16]:https://golang.org/doc/go1.8#compiler
[17]:http://shop.oreilly.com/category/learning-path/go-fundamentals.do
[18]:https://github.com/go-interpreter
[19]:http://shop.oreilly.com/product/0636920047513.do
[20]:https://cloud.google.com/functions/docs/
[21]:https://github.com/SerifAndSemaphore/go-serverless-list
[22]:https://www.safaribooksonline.com/library/view/oreilly-software-architecture/9781491976142/video288473.html?utm_source=oreilly&utm_medium=newsite&utm_campaign=5-things-to-watch-in-go-programming-body-text-cta
[23]:https://blog.gopheracademy.com/series/advent-2016/
[24]:https://www.oreilly.com/ideas/data-science-gophers
[25]:https://github.com/SerifAndSemaphore/go-serverless-list
