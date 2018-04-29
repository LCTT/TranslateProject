假装很忙的三个命令行工具
======

> 有时候你很忙。而有时候你只是需要看起来很忙，就像电影中的黑客一样。有一些开源工具就是干这个的。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)

如果在你在消磨时光时看过谍战片、动作片或犯罪片，那么你就会清晰地在脑海中勾勒出黑客的电脑屏幕的样子。就像是在《黑客帝国》电影中，[代码雨][1] 一样的十六进制数字流，又或是一排排快速移动的代码。

也许电影中出现一幅世界地图，其中布满了闪烁的光点和一些快速更新的图表。不可或缺的，也可能有 3D 旋转的几何形状。甚至，这一切都会显示在一些完全不符合人类习惯的数量荒谬的显示屏上。 在《剑鱼行动》电影中黑客就使用了七个显示屏。

当然，我们这些从事计算机行业的人一下子就明白这完全是胡说八道。虽然在我们中，许多人都有双显示器（或更多），但一个闪烁的数据仪表盘、刷新的数据通常和专注工作是相互矛盾的。编写代码、项目管理和系统管理与日常工作不同。我们遇到的大多数情况，为了解决问题，都需要大量的思考，与客户沟通所得到一些研究和组织的资料，然后才是少许的 [敲代码][7]。

然而，这与我们想追求电影中的效果并不矛盾，也许，我们只是想要看起来“忙于工作”而已。

**注：当然，我仅仅是在此胡诌。**如果您公司实际上是根据您繁忙程度来评估您的工作时，无论您是蓝领还是白领，都需要亟待解决这样的工作文化。假装工作很忙是一种有毒的文化，对公司和员工都有害无益。

这就是说，让我们找些乐子，用一些老式的、毫无意义的数据和代码片段填充我们的屏幕。（当然，数据或许有意义，但不是在这种没有上下文的环境中。）当然有一些用于此用途的有趣的图形界面程序，如 [hackertyper.net][8] 或是 [GEEKtyper.com][9] 网站（LCTT 译注：是在线假装黑客操作的网站），为什么不使用标准的 Linux 终端程序呢？对于更老派的外观，可以考虑使用 [酷炫复古终端][10]，这听起来确实如此：一个酷炫的复古终端程序。我将在下面的屏幕截图中使用酷炫复古终端，因为它看起来的确很酷。

### Genact

我们来看下第一个工具——Genact。Genact 的原理很简单，就是慢慢地无尽循环播放您选择的一个序列，让您的代码在您外出休息时“编译”。由您来决定播放顺序，但是其中默认包含数字货币挖矿模拟器、Composer PHP 依赖关系管理工具、内核编译器、下载器、内存转储等工具。其中我最喜欢的是其中类似《模拟城市》加载显示。所以只要没有人仔细检查，你可以花一整个下午等待您的电脑完成进度条。

Genact [发布了][11] 支持 Linux、OS X 和 Windows 的版本。并且其 Rust [源代码][12] 在 GitHub 上开源（遵循 [MIT 许可证][13]）。

![](https://opensource.com/sites/default/files/uploads/genact.gif)

### Hollywood

Hollywood 采取更直接的方法。它本质上是在终端中创建一个随机的数量和配置的分屏，并启动那些看起来很繁忙的应用程序，如 htop、目录树、源代码文件等，并每隔几秒将其切换。它被组织成一个 shell 脚本，所以可以非常容易地根据需求进行修改。

Hollywood的 [源代码][14] 在 GitHub 上开源（遵循 [Apache 2.0 许可证][15]）。

![](https://opensource.com/sites/default/files/uploads/hollywood.gif)

### Blessed-contrib

Blessed-contrib 是我个人最喜欢的应用，实际上并不是为了这种表演而专门设计的应用。相反地，它是一个基于 Node.js 的终端仪表盘的构建库的演示文件。与其他两个不同，实际上我已经在工作中使用 Blessed-contrib 的库，而不是用于假装忙于工作。因为它是一个相当有用的库，并且可以使用一组在命令行显示信息的小部件。与此同时填充虚拟数据也很容易，所以可以很容易实现你在计算机上模拟《战争游戏》的想法。

Blessed-contrib 的[源代码][16]在 GitHub 上（遵循 [MIT 许可证][17]）。

![](https://opensource.com/sites/default/files/uploads/blessed.gif)

当然，尽管这些工具很容易使用，但也有很多其他的方式使你的屏幕丰富。在你看到电影中最常用的工具之一就是Nmap，这是一个开源的网络安全扫描工具。实际上，它被广泛用作展示好莱坞电影中，黑客电脑屏幕上的工具。因此 Nmap 的开发者创建了一个 [页面][18]，列出了它出现在其中的一些电影，从《黑客帝国 2：重装上阵》到《谍影重重3》、《龙纹身的女孩》，甚至《虎胆龙威 4》。

当然，您可以创建自己的组合，使用终端多路复用器（如 `screen` 或 `tmux`）启动您希望使用的任何数据切分程序。

那么，您是如何使用您的屏幕的呢？

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/command-line-tools-productivity

作者：[Jason Baker][a]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:http://tvtropes.org/pmwiki/pmwiki.php/Main/MatrixRainingCode
[2]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[7]:http://tvtropes.org/pmwiki/pmwiki.php/Main/RapidFireTyping
[8]:https://hackertyper.net/
[9]:http://geektyper.com
[10]:https://github.com/Swordfish90/cool-retro-term
[11]:https://github.com/svenstaro/genact/releases
[12]:https://github.com/svenstaro/genact
[13]:https://github.com/svenstaro/genact/blob/master/LICENSE
[14]:https://github.com/dustinkirkland/hollywood
[15]:http://www.apache.org/licenses/LICENSE-2.0
[16]:https://github.com/yaronn/blessed-contrib
[17]:http://opensource.org/licenses/MIT
[18]:https://nmap.org/movies/
