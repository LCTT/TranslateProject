[#]: subject: "7 Tips and Tweaks to Get More Out of Thunar File Manager of Xfce"
[#]: via: "https://itsfoss.com/thunar-tweaks/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16130-1.html"

更好地利用 Xfce 的 Thunar 文件管理器的 7 个技巧
======

![][0]

> Thunar 是 Xfce 提供的一款优秀文件管理器，通过这些技巧和调整，你的使用体验可以得到提升。

Thunar 是 Xfce 桌面环境的默认文件管理器，它实现了轻量级与优秀的用户体验的完美平衡。

但是，像其他任何尚未深入探索的工具一样，你对 Thunar 的掌握会在你深入了解它之后变得更多。

我大胆地说，一系列的特性将会改善你的 Linux 体验。

在这个指南中，我会分享可以让 Thunar 体验更上一层楼的以下技巧：

  * Thunar 的通用快捷键
  * 添加 Thunar 插件
  * 从你上次离开的地方继续
  * 使用图标进行更好的识别
  * 高亮显示文件/文件夹
  * 在双窗口模式下轻松复制或移动文件
  * 自定义操作

那就让我们从第一条开始吧。

### 1、利用键盘快捷键

毫无疑问，利用键盘快捷键可以提升你的工作效率。

以下是一些在 Thunar 中使用的简单快捷键，可以帮助减少鼠标点击操作：

快捷键 | 描述
---|---
`Ctrl + T` | 新加标签页
`Ctrl + N` | 新建窗口
`F3` | 切换至双窗格模式
`Alt + ←` | 后退
`Alt + →` | 前进
`Ctrl + F` | 搜索文件
`Ctrl + S` | 按模式选取文件
`Ctrl + H` | 显示隐藏文件
`Ctrl + E` | 侧边栏启用树视图
`Alt + ↑` | 打开父目录
`Alt + Home` | 前往主目录

虽然看似简单，但请相信我，这些快捷键一旦融入你的日常工作流，你就会离不开它。

### 2、从你离开的地方重新打开 Thunar

> 📋 此功能只在 Thunar 4.18 或更高版本中可用。

打开文件管理器时，默认打开上次关闭时的所有标签页，这是一个令人振奋的功能。

我就是那种喜欢深入 Linux 目录进行探索的人，所以从我离开的地方重新打开 Thunar 是一项重要功能。

若要启用此功能，只需遵循以下三个简单的步骤：

  * 点击 “<ruby>编辑<rt>Edit</rt></ruby>” 菜单并选择 “<ruby>偏好设定<rt>Preferences</rt></ruby>”
  * 切换至 “<ruby>行为<rt>Behavior</rt></ruby>” 标签页
  * 勾选 “<ruby>启动时还原标签<rt>Restore tabs on startup</rt></ruby>” 选项

![][1]

### 3、为文件或文件夹添加徽章

你可以把徽章看作是一个特殊标记，它可以帮助你更快地识别出特定的文件或文件夹。

另外，你也可以通过添加徽章使目录名更加直观。例如，将一个 “▶️” 徽章添加到“视频”目录上。

要添加徽章，遵循下面的步骤：

  * 右键点击需要添加徽章的文件/文件夹，从上下文菜单中选择 “<ruby>属性<rt>Properties</rt></ruby>”
  * 进入 “<ruby>徽章<rt>Emblem</rt></ruby>” 标签页，为选定项选择一个或多个徽章

![][2]

我添加徽章后的样子就像这样：

![][3]

### 4、使用突出颜色高亮文件/文件夹

> 📋 这项功能只在 Thunar 4.18 及更高版本中可用。

如果仅通过添加徽章仍无法使文件/文件夹在众多文件中突显出来，你可以改变它的背景或前景颜色。

**注意：改变前景颜色只会改变选定项目的字体颜色。**

要突出高亮一个文件或文件夹，你需要按照以下步骤操作：

  * 将鼠标悬停在需要高亮的项目上，右键并选择 “属性”。
  * 进入 “<ruby>高亮<rt>Highlight</rt></ruby>” 部分，选择改变前景或背景（或两者都选，但要一次进行一项操作）。
  * 接着，选择你想要的颜色，它会展示结果。如果满意，点击 “<ruby>应用<rt>Apply</rt></ruby>” 按钮，不满意就通过 “<ruby>重置<rt>Reset</rt></ruby>” 按钮恢复默认设置。

![][4]

### 5、探索 Thunar 插件

不同于那些知名的文件管理器，Thunar 的插件相对较少，因为很多操作都可以通过自定义动作实现，其他的功能如内置一样与生俱来。

但是，也有一些实用的插件供你选择。

如要了解更多，你可以 [访问官方网站][5] 查看详情。

在这里，我将向你展示如何添加一个归档插件，让你可直接在右键菜单中创建和解压归档文件：

![][6]

在 Ubuntu 中安装 Thunar 归档插件，可以使用以下命令：

```
sudo apt install thunar-archive-plugin
```

在 Fedora 中安装：

```
sudo dnf install thunar-archive-plugin
```

在 Arch Linux 中安装：

```
sudo pacman -S thunar-archive-plugin
```

### 6、利用双窗格特性进行文件传输

这是几乎所有的文件管理器都具备、而又被大多数人所忽视的一个重要特性。

那为什么我要将此特性列为 Thunar 的优化建议呢？答案很简单。因为 Thunar 的双窗格特性非常好用，它使得文件的复制和移动变得轻而易举。

#### 移动文件

接下来我们看一下如何将文件从一个目录动态一个目录：

  * 首先，按下 `F3` 键开启双窗格模式。
  * 打开两边窗格中的目录。一边导航到需要被移动的文件所在，另一边则打开目标位置。
  * 接着，选中需要移动的项目。
  * 移动文件很简单，只需选中它们，并拖动到另一侧窗格中（即你已打开的目标位置）。

![移动文件][6A]

#### 复制文件

复制文件的操作非常类似移动文件，只是在拖曳并释放文件时需要按下 `Ctrl` 键。

  * 使用 `F3` 键切换到双窗格模式。
  * 打开两边窗格中的源文件和目标位置。
  * 选中需要复制的文件，然后按下 `Ctrl` 键，将它们拖到第二窗格中，释放鼠标后再放开 `Ctrl` 键。

![复制文件][6B]

如果你仔细看，会发现在移动文件时，鼠标指针呈现一个箭头 “↗”，而在复制文件时，它会显示一个加号 “➕”。

### 7、在 Thunar 中使用自定义操作（针对进阶用户）

到现在为止，Thunar 中最实用的功能无疑是你能创建属于自己的行为，比如使选定的文件变为可执行文件，以 root 用户身份打开 Thunar 等等。

因此，这也意味着这将是本教程中最详细的一节！

首先，点击 “编辑” 菜单，你会找到一个 “<ruby>配置自定义操作<rt>configure custom actions</rt></ruby>” 的选项，这是倒数第二个：

![][7]

如你所见，所有可用的操作都在列表中显示。

要添加操作，点击加号 “➕” 按钮，你会看到多个选项：

![][8]

这些选项包括：

  * “<ruby>名称<rt>Name</rt></ruby>”：为自定义操作命名。
  * “<ruby>描述<rt>Description</rt></ruby>”：该操作的信息说明（以帮助用户理解该操作的功能）。
  * “<ruby>子菜单<rt>Submenu</rt></ruby>”：用于将多个操作整合到一起。
  * “<ruby>命令<rt>Command</rt></ruby>”：关键的一步，你需要为这个操作分配一条命令使其可以工作。


如果你仔细看，你会发现还有另一个名为 “<ruby>出现条件<rt>Appearance Conditions</rt></ruby>” 的选项卡，在这里你可以指定在哪些文件（以及目录）类型的右键菜单中这个动作会出现。

例如，如果一个动作只应在所选文件是文本文件时才显示，那么你就需要勾选 “<rubt>文本文件<rt>Text Files</rt></ruby>” 选项：

![][9]

接下来，我要向你展示如何设置一个以 root 身份打开 Thunar 的自定义动作。

#### 创建自定义操作以 root 身份打开 Thunar

你一定经历过这种情况：你想操作一个文件，但是只有 root 用户能够访问。于是你打开终端，执行命令以 root 身份启动文件管理器。

但如果用这个自定义操作，只需轻点一下鼠标就可以了。

具体方法是，在 “<ruby>基本<rt>Basic</rt></ruby>” 选项卡的数据区域输入以下内容：

  * 名称：以 root 身份打开 Thunar
  * 命令：`pkexec thunar %F`

你能选择任何相关的图标，我在这里选择了一个简单的终端图标。

接着，在 “出现条件” 区域，输入如下内容：

  * 如果所选内容包含：<ruby>目录<rt>Directories</rt></ruby>

完成后，数据区域会如下所示：

![][10]

看一下最后的结果：

![以 root 身份打开 Thunar][10A]

看起来很酷，对吧？

以下是一些其他可能有用的自定义操作：

#### 创建创建符号链接的自定义操作

[创建符号链接][11] 是访问深度嵌套在文件系统中的文件的一种简便手段。它同时也被用来重定向到特定的包的路径。

要创建一个创建符号链接的自定义操作，你可以输入以下指令：

  * 名称：创建链接
  * 描述：创建一个符号链接
  * 命令：`ln -s %f 'Link to %n'`
  * 若选择包含：框全部都要勾选

![][12]

#### 直接查找文件

点击一个目录，选择搜索，输入你想要查找的内容。

这是在目录内搜索文件最为手边的方式了。

首先，在你的系统中安装 `catfish`，如果你是 Ubuntu/Debian 系的用户，可以使用如下命令：

```
sudo apt install catfish
```

然后，创建一个自定义操作，输入以下信息：

  * 名称：在该目录中查找文件
  * 描述：在选中的目录中搜索文件
  * 命令：`catfish %f`
  * 若选择包含：仅勾选 “目录”。

![][13]

#### 一键安装多个图像转换的自定义操作

在我写作的过程中，我找到了一款令人惊艳的包，着包中包含了以下几种自定义操作：

  * 旋转图像
  * 缩小图像
  * 图像灰度处理
  * 将图像转换为 PDF
  * 将图像转换为任意格式
  * [合并 PDF 文件][14]
  * 缩小 PDF 文件的大小
  * 创建符号链接
  * 显示校验和
  * 往图像的透明区域填充颜色
  * 加密/解密文件

首先，在你的系统中安装以下软件包：

```
sudo apt install make imagemagick gnupg2 m4 build-essential pandoc gettext python3-lxml ubuntu-dev-tools git
```

接着，克隆这个库并切换到这个新的目录：

```
git clone https://gitlab.com/nobodyinperson/thunar-custom-actions.git && cd thunar-custom-actions
```

然后，运行以下命令来确认所有的依赖项都已就绪：

```
./configure --prefix=$HOME/.local PASSWDFILE=/etc/passwd
```

如果提示你缺少某个包，那你可能需要手动安装它（但大部分情况下不需要）。

接着，运行以下命令从源代码建立这个包：

```
make
```

然后，运行以下命令安装这个包：

```
sudo make install
```

要将更改合并进 Thunar，使用以下命令：

```
uca-apply update
```

完成以上操作后，**记得登出并重新登录以使改变生效。**

这样你就会看到系统中增加了多种新的自定义操作：

![][15]

如果你觉得这些太多了，你也可以通过选择它并点击减号按钮来去除不需要的操作。

只要你有足够的想象力，你就可以创造出无数的自定义操作。欢迎你分享你最喜欢的（和命令），这样新用户也能受益。

### 进一步自定义 Xfce 

有人可能觉得 Xfce 显示得有些传统。实际上，你完全可以为它带来现代化的感受。

> **[使 Xfce 看起来现代化和漂亮的四种方法][16]**

进行主题设计是最主要的自定义方式。这里有一些 [Xfce 主题建议][17] 你可以参考。

> **[使 Xfce 看起来现代化和漂亮的 11 个主题][17]**

我希望你觉得这些关于 Thunar 的改进很有用。

你能在 Linux 桌面上尝试到更多的乐趣，不妨开始你的探索之旅吧 :)

*（题图：MJ/0bd19051-a95f-41f8-839a-47c1ce84ac83）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/thunar-tweaks/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/Restore-tabs-in-Thunar-file-manager.png
[2]: https://itsfoss.com/content/images/2023/08/Add-emblem-in-Thunar-file-manager.png
[3]: https://itsfoss.com/content/images/2023/08/Emblem-in-thunar.png
[4]: https://itsfoss.com/content/images/2023/08/Change-backgound-color-of-folder-or-file-in-Thunar.png
[5]: https://goodies.xfce.org/projects/thunar-plugins/start?ref=itsfoss.com
[6]: https://itsfoss.com/content/images/2023/08/Archive-plugin.png
[6A]: https://itsfoss.com/content/media/2023/08/Moving-files.webm
[6B]: https://itsfoss.com/content/media/2023/08/Copying-files.webm
[7]: https://itsfoss.com/content/images/2023/08/Open-configure-custom-actions.png
[8]: https://itsfoss.com/content/images/2023/08/Create-custom-action.png
[9]: https://itsfoss.com/content/images/2023/08/Appearance-settings-for-custom-action.png.png
[10]: https://itsfoss.com/content/images/2023/08/Create-custom-action-in-Thunar-1.png
[10A]: https://itsfoss.com/content/media/2023/08/Create-custom-action-to-open-thunar-as-a-root.webm
[11]: https://linuxhandbook.com/symbolic-link-linux/?ref=itsfoss.com
[12]: https://itsfoss.com/content/images/2023/08/Thunar-custom-action-to-create-symbolic-link.png
[13]: https://itsfoss.com/content/images/2023/08/Seach-files-custom-action.png
[14]: https://itsfoss.com/merge-pdf-linux/
[15]: https://itsfoss.com/content/images/2023/08/Add-various-custom-actions-at-once.jpg
[16]: https://itsfoss.com/customize-xfce/
[17]: https://itsfoss.com/best-xfce-themes/
[0]: https://img.linux.net.cn/data/attachment/album/202308/26/165038pu8c3b8ct42i2jt3.jpg