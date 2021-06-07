[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10484-1.html)
[#]: subject: (Get started with WTF, a dashboard for the terminal)
[#]: via: (https://opensource.com/article/19/1/wtf-information-dashboard)
[#]: author: (Kevein Sonney https://opensource.com/users/ksonney)

开始使用 WTF 吧，一款终端仪表板
======

> 使用 WTF 将关键信息置于视野之中，这个系列中第六个开源工具可使你在 2019 年更有工作效率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源项目来帮助你在 2019 年更有效率。

### WTF

曾几何时，我在一家使用[彭博终端][1]的公司做咨询。我的反应是，“哇，在一个屏幕上显示的信息太多了。” 然而，现在，当我正在工作并且打开多个网页、仪表板和控制台应用程序以试图跟踪事物时，我似乎无法在屏幕上获得足够的信息。

虽然 [tmux][2] 和 [Screen][3] 可以进行分屏和打开多个窗口，但它们很难设置，并且它们的键绑定可能需要一段时间才能学会（还经常与其他应用程序冲突）。

[WTF][4] 是一个简单的、易于配置的终端信息仪表板。它是用 [Go][5] 语言编写的，使用 YAML 配置文件，可以从几个不同的源提取数据。所有的数据源都包含在[模块][6]中，包括天气、问题跟踪器、日期和时间、Google 表格以及更多内容。有些窗格是交互式的，有些窗格只是使用最新的信息进行更新。

安装它就像下载适用于您的操作系统的最新版本并运行命令一样简单。因为它是用 Go 编写的，所以它的移植性很好，应该可以在任何可以编译它的地方运行（尽管开发人员目前只为 Linux 和 MacOS 做了构建）。

![](https://opensource.com/sites/default/files/uploads/wtf-1.png)

当您第一次运行 WTF 时，您将看到如上图的默认屏幕。

![](https://opensource.com/sites/default/files/uploads/wtf-2.png)

其默认配置文件在 `~/.wtf/config.yml`，您可以编辑该文件以满足您的需要。网格布局的配置在文件的顶部。

```
grid:
  columns: [45, 45]
  rows: [7, 7, 7, 4]
```

网格设置中的数字表示每个块的字符尺寸。默认配置是两列，每列 40 个字符，两行 13 个字符高，一行 4 个字符高。在上面的代码中，我使列更宽（`45,45`），行更小，并添加了第四行，所以我可以放更多的小部件。

![](https://opensource.com/sites/default/files/uploads/wtf-3.png)

我喜欢在仪表板上看到当天的天气。有两个天气模块可供选择：[Weather][7]，它只显示文本信息；[Pretty Weather][8] 则色彩丰富，并使用基于文本的图形显示。

```
prettyweather:
  enabled: true
  position:
    top: 0
    left: 1
    height: 2
    width: 1
```

此代码创建了一个窗格，高为两个块（`height: 2`），宽为一个块（`width: 1`），位于顶行（`top: 0`）的第二列（`left: 1`）上，包含 Pretty Weather 模块.

一些模块是交互式的，如 Jira、GitHub 和 Todo，您可以在其中滚动、更新和保存信息。您可以使用 Tab 键在交互式窗格之间移动。`\` 键会显示活动窗格的帮助屏幕，以便您可以查看可以执行的操作以及操作方式。Todo 模块允许您添加、编辑和删除待办事项，并在完成后勾掉它们。

![](https://opensource.com/sites/default/files/uploads/wtf-4.png)

还有一些模块可以执行命令并显示输出、监视文本文件，以及监视构建和集成服务器的输出。所有文档都做得很好。

对于需要在不同来源的一个屏幕上查看大量数据的人来说，WTF 是一个有价值的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/wtf-information-dashboard

作者：[Kevein Sonney][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Bloomberg_Terminal
[2]: https://github.com/tmux/tmux
[3]: https://www.gnu.org/software/screen/
[4]: https://wtfutil.com/
[5]: https://golang.org/
[6]: https://wtfutil.com/posts/modules/
[7]: https://wtfutil.com/posts/modules/weather/
[8]: https://wtfutil.com/posts/modules/prettyweather/
