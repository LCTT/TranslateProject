[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12576-1.html)
[#]: subject: (Use this command-line tool to find security flaws in your code)
[#]: via: (https://opensource.com/article/20/8/static-code-security-analysis)
[#]: author: (Ari Noman https://opensource.com/users/arinoman)

使用命令行工具 Graudit 来查找你代码中的安全漏洞
======

> 凭借广泛的语言支持，Graudit 可以让你在开发过程中的审计你的代码安全。

![](https://img.linux.net.cn/data/attachment/album/202009/03/114037qhi2h282wghbp74n.jpg)

测试是软件开发生命周期（SDLC）的重要组成部分，它有几个阶段。今天，我想谈谈如何在代码中发现安全问题。

在开发软件的时候，你不能忽视安全问题。这就是为什么有一个术语叫 DevSecOps，它的基本职责是识别和解决应用中的安全漏洞。有一些用于检查 [OWASP 漏洞][2]的开源解决方案，它将通过创建源代码的威胁模型来得出结果。

处理安全问题有不同的方法，如静态应用安全测试（SAST）、动态应用安全测试（DAST）、交互式应用安全测试（IAST）、软件组成分析等。

静态应用安全测试在代码层面运行，通过发现编写好的代码中的错误来分析应用。这种方法不需要运行代码，所以叫静态分析。

我将重点介绍静态代码分析，并使用一个开源工具进行实际体验。

### 为什么要使用开源工具检查代码安全？

选择开源软件、工具和项目作为开发的一部分有很多理由。它不会花费任何金钱，因为你使用的是一个由志趣相投的开发者社区开发的工具，而他们希望帮助其他开发者。如果你有一个小团队或一个初创公司，找到开源软件来检查你的代码安全是很好的。这样可以让你不必单独雇佣一个 DevSecOps 团队，让你的成本降低。

好的开源工具总是考虑到灵活性，它们应该能够在任何环境中使用，覆盖尽可能多的情况。这让开发人员更容易将该软件与他们现有的系统连接起来。

但是有的时候，你可能需要一个功能，而这个功能在你选择的工具中是不可用的。那么你就可以选择复刻其代码，在其上开发自己的功能，并在你的系统中使用。

因为，大多数时候，开源软件是由社区驱动的，开发的速度往往是该工具的用户的加分项，因为他们会根据用户的反馈、问题或 bug 报告来迭代项目。

### 使用 Graudit 来确保你的代码安全

有各种开源的静态代码分析工具可供选择，但正如你所知道的，工具分析的是代码本身，这就是为什么没有通用的工具适用于所有的编程语言。但其中一些遵循 OWASP 指南，尽量覆盖更多的语言。

在这里，我们将使用 [Graudit][3]，它是一个简单的命令行工具，可以让我们找到代码库中的安全缺陷。它支持不同的语言，但有一个固定的签名集。

Graudit 使用的 `grep` 是 GNU 许可证下的工具，类似的静态代码分析工具还有 Rough Auditing Tool for Security（RATS）、Securitycompass Web Application Analysis Tool（SWAAT）、flawfinder 等。但 Graudit 的技术要求是最低的，并且非常灵活。不过，你可能还是有 Graudit 无法满足的要求。如果是这样，你可以看看这个[列表][4]的其他的选择。

我们可以将这个工具安装在特定的项目下，或者全局命名空间中，或者在特定的用户下，或者任何我们喜欢地方，它很灵活。我们先来克隆一下仓库。

```
$ git clone https://github.com/wireghoul/graudit
```

现在，我们需要创建一个 Graudit 的符号链接，以便我们可以将其作为一个命令使用。

```
$ cd ~/bin && mkdir graudit
$ ln --symbolic ~/graudit/graudit ~/bin/graudit
```

在 `.bashrc` （或者你使用的任何 shell 的配置文件）中添加一个别名。

```
#------ .bashrc ------

alias graudit="~/bin/graudit"
```

重新加载 shell：

```
$ source ~/.bashrc # 或
$ exex $SHELL
```

让我们通过运行这个来检查是否成功安装了这个工具。

```
$ graudit -h
```

如果你得到类似于这样的结果，那么就可以了。

![Graudit terminal screen showing help page][5]

*图 1 Graudit 帮助页面*

我正在使用我现有的一个项目来测试这个工具。要运行该工具，我们需要传递相应语言的数据库。你会在 signatures 文件夹下找到这些数据库。

```
$ graudit -d ~/gradit/signatures/js.db
```

我在现有项目中的两个 JavaScript 文件上运行了它，你可以看到它在控制台中抛出了易受攻击的代码。

![JavaScript file showing Graudit display of vulnerable code][6]

![JavaScript file showing Graudit display of vulnerable code][7]

你可以尝试在你的一个项目上运行这个，项目本身有一个长长的[数据库][8]列表，用于支持不同的语言。

### Graudit 的优点和缺点

Graudit 支持很多语言，这使其成为许多不同系统上的用户的理想选择。由于它的使用简单和语言支持广泛，它可以与其他免费或付费工具相媲美。最重要的是，它们正在开发中，社区也支持其他用户。

虽然这是一个方便的工具，但你可能会发现很难将某个特定的代码识别为“易受攻击”。也许开发者会在未来版本的工具中加入这个功能。但是，通过使用这样的工具来关注代码中的安全问题总是好的。

### 总结

在本文中，我只介绍了众多安全测试类型中的一种：静态应用安全测试。从静态代码分析开始很容易，但这只是一个开始。你可以在你的应用开发流水线中添加其他类型的应用安全测试，以丰富你的整体安全意识。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/static-code-security-analysis

作者：[Ari Noman][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/arinoman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_screen_display.jpg?itok=2HMTzqz0 (Code on a screen)
[2]: https://owasp.org/www-community/vulnerabilities/
[3]: https://github.com/wireghoul/graudit
[4]: https://project-awesome.org/mre/awesome-static-analysis
[5]: https://opensource.com/sites/default/files/uploads/graudit_1.png (Graudit terminal screen showing help page)
[6]: https://opensource.com/sites/default/files/uploads/graudit_2.png (JavaScript file showing Graudit display of vulnerable code)
[7]: https://opensource.com/sites/default/files/uploads/graudit_3.png (JavaScript file showing Graudit display of vulnerable code)
[8]: https://github.com/wireghoul/graudit#databases
