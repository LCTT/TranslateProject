Flameshot：一个简洁但功能丰富的截图工具 
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Flameshot-720x340.png)

截图是我工作的一部分，我先前使用深度截图工具来截图，深度截图是一个简单、轻量级且非常简洁的截图工具。它自带许多功能例如窗口识别、快捷键支持、图片编辑、延时截图、社交分享、智能存储以及图片清晰度调整等功能。今天我碰巧发现了另一个具备多种功能的截图工具，它就是 **Flameshot** ，一个简单但功能丰富的针对类 Unix 系统的截图工具。它简单易用，可定制并且有选项可以支持上传截图到在线图片分享网站 **imgur** 上。同时 Flameshot 有一个 CLI 版本，所以你也可以从命令行来进行截图。Flameshot 是一个完全免费且开源的工具。在本教程中，我们将看到如何安装 Flameshot 以及如何使用它来截图。

### 安装 Flameshot

**在 Arch Linux 上：**

Flameshot 可以从 Arch LInux 的 [community] 仓库中获取。确保你已经启用了 community 仓库，然后就可以像下面展示的那样使用 pacman 来安装 Flameshot ：

```
$ sudo pacman -S flameshot
```

它也可以从 [**AUR**][1] 中获取，所以你还可以使用任意一个 AUR 帮助程序（例如 [**Yay**][2]）来在基于 Arch 的系统中安装它：

```
$ yay -S flameshot-git
```

**在 Fedora 中：**

```
$ sudo dnf install flameshot
```

在 **Debian 10+** 和 **Ubuntu 18.04+** 中，可以使用  APT 包管理器来安装它：

```
$ sudo apt install flameshot
```

**在 openSUSE 上：**

```
$ sudo zypper install flameshot
```

在其他的 Linux 发行版中，可以从源代码编译并安装它。编译过程中需要 **Qt version 5.3** 以及 **GCC 4.9.2** 或者它们的更高版本。

### 使用

可以从菜单或者应用启动器中启动 Flameshot。在 MATE 桌面环境，它通常可以在 “Applications -> Graphics” 下找到。

一旦打开了它，你就可以在系统面板中看到 Flameshot 的托盘图标。

**注意：**

假如你使用 Gnome 桌面环境，为了能够看到系统托盘图标，你需要安装  [TopIcons][3] 扩展。

在 Flameshot 托盘图标上右击，你便会看到几个菜单项，例如打开配置窗口、信息窗口以及退出该应用。

要进行截图，只需要点击托盘图标就可以了。接着你将看到如何使用 Flameshot 的帮助窗口。选择一个截图区域，然后敲回车键便可以截屏了，点击右键便可以看到颜色拾取器，再敲空格键便可以查看屏幕侧边的面板。你可以使用鼠标的滚轮来增加或者减少指针的宽度。

Flameshot 自带一系列非常好的功能，例如：

* 可以进行手写
* 可以划直线
* 可以画长方形或者圆形框
* 可以进行长方形区域选择
* 可以画箭头
* 可以对要点进行标注
* 可以添加文本
* 可以对图片或者文字进行模糊处理
* 可以展示图片的尺寸大小
* 在编辑图片是可以进行撤销和重做操作
* 可以将选择的东西复制到剪贴板
* 可以保存选区
* 可以离开截屏
* 可以选择另一个 app 来打开图片
* 可以上传图片到 imgur 网站
* 可以将图片固定到桌面上

下面是一个示例的视频：

<http://www.ostechnix.com/wp-content/uploads/2018/09/Flameshot-demo.mp4>

### 快捷键

Frameshot 也支持快捷键。在 Flameshot 的托盘图标上右击并点击 “Information” 窗口便可以看到在 GUI 模式下所有可用的快捷键。下面是在 GUI 模式下可用的快捷键清单：

| 快捷键                 | 描述                          |
|------------------------|------------------------------|
| `←`、`↓`、`↑`、`→`             | 移动选择区域 1px              |
| `Shift` + `←`、`↓`、`↑`、`→`     | 将选择区域大小更改 1px         |
| `Esc`                    | 退出截图                      |
| `Ctrl` + `C`               | 复制到粘贴板                  |
| `Ctrl` + `S`               | 将选择区域保存为文件           |
| `Ctrl` + `Z`               | 撤销最近的一次操作             |
| 鼠标右键            | 展示颜色拾取器                 |
| 鼠标滚轮            | 改变工具的宽度                 |

边按住 `Shift` 键并拖动选择区域的其中一个控制点将会对它相反方向的控制点做类似的拖放操作。

### 命令行选项

Flameshot 也支持一系列的命令行选项来延时截图和保存图片到自定义的路径。

要使用 Flameshot GUI 模式，运行：

```
$ flameshot gui
```

要使用 GUI 模式截屏并将你选取的区域保存到一个自定义的路径，运行：

```
$ flameshot gui -p ~/myStuff/captures
```

要延时 2 秒后打开 GUI 模式可以使用：

```
$ flameshot gui -d 2000
```

要延时 2 秒并将截图保存到一个自定义的路径（无 GUI）可以使用：

```
$ flameshot full -p ~/myStuff/captures -d 2000
```

要截图全屏并保存到自定义的路径和粘贴板中使用：

```
$ flameshot full -c -p ~/myStuff/captures
```

要在截屏中包含鼠标并将图片保存为 PNG 格式可以使用：

```
$ flameshot screen -r
```

要对屏幕 1 进行截屏并将截屏复制到粘贴板中可以运行：

```
$ flameshot screen -n 1 -c
```

你还需要什么功能呢？Flameshot 拥有几乎截屏的所有功能：添加注释、编辑图片、模糊处理或者对要点做高亮等等功能。我想：在我找到它的最佳替代品之前，我将一直使用 Flameshot 来作为我当前的截图工具。请尝试一下它，你不会失望的。

好了，这就是今天的全部内容了。后续将有更多精彩内容，请保持关注！

Cheers!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/flameshot-a-simple-yet-powerful-feature-rich-screenshot-tool/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://aur.archlinux.org/packages/flameshot-git
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[3]: https://extensions.gnome.org/extension/1031/topicons/
