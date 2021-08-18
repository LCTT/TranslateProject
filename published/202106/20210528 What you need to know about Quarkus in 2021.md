[#]: subject: (What you need to know about Quarkus in 2021)
[#]: via: (https://opensource.com/article/21/5/quarkus)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13456-1.html)

在 2021 年你需要知道 Quarkus 些什么？
======

> Quarkus 受益于 20 多年的 Java 开发历史，使开发应用变得更快、更容易。

![](https://img.linux.net.cn/data/attachment/album/202106/04/221812ja1b5btxpgwapsap.jpg)

在云上发布服务部分是为了通过简单可靠的方式为用户和开发者提供对这些服务的便捷访问。与在线应用对接的最流行的方法之一是通过应用编程接口（API），这是一个花哨的术语，意味着你允许用户通过代码与你的应用进行互动。

API 的概念很重要，因为它可以帮助其他人在你的应用基础上进行开发。假设你设计了一个网站，当用户点击一个按钮时返回一个随机数字。通常情况下，这需要用户打开你的网站并点击一个按钮。网站可能是有用的，但只是在一定程度上。如果你包含一个 API，用户可以直接向你的服务器发送一个信号，要求一个随机数，或者他们可以自己编程，“调用”你的服务器来获取一个数字，而不需要点击或手动交互。开发者可以使用你的随机数作为游戏的数值，或作为密码生成器的一部分，或其他任何开发者需要随机数的地方（总是有的）。一个好的 API 可以解锁你的应用，让其他人使用你的代码结果，本质上，将你在网络上的工作转变为一个软件库。

### 什么是 Quarkus？

[Quarkus][2] 是一个原生 Kubernetes Java 栈，为无服务器应用交付而设计。与有 20 年历史的 Java 相比，[Quarkus][3] 相对年轻，但受益于这 20 年的发展，用该项目的话说，是 “超音速的亚原子 Java”。可能没有人知道这句话的确切含义，但你肯定可以通过一下午使用 Quarkus 来感受到它对你的开发生活的意义。

Quarkus 让你用一个有用的 API 开发应用，几乎不需要配置，也不用担心启动一个复杂的环境。你不需要学习关于云计算或边缘计算的所有知识，就可以学习并擅长使用 Quarkus。了解 Quarkus 可以使你的开发更快，它可以帮助你为现代计算机网络制作灵活的应用。

下面是我们最近的一些涉及 Quarkus 的文章。

### 开始使用 Quarkus

在 Saumya Singh 的《[如何创建你的第一个 Quarkus 应用][4]》中，你可以了解 Quarkus 和无服务器交付的好处，并在大约 10 分钟内创建了一个简单的演示应用。事实上，_10_ 分钟以内更准确，因为在 Maven 和 Quarkus 之间，几乎没有你想象中的那么多设置。它几乎感觉不到像 Java 一样的坏处，而感觉像 Java 一样好。

### 边缘开发

Linux 是创建物联网 （IoT） [边缘应用][5] 的一个流行平台。这有很多原因，包括安全性、编程语言和开发模型的广泛选择以及协议支持。不出所料，Quarkus 对物联网的处理非常好。Quarkus 的内存效率高，启动快，并且有快速的运行时，所以它不仅是物联网的可行解决方案，而且是理想的解决方案。你可以通过 Daniel Oh 的《[在 Linux 上使用开源的边缘开发入门][6]》来开始使用 Quarkus 和物联网。

### Quarkus 和 VS Code

当你处理代码时，一个集成开发环境（IDE）会有很大的不同。微软的开源 [VS Code][7]（或无品牌标志的 [VSCodium][8]）是一个伪装成 IDE 的流行文本编辑器（或者说是伪装成文本编辑器的 IDE？），它有很多扩展，可以使它成为几乎任何编程语言的专门环境。如果你正在使用或考虑使用 VS Code，那么请阅读 Daniel Oh 的《[Quarkus in VS Code][9]》使用指南，了解一些关于 Maven、Quarkus 和 VS Code 如何协同工作的专业技巧。

### 获得 Quarkus

使用 Quarkus 开发，可以像 Python 一样简单地设置环境，但它为你提供了强大的 Java 语言及其众多的库。它是进入云计算、[Knative][10] 和边缘计算的一个重要入口。获取 Quarkus 并开始编码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/quarkus

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://quarkus.io
[3]: https://developers.redhat.com/blog/2019/03/07/quarkus-next-generation-kubernetes-native-java-framework/
[4]: https://opensource.com/article/21/4/quarkus-tutorial
[5]: https://opensource.com/article/17/9/what-edge-computing
[6]: https://opensource.com/article/21/5/edge-quarkus-linux
[7]: https://github.com/microsoft/vscode
[8]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[9]: https://opensource.com/article/20/4/java-quarkus-vs-code
[10]: https://www.openshift.com/learn/topics/quarkus