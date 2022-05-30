[#]: subject: "I Tested The New Maui Shell On My Linux Phone. Here’s What I Found!"
[#]: via: "https://news.itsfoss.com/tested-maui-shell/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14331-1.html"

在 Linux 手机上测试了新的 Maui Shell 后我发现……
======

> 我在 PinePhone 上测试了 Maui Shell，结果有好有坏。如果你想冒险尝鲜一下，可以按照这个说明进行试验！

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/maui-shell.png?w=1200&ssl=1)

就在一个多月前，我们写了 [Maui Shell 初窥][1]。它是由 Nitrux Linux 团队开发的，我对它流畅的视觉效果，特别是它的融合功能印象深刻。

同时，我结束了 [我一年的 PinePhone 日用实验][2]，这意味着它可以再次自由地进行实验。结果，我很快就自己安装了 Maui Shell，花了不少时间来测试它。

下面是我的发现！

### 关于 Maui Shell 开发状态的简短说明

在我们开始之前，我想指出，Maui Shell 仍处于早期开发阶段。因此，我一般不会提到我注意到的 bug，而是将重点放在它的更基本的方面。

不过，对于更大的、更耗时的问题例外，所以请记住这一点。

说完了这些，让我们开始测试吧！

### 手机上的 Maui Shell

![][3]

安装完之后，我就看到了 Maui Shell 的（现在熟悉的）桌面上。随即，非常明显的是，它的缩放比例完全错误，这使得它很难使用。

幸运的是，Maui 项目的 Telegram 群组的人提供了极大帮助，我没用了一个小时就成功地修复了缩放比例（感谢 @wachidadinugroho）。

现在好了，我开始测试。

#### 其性能堪比糖浆流动

如果你读过我的 PinePhone 点评，你可能记得把它的性能比作糖蜜滴落的速度。不幸的是，Maui Shell 将这一点提升到了一个全新的高度。即使是最基本的互动，如打开快速控制菜单，也要花上五秒钟的时间！

不幸的是，我的水平还不足以判断这种缓慢的原因，但它很有可能是由软件渲染造成的。如果你不清楚，“软件渲染”是指图形不在 GPU 上渲染，而是在效率和优化程度都更低的 CPU 上（利用软件来）渲染。

我考虑的另一个可能的罪魁祸首是糟糕的优化（毕竟它还处在早期阶段）。如果是这样的话，那么在未来的几个月里，极有可能在为 Maui Shell 的第一个稳定版本做准备的过程中修复这个问题。

然而，正如我之前所说的，对我的早期看法要多加注意。

#### 有望实现的用户体验

![][4]

与几乎所有的移动 UI 一样，Maui Shell 在触摸屏上使用起来简单而直观。然而，它也结合了许多桌面元素，这对提高用户体验有很大的作用。

例如，从屏幕顶部向下滑动会出现一个快速设置菜单，类似于在安卓和 iOS 上发现的那些。

然而，可以单独点击顶部通知栏的不同部分，会只显示相关的设置，类似于许多桌面环境面板和任务栏上的各种小程序。

现在，让我们前往 **窗口管理**。

对于窗口管理，Maui Shell 团队显然从 GNOME 和 iOS 中获得了一些灵感，从屏幕底部向上滑动会显示一个类似 GNOME 的所有运行中的应用程序的概览。我发现这非常直观和简单，老实说，我很惊讶以前没有这样操作过！

最后，托盘也是 Maui Shell 在手机上的一个重要方面。它在默认情况下自动隐藏，可以通过从屏幕底部向上轻扫来访问。从这里，它显示了所有正在运行的应用程序的图标，以及一个打开应用程序启动器的按钮。

说到应用启动器，它与 iOS 14 及更高版本中的应用库非常相似。每个应用都被分类，只需轻点几下就能轻松找到并启动。

总的来说，其实用性有点独特，而且值得探究。而且，这种特性也延伸到了应用程序，它们是用 Mauikit 和 Kirigami 制作的。

我认为 Maui Shell 团队把基本的东西做得很完美。

#### 应用程序超棒

![][5]

任何用 Mauikit 构建的东西都能与 Maui Shell 完美整合。到目前为止，最大的 Mauikit 应用程序集来自 Maui Shell 的开发方 Maui 项目。其中一些包括：

  * Index
  * Nota
  * Station
  * VVave
  * Pix
  * Clip
  * Buho
  * Shelf
  * Communicator

所有这些应用都能在移动和桌面设备上完美运行，并将桌面级应用带到手机上。我对 [Index][6] 特别满意，它是一个有趣而实用的手机文件管理器。

![Maui Index app][7]

除了 Mauikit 应用外，Kirigami 应用也很好用。因此，在桌面和移动设备上都有一个非常适合 Maui Shell 的庞大的应用程序库。

### 其他观点

除了这些观察之外，还有一些小问题我想提一下：

  * 不幸的是，现在似乎还没有虚拟键盘。我通过使用 USB-C 连接的键盘来规避这个问题，但这并不意味着不能把它作为手机使用。
  * 我还发现了几个缩放的问题，我无法解决这些问题。这些问题包括应用程序的缩放比例远远超过 Maui Shell 本身，以及根本没有缩放比例。这也许是由于我的错误造成的，但我觉得不能指望一般的用户能够钻研晦涩的 Qt 专用环境变量。

### 自己测试 Maui Shell

如果所有这些问题都不影响你，那么你可以使用下面的说明在 PinePhone 上测试 Maui Shell。需要注意的是，这些都是针对 PinePhone 的，但也可以根据其他需要进行修改：

  * 下载 [Arch Linux ARM][8] 并刷入到 SD 卡上
  * 用 SD 卡启动，并连接一个外部键盘
  * 使用凭证 `alarm`/`123456` 登录
  * 现在使用 `nmtui` 连接到 Wi-Fi，并使用 `sudo pacman -Syu` 更新软件包列表
  * 运行以下命令（这些命令将需要很长的时间来运行）：

    ```
    sudo pacman -S base-devel
    git clone https://aur.archlinux.org/packages/maui-shell-git
    git clone https://aur.archlinux.org/packages/mauikit-git
    cd mauikit-git
    makepkg -Asi
    cd ..
    cd maui-shell-git
    makepkg -Asi
    ```

  * 使用 [nano][9] 创建一个启动脚本：

    ```
    cd
    nano start.sh
    ```

    输入如下内容：
    
    ```

    #!/bin/sh

    # in case it's not detected
    # or you wish to override
    #
    # export QT_QPA_EGLFS_PHYSICAL_WIDTH=480
    # export QT_QPA_EGLFS_PHYSICAL_HEIGHT=270

    export QT_QPA_PLATFORM=eglfs
    export QT_AUTO_SCREEN_SCALE_FACTOR=0
    export QT_SCALE_FACTOR=2
    cask -r -plugin libinput
    ```

  * 使脚本可执行：`chmod +x start.sh`。

现在，可以用 `./start.sh` 启动 Maui Shell 了。

就这样！

你对 Maui Shell 有什么看法？你认为它的融合功能有用吗？请在下面的评论中告诉我们！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/tested-maui-shell/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-14136-1.html
[2]: https://linux.cn/article-14235-1.html
[3]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/maui-shell-phone.jpg?resize=1568%2C645&ssl=1
[4]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/maui-shell-phone-edited.jpg?w=445&ssl=1
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/Maui-Apps-edited.png?w=902&ssl=1
[6]: https://mauikit.org/apps/index/
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/maui-index-app.png?w=1200&ssl=1
[8]: https://github.com/dreemurrs-embedded/Pine64-Arch/releases
[9]: https://news.itsfoss.com/gnu-nano-6-0-released/
