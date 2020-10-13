[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12354-1.html)
[#]: subject: (Ubuntu Budgie 20.04 Review: Smooth, Polished & Plenty of Changes)
[#]: via: (https://itsfoss.com/ubuntu-budgie-20-04-review/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Ubuntu Budgie 20.04 LTS：平滑、精致和丰富的变化
======

正如我们向读者承诺的那样，我们将对 [Ubuntu 20.04 LTS 版本][1]的所有主要特色版进行评测。在这个续篇中，我们将对 Ubuntu Budgie 进行评测。

![Ubuntu Budgie Desktop][2]

顾名思义，[Ubuntu Budgie][3] 是使用 [Budgie 桌面环境][5]的 [Ubuntu 官方特色版][4]。这个版本是 Ubuntu 家族中较新的一位成员。Ubuntu Budgie 的第一个版本是 16.04，它在 17.04 版本时被接受为官方特色版。

他们的[目标][6]是“结合 Budgie 界面的简洁和优雅，以生产具有现代范式的面向桌面的传统发行版。”

### Ubuntu Budgie 20.04 评测：哪些改变了，哪些没有！

[自 18.04 LTS 发布以来，Ubuntu Budgie][7] 有了令人惊讶的更新和改进：

  * 苹果风格的新菜单
  * 默认采用基于 Budgie 的网络管理小程序
  * 新的 Window Shuffler 允许你通过快捷键平铺应用程序
  * 快速切换桌面布局的新工具
  * 支持 4k 分辨率
  * 新的默认应用程序：GNOME Firmware 和 Drawing
  * 现在已经为 20.04 重构了向后移植包
  * 默认浏览器是火狐
  * 默认使用 Catfish 搜索文件和文本
  * 在 Budgie 中集成了 Nemo 文件管理器
  * 由于错误，系统托盘小程序被移除了
  * 默认情况下，事件警报声被禁用
  * 修复了键盘快捷键神秘失踪的问题
  * 更好的锁屏样式
  * 由于社区的需求，文件应用 Nautilus 已被 Nemo 取代
  * Plank 坞站现在已经切换到屏幕底部，是透明的，并且默认有弹跳动画
  * 快速笔记和热角小程序已从 Python 移植到 Vala，以提高速度
  * Celluloid 取代了 MPV
  * 更新了 GNOME 的依赖性

![][8]

Ubuntu Budgie 现在随附了 Budgie 桌面环境的最新版本（10.5.1）。改进包括：

  * 在 Budgie 桌面设置中新增 Raven 部分
  * Raven 通知可以分组，通知可以关闭
  * 重新打造了图标任务列表
  * 能够设置虚拟桌面的数量

Ubuntu Budgie 自带了大量的 Budgie <ruby>小程序<rt>applet</rt></ruby>和<ruby>微应用<rt>min-app</rt></ruby>。它们可以通过 Ubuntu Budgie “欢迎”应用来安装。

![Ubuntu Budgie Welcome][9]

  * WeatherShow：显示未来五天的天气预报，每 3 小时更新一次
  * Wallstreet：一个可以循环展示你的图像文件夹中的壁纸工具
  * Visual-space：一个紧凑的工作区切换器
  * Dropby：这个小程序可让你在面板上快速管理 U 盘
  * Kangaroo：从面板上快速浏览文件夹
  * 垃圾桶小程序：管理你的垃圾桶
  * Fuzzyclock：以模糊的方式显示时间
  * 工作区秒表：允许你跟踪在每个工作区花费的时间

完整的变更和更新列表，请访问[变更日志][10]。

#### 系统要求

Ubuntu Budgie 20.04 更新了[系统要求][11]：

  * 4GB 或以上的内存
  * 64 位的 Intel 和 AMD 处理器
  * 在 CSM 模式下启动的 UEFI 电脑
  * 基于英特尔的现代苹果电脑

如你所见，Budgie 并不是一个真正的轻量级选择。

#### 安装的应用

![][12]

Ubuntu Budgie 中默认包含了以下有用的应用程序：

  * AisleRiot Solitaire
  * Geary
  * Catfish 搜索工具
  * Cheese 网络摄像头工具
  * GNOME Drawing
  * GNOME 2048
  * GNOME Mahjongg
  * GNOME Mines
  * GNOME Sudoku
  * Gthumb
  * LibreOffice
  * Maps
  * Rhythmbox
  * Tilix
  * Ubuntu Budgie 欢迎应用
  * Evince 文档查看器
  * Plank
  * Celluloid

![Ubuntu Budgie Ram Usage][13]

### 安装

起初，我无法让 Ubuntu Budgie 进入<ruby>即用<rt>live</rt></ruby>环境来安装它。结果发现 Ubuntu Budgie 试图通过 EFI 来启动，我从 [Ubuntu Budgie 论坛][14]得到了解决方案。

当出现紫色的闪屏时，我必须按下 `ESC` 键并选择 `legacy`。之后，它就如常启动了，安装也没有问题了。我只在 Ubuntu Budgie 上遇到过这个问题。我下载并尝试了 Ubuntu MATE 20.04 ISO，但没有遇到类似的问题。

### Ubuntu Budgie 20.04 的体验

![][15]

除了这个安装上的小问题，我使用 Ubuntu Budgie 的体验非常愉快。自 [Ikey][16] 第一次创建 Budgie 桌面以来，Budgie 桌面已经进步了很多，并且已经成为一个非常成熟的选择。Ubuntu Budgie 的目标是“生产一个面向桌面的传统发行版”。它确实做到了极致。他们所做的所有改变都在不断地为他们的产品增添更多的光彩。

总的来说，Ubuntu Budgie 是一个非常漂亮的发行版。从默认的主题到壁纸选择，你可以看出他们付出了很多努力，视觉体验非常吸引人。

需要注意的是，Ubuntu Budgie 并不适合低配置的系统。我在戴尔 Latitude D630 上运行它。在没有打开任何应用程序的情况下，它使用了大约 700MB 的内存。

在 Ubuntu Budgie 中，让我喜欢的部分超乎我的预期，其中一个部分是 [Tilix 终端模拟器][17]。Tilix 允许你在右侧或下方添加终端窗口。它有很多很多功能，我简直爱死了它，我打算在我的其他 Linux 系统上也安装它。

### 关于 Ubuntu Budgie 20.04 的最后感想

Ubuntu Budgie 是众多官方版本中一个很受欢迎的新版本。Budgie 给人的感觉非常流畅和精致。它不会让你觉得碍手碍脚，而是帮你完成工作。

如果你厌倦了当前的桌面环境，想体验一下新的东西，不妨来看看。如果你对当前的环境感到满意，那么就试试 Ubuntu Budgie 的即用 DVD。你可能会喜欢上它。

![关于 Ubuntu Budgie][18]

你是否已经尝试过 Ubuntu 20.04 Budgie？你对它的使用体验如何？如果没有用过，你现在使用的是哪个版本的 Ubuntu 20.04？

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-budgie-20-04-review/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/download-ubuntu-20-04/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-busgie-desktop.png?resize=800%2C500&ssl=1
[3]: https://ubuntubudgie.org/
[4]: https://itsfoss.com/which-ubuntu-install/
[5]: https://en.wikipedia.org/wiki/Budgie_
[6]: https://ubuntubudgie.org/about-us/
[7]: https://itsfoss.com/ubuntu-budgie-18-review/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-budgie-desktop-settings.jpeg?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-budgie-welcome.png?resize=800%2C472&ssl=1
[10]: https://ubuntubudgie.org/2020/04/21/ubuntu-budgie-20-04lts-release-notes-for-18-04-upgraders/
[11]: https://ubuntubudgie.org/downloads/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-budgie-applications.jpeg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-budgie-ram-usage.png?resize=800%2C600&ssl=1
[14]: https://discourse.ubuntubudgie.org/t/cant-get-ub-to-boot/3397
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-budgie-20-04.jpg?ssl=1
[16]: https://itsfoss.com/ikey-doherty-serpent-interview/
[17]: https://gnunn1.github.io/tilix-web/
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/ubuntu-budgie-about.png?resize=800%2C648&ssl=1
