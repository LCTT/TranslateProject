在 Ubuntu 里如何下载、安装和配置 Plank Dock
=============================================================================
一个众所周知的事实就是，Linux 是一个用户可以高度自定义的系统，有很多选项可以选择 —— 作为操作系统，有各种各样的发行版，而对于单个发行版来说，又有很多桌面环境可以选择。与其他操作系统的用户一样，Linux 用户也有不同的口味和喜好，特别是对于桌面来说。

一些用户并非很在意他们的桌面，而其他一些则非常关心，要确保他们的桌面看起来很酷，很有吸引力，对于这种情况，有很多不错的应用可以派上用场。有一个应用可以给你的桌面带来活力 —— 特别是当你常用一个全局菜单的时候 —— 这就是 dock 。Linux 上有很多 dock 应用可选用；如果你希望是一个最简洁的，那么就选择 [Plank][1] 吧，文章接下来就要讨论这个应用。

**注意**：接下提到的例子和命令都已在 Ubuntu（版本 14.10）和 Plank（版本 0.9.1.1383）上测试通过。

### Plank ###

官方的文档描述 Plank 是“这个星球上最简洁的 dock”。该项目的目的就是仅提供一个 dock 需要的功能，尽管这是很基础的一个库，却可以被扩展，创造其他的含更多高级功能的 dock 程序。

这里值得一提的就是，在 elementary OS 里，Plank 是预装的。并且 Plank 是 Docky 的基础，Docky 也是一个非常流行的 dock 应用，在功能上与 Mac OS X 的 Dock 非常相似。

### 下载和安装 ###

通过在终端里执行下面的命令，可以下载并安装 Plank：

    sudo add-apt-repository ppa:docky-core/stable
    sudo apt-get update
    sudo apt-get install plank

安装成功后，你就可以在 Unity Dash（见下面图片）里通过输入 Plank 来打开该应用，或者从应用菜单里面打开，如果你没有使用 Unity 环境的话。

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-unity-dash.png)

### 特性 ###

当 Plank 启用后，你会看见它停靠在你桌面的底部中间位置。

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-enabled-new.jpg)

正如上面图片显示的那样，dock 包含许多带橙色标示的应用图标，这表明这些应用正处于运行状态。无需说，你可以点击一个图标来打开那个应用。同时，右击一个应用图标会给出更多的选项，你可能会感兴趣。举个例子，看下面的屏幕快照：

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-right-click-icons-new.jpg)

为了获得配置的选项，你需要右击一下 Plank 的图标（左数第一个），然后点击 Preferences 选项。这就会出现如下的窗口。

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-preferences.png)

如你所见，Preferences 窗口包含两个标签：Apperance 和 Behavior，前者是默认选中的。Appearance 标签栏包含 Plank 主题相关的设置，dock 的位置，对齐，还有图标相关的，而 Behavior 标签栏包含 dock 本身相关的设定。

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-behavior-settings.png)

举个例子，我在 Appearance 里改变 dock 的位置为右侧，在 Behavior 里锁定图标（这表示右击选项中不再有 “Keep in Dock”）。

![](https://www.maketecheasier.com/assets/uploads/2015/09/plank-right-lock-new.jpg)

如你所见的上面屏幕快照一样，改变生效了。类似地，根据你个人需求，改变任何可用的设定。

### 结论 ###

如我开始所说的那样，使用 dock 不是强制的。尽管如此，使用一个会让事情变得方便，特别是你习惯了 Mac，而最近由于一些原因切换到了 Linux 系统。就其本身而言，Plank 不仅提供简洁性，还有可信任和稳定性 —— 该项目一直被很好地维护着。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/download-install-configure-plank-dock-ubuntu/

作者：[Himanshu Arora][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://launchpad.net/plank
