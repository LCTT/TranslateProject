Atom开源了！！！
=======================

今天，我们兴奋地宣布：在[MIT开源许可证][1]下，Atom开源了！我们看到，GitHub努力以构建更好的软件为首要任务，而Atom对此是一个完美的补充。Atom是个长期的投入，GitHub将继续由专门的团队支持其发展。但是我们也知道，我们对Atom的愿景不可能独自实现。在过去的30年里Emacs和Vim已经证明，如果你想建立一个活跃的持续的文本编辑器社区，必须开源！

## Atom包含了什么？

Atom的许多功能是通过包来提供的，从我们发布beta版开始所有Atom包就已经开源。今天，我们会开源Atom的剩余部分，包括核心应用程序、Atom包管理器，以及基于Chromium的桌面应用程序框架和Atom Shell。

### Atom核心

[Atom核心][2]包含了包以外的应用程序部分。包括构建系统、Atom国际化环境、工作区和窗口，以及文本编辑组件。随着时间的推移，我们从Atom中把一些功能提取出来放入库中以便能独立使用，我们期望这个过程能一直持续下去。

### Atom包管理器

Atom包管理器，[`apm`][3], 是个客户端库和命令行多功能程序，用来帮助发布和安装Atom包。 `apm`目前是由`atom.io`提供支持，但是我们计划将后端API标准化，如此你就能管理自己的注册簿（registy）了。

### Atom Shell

最后，同Atom一样，我们真的很兴奋[Atom Shell][4]也能够开源。超过2.5年的开发，Atom像个寄居蟹一样，它首先在Cocoa `WebView`中开始生命，然后移居到[Chromium嵌入式框架][5], 最终安家在Atom Shell中。我们短暂尝试了使用[Node-Webkit][6]，但是我们决定采用@zcbenz构建的框架。

我们采取在整洁、可维护的环境中整合Chromium和Node，包括在Node中发起增加[multi-context支持][7]。我们也建立了[brightray][8]和[libchromiumcontent][9]，使其更易嵌入Chromium到本地应用程序作为共享库。

## 关于未来！

在准备发布Atom 1.0版本之前仍然有大量的工作要做。在接下来几个月，我们将集中改善性能，在Linux和Windows上发放测试，以及使API趋于稳定。我们认为开源会帮助我们更快达到目标，更重要的是，源代码将给你透明度和控制权，你能从你的工具中告诉我们你想要的。

在迄今为止的Atom beta版本中我们感谢每个参与进来的开发者。你的反馈，包和推送请求（PR）是无价的。如果我们不是打算做个能够陪伴一生的编辑器的话，我们是不会创造它的，我们很高兴把这关键的一步变为现实！

--------------------------------------------------------------------------------

via: http://blog.atom.io/2014/05/06/atom-is-now-open-source.html

译者：[Vito](https://github.com/vito-L) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

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
