GPaste：Gnome Shell 中优秀的剪贴板管理器
======

[GPaste][1] 是一个剪贴板管理系统，它包含了库、守护程序以及命令行和 Gnome 界面（使用原生 Gnome Shell 扩展）。

剪贴板管理器能够跟踪你正在复制和粘贴的内容，从而能够访问以前复制的项目。GPaste 带有原生的 Gnome Shell 扩展，是那些寻找 Gnome 剪贴板管理器的人的完美补充。

[![GPaste Gnome Shell extension Ubuntu 18.04][2]][3]

*GPaste Gnome Shell扩展*

在 Gnome 中使用 GPaste，你只需单击顶部面板即可得到可配置的、可搜索的剪贴板历史记录。GPaste 不仅会记住你复制的文本，还能记住文件路径和图像（后者需要在设置中启用，因为默认情况下它被禁用）。

不仅如此，GPaste 还可以检测到增长的行，这意味着当检测到新文本是另一个文本的增长时，它会替换它，这对于保持剪贴板整洁非常有用。

在扩展菜单中，你可以暂停 GPaste 跟踪剪贴板，并从剪贴板历史记录或整个历史记录中删除项目。你还会发现一个启动 GPaste 用户界面窗口的按钮。

如果你更喜欢使用键盘，你可以使用快捷键从顶栏开启 GPaste 历史记录（`Ctrl + Alt + H`）或打开全部的 GPaste GUI（`Ctrl + Alt + G`）。

该工具还包含这些键盘快捷键（可以更改）：

* 从历史记录中删除活动项目： `Ctrl + Alt + V`
* 将活动项目显示为密码（在 GPaste 中混淆剪贴板条目）： `Ctrl + Alt + S`
* 将剪贴板同步到主选择： `Ctrl + Alt + O`
* 将主选择同步到剪贴板：`Ctrl + Alt + P`
* 将活动项目上传到 pastebin 服务：`Ctrl + Alt + U`

[![][4]][5]

*GPaste GUI*

GPaste 窗口界面提供可供搜索的剪贴板历史记录（包括清除、编辑或上传项目的选项）、暂停 GPaste 跟踪剪贴板的选项、重启 GPaste 守护程序，备份当前剪贴板历史记录，还有它的设置。

[![][6]][7]

*GPaste GUI*

在 GPaste 界面中，你可以更改以下设置：

  * 启用或禁用 Gnome Shell 扩展
  * 将守护程序状态与扩展程序的状态同步
  * 主选区生效历史
  * 使剪贴板与主选区同步
  * 图像支持
  * 修整条目
  * 检测增长行
  * 保存历史
  * 历史记录设置，如最大历史记录大小、内存使用情况、最大文本长度等
  * 键盘快捷键

### 下载 GPaste

- [下载 GPaste](https://github.com/Keruspe/GPaste)

Gpaste 项目页面没有链接到任何 GPaste 二进制文件，它只有源码安装说明。非 Debian 或 Ubuntu 的 Linux 发行版的用户（你可以在下面找到 GPaste 安装说明）可以在各自的发行版仓库中搜索 GPaste。

不要将 GPaste 与 Gnome Shell 扩展网站上发布的 GPaste Integration 扩展混淆。这是一个使用 GPaste 守护程序的 Gnome Shell 扩展，它不再维护。内置于 GPaste 中的原生 Gnome Shell 扩展仍然维护。

#### 在 Ubuntu（18.04、16.04）或 Debian（Jessie 和更新版本）中安装 GPaste

对于 Debian，GPaste 可用于 Jessie 和更新版本，而对于 Ubuntu，GPaste 在 16.04 及更新版本的仓库中（因此可在 Ubuntu 18.04 Bionic Beaver 中使用）。

你可以使用以下命令在 Debian 或 Ubuntu 中安装 GPaste（守护程序和 Gnome Shell 扩展）：

```
sudo apt install gnome-shell-extensions-gpaste gpaste
```

安装完成后，按下 `Alt + F2` 并输入 `r`  重新启动 Gnome Shell，然后按回车键。现在应该启用了 GPaste Gnome Shell 扩展，其图标应显示在顶部 Gnome Shell 面板上。如果没有，请使用 Gnome Tweaks（Gnome Tweak Tool）启用扩展。

[Debian][8] 和 [Ubuntu][9] 的 GPaste 3.28.0 中有一个错误，如果启用了图像支持选项会导致它崩溃，所以现在不要启用此功能。这在 GPaste 3.28.2 中被标记为[已修复][10]，但 Debian 和 Ubuntu 仓库中尚未提供此包。


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/gpaste-is-great-clipboard-manager-for.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/Keruspe/GPaste
[2]:https://2.bp.blogspot.com/-2ndArDBcrwY/W2gyhMc1kEI/AAAAAAAABS0/ZAe_onuGCacMblF733QGBX3XqyZd--WuACLcBGAs/s400/gpaste-gnome-shell-extension-ubuntu1804.png (Gpaste Gnome Shell)
[3]:https://2.bp.blogspot.com/-2ndArDBcrwY/W2gyhMc1kEI/AAAAAAAABS0/ZAe_onuGCacMblF733QGBX3XqyZd--WuACLcBGAs/s1600/gpaste-gnome-shell-extension-ubuntu1804.png
[4]:https://2.bp.blogspot.com/-7FBRsZJvYek/W2gyvzmeRxI/AAAAAAAABS4/LhokMFSn8_kZndrNB-BTP4W3e9IUuz9BgCLcBGAs/s640/gpaste-gui_1.png
[5]:https://2.bp.blogspot.com/-7FBRsZJvYek/W2gyvzmeRxI/AAAAAAAABS4/LhokMFSn8_kZndrNB-BTP4W3e9IUuz9BgCLcBGAs/s1600/gpaste-gui_1.png
[6]:https://4.bp.blogspot.com/-047ShYc6RrQ/W2gyz5FCf_I/AAAAAAAABTA/-o6jaWzwNpsSjG0QRwRJ5Xurq_A6dQ0sQCLcBGAs/s640/gpaste-gui_2.png
[7]:https://4.bp.blogspot.com/-047ShYc6RrQ/W2gyz5FCf_I/AAAAAAAABTA/-o6jaWzwNpsSjG0QRwRJ5Xurq_A6dQ0sQCLcBGAs/s1600/gpaste-gui_2.png
[8]:https://packages.debian.org/buster/gpaste
[9]:https://launchpad.net/ubuntu/+source/gpaste
[10]:https://www.imagination-land.org/posts/2018-04-13-gpaste-3.28.2-released.html
