[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11359-1.html)
[#]: subject: (How to Change Themes in Linux Mint)
[#]: via: (https://itsfoss.com/install-themes-linux-mint/)
[#]: author: (It's FOSS Community https://itsfoss.com/author/itsfoss/)

如何在 Linux Mint 中更换主题
======

![](https://img.linux.net.cn/data/attachment/album/201909/19/100317ixxp3y1l7lljl47a.jpg)

一直以来，使用 Cinnamon 桌面环境的 Linux Mint 都是一种卓越的体验。这也是[为何我喜爱 Linux Mint][1]的主要原因之一。

自从 Mint 的开发团队[开始更为严肃的对待设计][2], “桌面主题” 应用便成为了更换新主题、图标、按钮样式、窗口边框以及鼠标指针的重要方式，当然你也可以直接通过它安装新的主题。感兴趣么？让我们开始吧。

### 如何在 Linux Mint 中更换主题

在菜单中搜索主题并打开主题应用。

![Theme Applet provides an easy way of installing and changing themes][3]

在应用中有一个“添加/删除”按钮，非常简单吧。点击它，我们可以看到按流行程度排序的 Cinnamon Spices（Cinnamon 的官方插件库）的主题。

![Installing new themes in Linux Mint Cinnamon][4]

要安装主题，你所要做的就是点击你喜欢的主题，然后等待它下载。之后，主题将在应用第一页的“Desktop”选项中显示可用。只需双击已安装的主题之一就可以开始使用它。

![Changing themes in Linux Mint Cinnamon][5]

下面是默认的 Linux Mint 外观：

![Linux Mint Default Theme][6]

这是在我更换主题之后：

![Linux Mint with Carta Theme][7]

所有的主题都可以在 Cinnamon Spices 网站上获得更多的信息和更大的截图，这样你就可以更好地了解你的系统的外观。

- [浏览 Cinnamon 主题][8]

### 在 Linux Mint 中安装第三方主题

> “我在另一个网站上看到了这个优异的主题，但 Cinnamon Spices 网站上没有……”

Cinnamon Spices 集成了许多优秀的主题，但你仍然会发现，你看到的主题并没有被 Cinnamon Spices 官方网站收录。

这时你可能会想：如果有别的办法就好了，对么？你可能会认为有（我的意思是……当然啦）。首先，我们可以在其他网站上找到一些很酷的主题。

我推荐你去 Cinnamon Look 浏览一下那儿的主题。如果你喜欢什么，就下载吧。

- [在 Cinnamon Look 中获取更多主题][9]

下载了首选主题之后，你现在将得到一个压缩文件，其中包含安装所需的所有内容。提取它并保存到 `~/.themes`。迷糊么? `~` 代表了你的家目录的对应路径：`/home/{YOURUSER}/.themes`。

然后跳转到你的家目录。按 `Ctrl+H` 来[显示 Linux 中的隐藏文件][11]。如果没有看到 `.themes` 文件夹，创建一个新文件夹并命名为 `.themes`。记住，文件夹名称开头的点很重要。

将提取的主题文件夹从下载目录复制到你的家目录中的 `.themes` 文件夹中。

最后，在上面提到的应用中查找已安装的主题。

> 注记
> 
> 请记住，主题必须是 Cinnamon 相对应的，即使它是一个从 GNOME 复刻的系统也不行，并不是所有的 GNOME 主题都适用于 Cinnamon。

改变主题是 Cinnamon 定制工作的一部分。你还可以[通过更改图标来更改 Linux Mint 的外观][12]。

我希望你现在已经知道如何在 Linux Mint 中更改主题了。快去选取你喜欢的主题吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-themes-linux-mint/

作者：[It's FOSS][a]
选题：[lujun9972][b]
译者：[qfzy1233](https://github.com/qfzy1233)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tiny-features-linux-mint-cinnamon/
[2]: https://itsfoss.com/linux-mint-new-design/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/install-theme-linux-mint-1.jpg?resize=800%2C625&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/install-theme-linux-mint-2.jpg?resize=800%2C625&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/install-theme-linux-mint-3.jpg?resize=800%2C450&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux-mint-default-theme.jpg?resize=800%2C450&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux-mint-carta-theme.jpg?resize=800%2C450&ssl=1
[8]: https://cinnamon-spices.linuxmint.com/themes
[9]: https://www.cinnamon-look.org/
[10]: https://itsfoss.com/failed-to-start-session-ubuntu-14-04/
[11]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[12]: https://itsfoss.com/install-icon-linux-mint/
