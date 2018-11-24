translating by cycoe
cycoe 翻译中
如何在 Linux 上管理字体
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_main.jpg?itok=qcJks7-c)

我不仅写技术文档，还写小说。并且因为我对 GIMP 等工具感到满意，所以我也（译者注：此处应指使用 GIMP）创建了自己的书籍封面（并为少数客户做了图形设计）。艺术创作取决于很多东西，包括字体。

虽然字体渲染已经在过去的几年里取得了长足进步，但它在 Linux 平台上仍是个问题。如果你在 Linux 和 macOS 平台上比较相同字体的外观，差别是显而易见的，尤其是你要盯着屏幕一整天的时候。虽然在 Linux 平台上尚未找到完美的字体渲染方案，开源平台做得好的一件事是允许用户轻松地管理他们的字体。通过选择、添加、缩放和调整，你可以在 Linux 平台上相当轻松地使用字体。

此处，我将分享一些这些年来我赖于在 Linux 上帮助我扩展“字体能力”的技巧。这些技巧将对那些在开源平台上进行艺术创作的人有特别的帮助。因为 Linux 平台上有非常多可用的桌面界面（每种界面以不同的方式处理字体），因此当桌面环境成为字体管理的中心时，我将主要聚焦在 GNOME 和 KDE 上。

话虽如此，让我们开始吧。

### 添加新字体

在相当长的一段时间里，我都是一个字体收藏家，甚至有些人会说我有些痴迷。从我使用 Linux 的早期开始，我就总是用相同的方法向我的桌面添加字体。有两种方法可以做到这一点：

  * 使字体针对每个用户可用；

  * 使字体在系统范围内可用。




因为我的桌面从没有其他用户（除了我自己），我只使用了每个用户的字体设置。然而，我会向你演示如何完成这两种设置。首先，让我们来看一下如何向每个用户添加新字体。你首先要做的是找到字体文件，真实类型字体（TTF）和开源类型字体（OTF）都可以被添加。我选择手动添加字体，也就是说，我在 ~/ 目录下新建了一个名为 ~/.fonts 的隐藏目录。该操作可由以下命令完成：
```
mkdir ~/.fonts

```

当此文件夹新建完成，我将所有 TTF 和 OTF 字体文件移动到此文件夹中。也就是说，你在此文件夹中添加的所有字体都可以在已安装的应用中使用了。但是要记住，这些字体只会对这一个用户可用。

如果你想要使这个字体集合对所有用户可用，你可以如下操作：

  1. 打开一个终端窗口；

  2. 切换路径到包含你所有字体的目录中；

  3. 使用 `sudo cp *.ttf *.TTF /usr/share/fonts/truetype/` 和 `sudo cp *.otf *.OTF /usr/share/fonts/opentype` 命令拷贝所有字体。




当下次用户登录时，他们就将可以使用所有这些漂亮的字体。

### 图形界面字体管理

There are a few ways to manage your fonts in Linux, via GUI. How it’s done will depend on your desktop environment. Let’s examine KDE first. With the KDE that ships with Kubuntu 18.04, you’ll find a Font Management tool pre-installed. Open that tool and you can easily add, remove, enable, and disable fonts (as well as get information about all of the installed fonts. This tool also makes it easy for you to add and remove fonts for personal and system-wide use. Let’s say you want to add a particular font for personal usage. To do this, download your font and then open up the Font Management tool. In this tool (Figure 1), click on Personal Fonts and then click the + Add button.


![adding fonts][2]

Figure 1: Adding personal fonts in KDE.

[Used with permission][3]

Navigate to the location of your fonts, select them, and click Open. Your fonts will then be added to the Personal section and are immediately available for you to use (Figure 2).


![KDE Font Manager][5]

Figure 2: Fonts added with the KDE Font Manager.

[Used with permission][3]

To do the same thing in GNOME requires the installation of an application. Open up either GNOME Software or Ubuntu Software (depending upon the distribution you’re using) and search for Font Manager. Select Font Manager and then click the Install button. Once the software is installed, launch it from the desktop menu. With the tool open, let’s install fonts on a per-user basis. Here’s how:

  1. Select User from the left pane (Figure 3).

  2. Click the + button at the top of the window.

  3. Navigate to and select the downloaded fonts.

  4. Click Open.




![Adding fonts ][7]

Figure 3: Adding fonts in GNOME.

[Used with permission][3]

### Tweaking fonts

There are three concepts you must first understand:

  * **Font Hinting:** The use of mathematical instructions to adjust the display of a font outline so that it lines up with a rasterized grid.

  * **Anti-aliasing:** The technique used to add greater realism to a digital image by smoothing jagged edges on curved lines and diagonals.

  * **Scaling factor:** **** A scalable unit that allows you to multiple the point size of a font. So if you’re font is 12pt and you have an scaling factor of 1, the font size will be 12pt. If your scaling factor is 2, the font size will be 24pt.




Let’s say you’ve installed your fonts, but they don’t look quite as good as you’d like. How do you tweak the appearance of fonts? In both the KDE and GNOME desktops, you can make a few adjustments. One thing to consider with the tweaking of fonts is that taste is very much subjective. You might find yourself having to continually tweak until you get the fonts looking exactly how you like (dictated by your needs and particular taste). Let’s first look at KDE.

Open up the System Settings tool and clock on Fonts. In this section, you can not only change various fonts, you can also enable and configure both anti-aliasing and enable font scaling factor (Figure 4).


![Configuring fonts][9]

Figure 4: Configuring fonts in KDE.

[Used with permission][3]

To configure anti-aliasing, select Enabled from the drop-down and then click Configure. In the resulting window (Figure 5), you can configure an exclude range, sub-pixel rendering type, and hinting style.

Once you’ve made your changes, click Apply. Restart any running applications and the new settings will take effect.

To do this in GNOME, you have to have either use Font Manager or GNOME Tweaks installed. For this, GNOME Tweaks is the better tool. If you open the GNOME Dash and cannot find Tweaks installed, open GNOME Software (or Ubuntu Software), and install GNOME Tweaks. Once installed, open it and click on the Fonts section. Here you can configure hinting, anti-aliasing, and scaling factor (Figure 6).

![Tweaking fonts][11]

Figure 6: Tweaking fonts in GNOME.

[Used with permission][3]

### Make your fonts beautiful

And that’s the gist of making your fonts look as beautiful as possible in Linux. You may not see a macOS-like rendering of fonts, but you can certainly improve the look. Finally, the fonts you choose will have a large impact on how things look. Make sure you’re installing clean, well-designed fonts; otherwise, you’re fighting a losing battle.

Learn more about Linux through the free ["Introduction to Linux" ][12] course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/5/how-manage-fonts-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[2]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_1.jpg?itok=7yTTe6o3 (adding fonts)
[3]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_2.jpg?itok=_g0dyVYq (KDE Font Manager)
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_3.jpg?itok=8o884QKs (Adding fonts )
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_4.jpg?itok=QJpPzFED (Configuring fonts)
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fonts_6.jpg?itok=4cQeIW9C (Tweaking fonts)
[12]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
