[#]: subject: "How To Change GRUB Theme In Linux"
[#]: via: "https://ostechnix.com/change-grub-theme-in-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Linux 中更改 GRUB 主题
======
在 Linux 中安装和应用现代的漂亮的 GRUB 主题

**GRUB** ，代表着 <ruby>GRUB<rt>**GR** 和 **U**nified **B**ootloader</rt></ruby> ，它是大多数 Linux 操作系统的默认启动加载程序。GRUB 启动加载程序是计算机启动时运行的第一个程序。正如你可能注意到的，GRUB 菜单的默认主题是朴素的。它只有一个黑色的背景和一些白色的字符。你们中的一些人可能不喜欢默认的 GRUB 主题。在这篇教程中，我将演示如何 **更改 GRUB 主题** 或应用华丽的主题，以使你的 GRUB 菜单在 Linux 中更加精美。

数年前，我们发布了一篇指南，阐释了如何在 Ubuntu 中 **[配置 GRUB2 启动加载程序设置][1]** 。在这篇文章中，我们将向你展示如何更改 GRUB 背景。

但是，只更改背景不是真正的自定义。在这篇指南中，我们不仅会更改壁纸，也会更改 GRUB 的字体、主题和整体的设计。

**免责声明:** 安装 GRUB 主题可能会破坏你的系统。我强烈建议你在一个虚拟机中尝试和测试一个主题来查看它是否没有正常工作。然后再在实际的系统上安装主题。

### 介绍

在因特网上有很多社区开发的 GRUB 主题。然而，它们却散落在不同的网站上。因此，找到一个好的 GRUB 主题可能会事倍功半。

GRUB 主题的一个重要的贡献者是 **Pling** 网站。但是，Pling 中的大部分主题是非常简单的或过时的。

幸运的是，我遇到一个名称为 **"Gorgeous GRUB"** 的工程，一个可以找到各种精美的 GRUB 主题的地方。相信我，作者付出了巨大的努力来收集这些主题，肯定会你喜欢的主题。

### Gorgeous GRUB - 一个可以找到很好的 GRUB 主题的地方

**Gorgeous GRUB** 是一个由不同用户所创建的良好 GRUB 社区主题的收藏集合。这个工程的开发者从 **Pling** 、**/r/unixporn** 和其它很多的论坛中手工挑选漂亮的 GRUB 主题，并将它们放置到一起，以便用户可以很容易的浏览它们。

如上所述，在 Pling 中的很多主题都是粗糙过时的。The author of Gorgeous GRUB 的作者翻遍了 Pling 和其它一些论坛的整个 GRUB 部分，并将所有令人满意的 GRUB 主题放置到一个地方。

仅供参考。它们不是一些粗制滥造的主题。他们付出了大量的努力来将定制的背景、字体和颜色等融合在一起。

请注意，Gorgeous GRUB 并不是一个安装你最喜欢的 GRUB 主题的应用程序。它只是一个良好工作的 GRUB 主题的展览列表。

这个工程托管在 GitHub 中。如果你有一些很酷的 GRUB 主题，你也可以将其添加到 Gorgeous GRUB 主题列表之中。

### 如何更改 GRUB 主题

应用或更改 GRUB 主题并不难。

转到 **[Gorgeous GRUB 的 GitHub 网页][2]** ，单击任意你想要应用的主题的标题。接下来，你将会被带到该主题的实际主页。一些主题托管在 **Pling** 之中，一些主题托管在 **GitHub** 之中。我将会看看如何安装来自 Pling 或 GitHub 的 GRUB 主题。

首先，让我们看看如何应用 **Descent** 主题，它托管在 Pling 中。

#### 1. 从 Pling 安装 GRUB 主题

如果主题托管在 Pling 网站，遵循这些操作说明。

在主题主页，单击 <ruby>文件<rt>Files</rt></ruby> 标签页。你将会在图像预览的下方找到这个标签页。单击文件链接来下载它。

![Download GRUB Theme From Pling][3]

转到下载位置并提取存档文件。

```
$ tar xzf 173860-20150926\ descent.tar.gz
```

存档文件的内容将被提取到当前工作目录中一个名称为 **"descent"** 目录中。

复制 "descent" 目录到 `/boot/grub/themes/` 目录，使用下面的命令。

```
$ sudo cp -r descent/ /boot/grub/themes/
```

如果 "themes" 目录不可存在，只需要创建它。

```
$ sudo mkdir /boot/grub/themes
```

并分配 "themes" 目录适当的权限。

```
$ sudo chown $USER /boot/grub/themes/
```

接下来，复制 "descent" 目录中内容到 "themes" 目录，如上所述。

现在，你应该在 "themes" 目录中有一个以主题名称命名的文件夹。

```
$ ls /boot/grub/themes/
descent
```

并且，这个主题文件夹 (例如 descent) 应该包含 `theme.txt` 和该主题附带的其它一些相关的文件 (例如，背景图像、自定义文件) 。

```
$ ls /boot/grub/themes/descent/
background1280x800.png    descent_score_14.pf2  menu_ne.png  menu_s.png         progresshigh_c.png  scrollframe_c.png   scroll_thumb_n.png
background_original.jpg   descent_score_18.pf2  menu_n.png   menu_sw.png        progresshigh_e.png  scrollframe_n.png   scroll_thumb_s.png
copyright                 menu_c.png            menu_nw.png  menu_w.png         progresshigh_w.png  scrollframe_s.png   select_os.png
descent_logo_bold_18.pf2  menu_e.png            menu_se.png  progressbar_c.png  readme              scroll_thumb_c.png  theme.txt
```

在复制下载的主题到 `/boot/grub/themes/` 目录后，编辑 `/etc/default/grub` 文件。

在进行任意更改前，请备份 grub 文件，以防万一：

```
$ sudo cp /etc/default/grub /etc/default/grub.bak
```

现在，使用你喜欢的编辑器编辑文件：

```
$ sudo nano /etc/default/grub
```

找到 `GRUB_THEME=` 代码行，并添加路径到你想要使用的主题的 `theme.txt` 。并且，也要注释掉 `GRUB_GFXMODE=` 代码行，输入背景图像的分辨率。通常，背景图像的文件名称包含其分辨率 (例如 background1280x800.png) 。

```
[...]
GRUB_THEME=/boot/grub/themes/descent/theme.txt
GRUB_GFXMODE=1280x800
[...]
```

![Enter Theme Txt File Path And Background Image Resolution][4]

再强调一次，如果这些代码行不存在，简单地添加它们。按下 **CTRL+O** 组合键 和 **CTRL+X** 组合键 来保持更改并关闭文件。

现在，应用更改到 GRUB ，使用命令：

```
$ sudo update-grub
```

**示例输出：**

```
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found theme: /boot/grub/themes/descent/theme.txt
Found linux image: /boot/vmlinuz-5.15.0-41-generic
Found initrd image: /boot/initrd.img-5.15.0-41-generic
Found linux image: /boot/vmlinuz-5.15.0-39-generic
Found initrd image: /boot/initrd.img-5.15.0-39-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
```

![Update GRUB][5]

如果你是在基于 RPM 的系统上 (例如 Fedora) ，运行下面的命令来更新 GRUB ：

```
$ sudo grub2-mkconfig -o /boot/grub2/grub.cfg instead
```

重新启动你的系统。你将会对更新后的 GRUB 主题感到满意。如果 GRUB 菜单没有出现。在打开硬件系统的电源时，立即按下 ESC 按键，直到启动菜单出现。

这是我的 Ubuntu 22.04 LTS 桌面的默认 GRUB 菜单。

![Ubuntu Default Grub Menu][6]

这是更新后的带有复古主题的 GRUB 菜单。

![Updated GRUB Menu With Descent Theme][7]

很酷，是吧？

##### 1.1. 移除 GRUB 主题

为移除一个主题，简单地删除主题文件夹：

```
$ sudo rm -fr /boot/grub/themes/descent/
```

接下来，编辑 `/etc/default/grub` 文件：

```
$ sudo nano /etc/default/grub
```

移除下面的代码行：

```
[...]
GRUB_THEME=/boot/grub/themes/descent/theme.txt
GRUB_GFXMODE=1280x800
[...]
```

保存文件并关闭它。

最后，应用更改到 GRUB ，并重新启动你的系统：

```
$ sudo update-grub
```

```
$ sudo reboot
```

#### 2. 从 GitHub 安装 GRUB 主题

如果一个 GRUB 主题托管在 GitHub 中，它将很可能有安装程序脚本和卸载程序脚本。让我们以 **[Modern GRUB Themes][8]** 为例。它托管在 GitHub 中。

Git 复刻工程的 GitHub 存储库：

```
$ git clone https://github.com/vinceliuice/grub2-themes.git
```

转到工程的文件夹：

```
$ cd grub2-themes/
```

运行安装程序脚本：

```
$ sudo ./install.sh
```

选择你喜欢的 GRUB 主题背景 (例如 tela) 。

![Choose GRUB Theme Background][9]

选择图标样式：

![Choose Icon Style][10]

选择你的显示分辨率。

![Choose Display Resolution][11]

现在选择将会安装和应用的 GRUB 主题。

```
Checking for the existence of themes directory... 
  
 Installing tela color 1080p theme... 
  
 Setting tela as default... 
  
 Updating grub config...
 
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found theme: /usr/share/grub/themes/tela/theme.txt
Found linux image: /boot/vmlinuz-5.15.0-41-generic
Found initrd image: /boot/initrd.img-5.15.0-41-generic
Found linux image: /boot/vmlinuz-5.15.0-39-generic
Found initrd image: /boot/initrd.img-5.15.0-39-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
  
 * All done! 
  
 * At the next restart of your computer you will see your new Grub theme: 'tela'
```

![Install Tela Modern Grub Theme][12]

重新启动你的系统来查看更改。

![Tela GRUB Theme][13]

这是一个漂亮的 GRUB 主题，前所未见。

你也可以明确地给定主题的名称和屏幕分辨率，像下面一样。

```
$ sudo ./install.sh -t whitesur -s 1080p
```

这将应用一个名称为 "Whitesur" 的主题，使用 1080p 屏幕分辨率。你可能会提及到其它的分辨率，例如 2k 、4k 、超宽、超宽2k 。如果你不提及分辨率，将默认应用 1080p 。

安装 Tela 主题到 `/boot/grub/themes` 文件夹：

```
$ sudo ./install.sh -b -t whitesur
```

重新启动你的系统来查看更改。

![Whitesur GRUB Theme][14]

##### 2.1. 移除 GRUB 主题

为移除已安装的一个主题，转到工程的复刻目录：

```
$ cd grub2-themes/
```

随后，运行：

```
$ sudo ./install.sh -r -t tela
```

使用你已安装的主题的名称来替换 "tela" 。

请注意，每个主题的安装说明可能有所不同。详细地参考每个工程的 GitHub 页面，并相应地安装主题。

### 总结

有些人喜欢使用艺术化的 Linux 发行版。他们以美化其 Linux 发行版感到高兴和自豪。如果你是他们中的一员，你可以看看 Gorgeous GRUB 工程来美化你的 GRUB 菜单。

转到 Gorgeous GRUB 主题网站，从列表中选择你最喜欢的主题，并按照每个工程的主页说明来安装和应用 GRUB 主题。

**资源:**

* [Gorgeous GRUB 的 GitHub 存储库][15]

--------------------------------------------------------------------------------

via: https://ostechnix.com/change-grub-theme-in-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/configure-grub-2-boot-loader-settings-ubuntu-16-04/
[2]: https://github.com/jacksaur/Gorgeous-GRUB
[3]: https://ostechnix.com/wp-content/uploads/2022/07/Download-GRUB-Theme-From-Pling.png
[4]: https://ostechnix.com/wp-content/uploads/2022/07/Enter-Theme-Txt-File-Path-And-Background-Image-Resolution.png
[5]: https://ostechnix.com/wp-content/uploads/2022/07/Update-GRUB.png
[6]: https://ostechnix.com/wp-content/uploads/2022/07/Ubuntu-Default-Grub-Menu.png
[7]: https://ostechnix.com/wp-content/uploads/2022/07/Updated-GRUB-Menu.png
[8]: https://github.com/vinceliuice/grub2-themes
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Choose-GRUB-Theme-Background.png
[10]: https://ostechnix.com/wp-content/uploads/2022/07/Choose-Icon-Style.png
[11]: https://ostechnix.com/wp-content/uploads/2022/07/Choose-Display-Resolution.png
[12]: https://ostechnix.com/wp-content/uploads/2022/07/Install-Tela-Modern-Grub-Theme.png
[13]: https://ostechnix.com/wp-content/uploads/2022/07/Tela-GRUB-Theme.png
[14]: https://ostechnix.com/wp-content/uploads/2022/07/Whitesur-GRUB-Theme-1.png
[15]: https://github.com/jacksaur/Gorgeous-GRUB
