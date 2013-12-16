专访Ubuntu Tweak的作者周鼎
================================================================================

[Ubuntu tweak][1] 是一款知名度很高的应用程序软件，Ubuntu 用户可以用它来调整系统的性能、功能等各个细节。项目的创始人，周鼎又名 Tualatrix Chou ，正与我们分享 Ubuntu Tweak 的特性、使用感觉以及它跟 Canonical 的关系，并且勾勒了项目的未来计划蓝图。享受吧！

**你什么时候开始使用 Linux 的，并基于什么使你决定开发 Ubuntu tweak ？**

我开始使用 Linux 是在2006年底，那时刚开始我的大学生活。当时我正在学 C 编程语言，一个朋友建议说要学习编程的话 Linux 是最好的平台环境，所以我就开始了我的 Linux 生涯，是从 Fedora Core 6 开始的。但用了仅仅只有一周的时间，我就换成 Ubuntu 6.10，因为Ubuntu在中国有更好的社区，也有更好更快的源库/镜像。我立马就爱上了 Ubuntu，就一周时间，就从 Windows 环境完全切换到 Ubuntu 环境。

在苦乐参半的半年使用时间后，我意识到 Ubuntu 对中国用户来说不是太友好，因为全新安装系统后，用户必须得自己配置字体、输入法以及其它很多很多设置。所以，我决定开发出一款应用程序来帮助新手，让他们很简单的就可以对系统做相应配置。

因此在2007年7月，我就开始开发 Ubuntu Tweak，刚开始的时候，仅仅提供了汉语版本的，但很快就考虑了 Ubuntu Tweak 的国际版本，并且在2007年9月份就发布了首个国际版本。

**Ubuntu tweak 已经是非常成功的项目了。很多 Ubuntu 用户用它来调整系统的性能、功能等各个细节。能给我们谈论下 Ubuntu Tweak 能做些什么吗？**

![](http://180016988.r.cdn77.net/wp-content/uploads/2012/03/tualatrix1.jpg)

Ubuntu Tweak 可以用来切换桌面图标的显示方式、设置字体、启用/禁用多用户切换功能以及登陆的标识（logo）等等。

在最新的 Ubuntu Tweak 0.6版本中，你也可以调整你的 Unity 桌面以及关机功能。

你也能使用 Ubuntu Tweak 来清理系统的垃圾以释放空间和使系统保持干净。

**Canonical 在他们的默认发布源中不考虑加入 Ubuntu Tweak。这意味着什么？这对那些没有经验，但又想要使用你的应用程序来调整他们的系统的用户来说，存在某些风险吗？**

对的。因为在以前的 Ubuntu Tweak 发布版本中，为流行的 PPA 都提供了可用源，但我不能保证所有的 PPA 都是安全的，所以 Ubuntu Tweak 会有一些安全风险。

如你们所见，从0.6版本后 Ubuntu Tweak 就已经移除了源中心（Source Center）。但请不要混淆“Ubuntu默认包含”和“加入源仓库”这两个概念。Ubuntu Tweak 首先应该要被加入通用资源仓库，然后才能被 Ubuntu 默认包含。

从错误报告和用户反馈来看，Ubuntu Tweak 已经比老版本更加稳定及更易使用。

**你有收到来自 Canonical 和 Ubuntu 开发者的支持或有跟他们合作（不论什么）的事项吗，是哪些方面的？**

当然，我得到 Canonical 公司的一些帮助，他们试着帮我把 Ubuntu Tweak 放入源仓库。这工作现在仍然在进行。

也得到社区的很多热心帮助，他们帮我翻译、设计、测试、报告错误，甚至提交代码分支。

**开发 Ubuntu Tweak 的有多少人？**

如果你说的是“代码开发者”，就仅仅我一个，但我们有很多设计人员：logo 是M.Sharp设计的，Kevin Chou 帮助设计了 Ubuntu Tweak 的用户界面(UI)原型，就是0.6版本的样子。现在 Jeonkwan Chan 正在帮我重新美化用户界面，将会用在0.7版本上。任何人，只要愿意就可以加入到 Ubuntu Tweak 的开发中来:)

**在Ubuntu11.04版本中当 Unity 出现时，许多 Ubuntu 用户抱怨其可配置性不好，您对这个怎么看的？这个特殊的桌面环境能有些什么多适用性的配置能力呢？**

我喜欢桌面系统的可配置高适应性，这是 Linux 系统的优点，不是吗？

例如，我不喜欢 Unity Launcher 的自动隐藏功能，所以我设置让他不会隐藏。

事实上，Unity 是可配置的，仅仅是它缺少 CompizConfig 设置管理器，所以你不能把 Unity Launcher 放到桌面底部或右面，这对左撇子来说很不友好。哈哈，开玩笑的。

如大家所见，Ubuntu 12.04已经增加了隐藏/显示切换功能，Launcher 的大小在系统设置中也可以自定义设置。我认为 Unity 将会有更多的可配置功能。

**一般来说，你认为 Canonical 公司开发 Unity 桌面环境是正确的决策吗？他们与 Gnome 开发者之间有合作争议，这有些是不可避免的吗？**

是的，对于 Canonical 公司来说，我觉得他们的决策很正确。回顾三年前，当 Ubuntu 首次引入基于 GNOME Panel 的Indicator ，它的设计就要比原来直接的 GNOME Panel 小程序更优雅。但 Canonical 开发者和 GNOME 开发者之间合作有些问题，因为他们从来没有着眼于 GNOME。直到 GNOME 3 的面世，情况才有所好转，它的 GNOME Shell 已经从 GNOME Panel 移出来了，并且 GNOME Shell 的面板已经和上面提到的 Indicator 用的是同一套设计方式。如果他们之间共用相同的 API 的话，桌面Linux应该会更好用。

所以来自于公司、社区、GNOME 桌面等的不同的关于用户界面的见解，综合起来最终就形成了 Unity。

我认为这是好事。至少，到目前为至，比起 GNOME Shell 来说，我更喜欢 Unity。

**虽然你正在开发的是一款 Ubuntu 系统专用的程序，但我假设你为了使用更多的高级用户功能，会使用其它的发行版本。你会选择哪些发行版本呢？为什么？**

当然，我已经玩过 Fedora、Arch、 OpenSUSE，特别是 Gentoo，我已经整整使用了一年。它是我第二喜欢的 Linux 发行系统，因为它拥有一个最先进的包管理系统。

但现在我仅仅只使用 Ubuntu 的桌面版本和服务版，也使用 Mac OS X，很多的设计灵感就来自于它 :)

**Ubuntu Tweak 能被优化或做几个分支或者改变一点点，以便能在其它的 linux 发行版本比如 Fedora、OpenSue 或者 Debian 上使用吗？有做成统一的一个叫做“Linux Tweak”的应用程序，用户不管选择什么样的发布版本或桌面环境都可以用这种想法吗？不知道是否可行？**

可以的，要让 Ubuntu Tweak 在其它发行版本中运行非常容易。它是模块化的，很轻松的就可以改造(hack)。

2008年的时候，我就发布了一版 Fedora 的“Ubuntu Tweak for Fedora”，但最终我放弃维护这个版本了，因为我主要关注 Ubuntu 版本的，所以没有那么多精力。

**那 Ubuntu Tweak 的未来计划是什么？也许 Canonical 公司会内嵌进系统，然后把它做为发布版本默认的工具或者他们会基于他们自己的系统调整工具来使用它。您认为呢？您的下一步计划会是什么的呢？**

Ubuntu Tweak 的未来当然会一片光明。哈哈。

我已经开始实现把 Ubuntu Tweak 加入软件中心这个工作了。如果用户能从软件中心直接安装 Ubuntu Tweak，它会更容易。

现在我正在开发0.7版本的，它将更美观，并且与 Unity 桌面的集成度更好，也加入了一些很有用的新功能。我想使Ubuntu Tweak 在 Unity 桌面环境下尽可能的发挥作用。

跟随着 Ubuntu 12.04的发布，我也计划发布新的版本，希望大家喜欢 :)

还有一件事要透露下，我已经加入 Canonical 北京公司，负责处理 OEM 的事情。虽然 Ubuntu Tweak 仍是一个个人项目，我还没有参与进 Ubuntu 的开发任务，但有可能话我会试着加入开发团队 :)

**太伟大了！谢谢 Tualatrix。**

--------------------------------------------------------------------------------

via: http://www.unixmen.com/interview-with-ding-zhou-of-ubuntu-tweak/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[runningwater](https://github.com/runningwater) 校对：[wxy](https://github.com/wxy)

[1]:http://ubuntu-tweak.com/
