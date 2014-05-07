Atom已开源
=======================

今天，我们兴奋地宣布，我们在[MIT开源许可证][1]下开源Atom。我们看到Atom作为一个完美的补充对GitHub上通过共同努力构建更好的软件的首要任务。Atom是个长期的投入，GitHub将使用专门的团队继续支持其发展。但是我们也知道我们不能为Atom实现我们的愿景。在过去的30年里Emacs和Vim已经证明，如果你想建立一个围绕在文本编辑器的活跃的持续的社区，必须开源。

## Atom包含了什么？

Atom的许多功能是通过包来提供的，每个Atom包从我们发布beta版就已经开源。今天，我们会开源Atom其余部分，包括了核心应用程序，Atom包管理器，基于Chromium的桌面应用程序框架和Atom Shell。

### Atom核心

[Atom核心][2]包含不是通过包提供的部分应用程序。包括构建系统，Atom国际化环境，工作区和窗口，以及文本编辑组建。随着时间的推移，我们从Atom库提取功能可供独立使用，并且我们期望这个过程持续下去。

### Atom包管理器

Atom包管理器，[`apm`][3], 是个客户端库和命令行多功能程序，可促进发布和安装Atom包。 `apm`目前是由`atom.io`提供动力，但是我们计划标准化后端API，如此你就能管理自己的注册簿。

### Atom Shell

最后，我们很兴奋[Atom Shell][4]开源。超过2.5年的开发，Atom已成为一个寄居蟹，在Cocoa `WebView`中开始它的生命，然后移居到[Chromium嵌入式框架][5], 最终安家在Atom Shell中。我们尝试短暂地使用[Node-Webkit][6]，但是我们决定采用@zcbenz构建的框架。

我们采取在整洁的环境中整合Chromium和Node，维护的方式，包括在Node中发起增加[multi-context支持][7]。我们也建立了[brightray][8]和[libchromiumcontent][9]，使其更易嵌入Chromium到本地应用程序作为共享库。

## 将来！

在大量Atom 1.0版本准备发布之前。在接下来几个月，我们将集中改善性能，在Linux和Windows上发放测试，以及使API趋于稳定。我们认为开源会帮助我们更快达到目标，更重要的是，源代码将给你透明度和控制权，你能从你的工具中告诉我们你想要的。

在迄今为止的Atom beta版本中我们感谢每个参与进来的开发者。你的反馈，包和请求（PR）是无价的。如果我们不打算在我们的余生使用它，我们是不会构建一个文本编辑器的，我们很高兴把这关键一步变为现实。

--------------------------------------------------------------------------------

via: http://blog.atom.io/2014/05/06/atom-is-now-open-source.html

译者：[Vito](https://github.com/vito-L) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://choosealicense.com/licenses/mit/
[2]:https://github.com/atom/atom
[3]:https://github.com/atom/apm
[4]:https://github.com/atom/atom-shell
[5]:https://code.google.com/p/chromiumembedded/
[6]:https://github.com/rogerwang/node-webkit
[7]:http://strongloop.com/strongblog/whats-new-node-js-v0-12-multiple-context-execution/
[8]:https://github.com/brightray/brightray
[9]:https://github.com/brightray/libchromiumcontent
