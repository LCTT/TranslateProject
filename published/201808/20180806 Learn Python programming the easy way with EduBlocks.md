使用 EduBlocks 轻松学习 Python 编程
======

> EduBlocks 提供了 Scratch 式的图形界面来编写 Python 3 代码。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire)

如果你正在寻找一种方法将你的学生（或你自己）从使用 [Scratch][1] 编程转移到学习 [Python][2]，我建议你了解一下 [EduBlocks][3]。它为 Python 3 编程带来了熟悉的拖放式图形用户界面（GUI）。

从 Scratch 过渡到 Python 的一个障碍是缺少拖放式 GUI，而正是这种拖放式 GUI 使得 Scratch 成为 K-12 学校的首选程序。EduBlocks 的拖放版的 Python 3 改变了这种范式。它的目的是“帮助教师在较早的时候向儿童介绍基于文本的编程语言，如 Python。”

EduBlocks 的硬件要求非常适中 —— 一个树莓派和一条互联网连接 —— 应该可以在许多教室中使用。

EduBlocks 是由来自英国的 14 岁 Python 开发人员 Joshua Lowe 开发的。我看到 Joshua 在 2018 年 5 月的 [PyCon 2018][4] 上展示了他的项目。

### 入门

安装 EduBlocks 很容易。该网站提供了清晰的安装说明，你可以在项目的 [GitHub][5] 仓库中找到详细的截图。

使用以下命令在 Raspberry Pi 命令行安装 EduBlocks：

```
curl -sSL get.edublocks.org | bash
```

### 在 EduBlocks 中编程

安装完成后，从桌面快捷方式或 Raspberry Pi 上的“编程”菜单启动 EduBlocks。

![](https://opensource.com/sites/default/files/uploads/edublocks_programming-menu.png)

启动程序后，你可以使用 EduBlocks 的拖放界面开始创建 Python 3 代码。它的菜单有清晰的标签。你可以通过单击 **Samples** 菜单按钮使用示例代码。你还可以通过单击 **Theme** 为你的编程界面选择不同的配色方案。使用 **Save** 菜单，你可以保存你的作品，然后 **Download** 你的 Python 代码。单击 **Run** 来执行并测试你的代码。

你可以通过单击最右侧的 **Blockly** 按钮来查看代码。它让你在 ”Blockly” 界面和普通的 Python 代码视图之间切换（正如你在任何其他 Python 编辑器中看到的那样）。

![](https://opensource.com/sites/default/files/uploads/edublocks_blockly.png)

EduBlocks 附带了一系列代码库，包括 [EduPython][6]、[Minecraft] [7]、[Sonic Pi] [8]、[GPIO Zero][9] 和 [Sense Hat][10]。

### 学习和支持

该项目维护了一个[学习门户网站][11]，其中包含教程和其他资源，可以轻松地 [hack][12] 树莓派版本的 Minecraft，编写 GPIOZero 和 Sonic Pi，并使用 Micro:bit 代码编辑器控制 LED。可以在 Twitter [@edu_blocks][13] 和 [@all_about_code][14] 以及 [email][15] 提供对 EduBlocks 的支持。

为了更深入的了解，你可以在 [GitHub][16] 上访问 EduBlocks 的源代码。该程序在 GNU Affero Public License v3.0 下[许可][17]。EduBlocks 的创建者（项目负责人 [Joshua Lowe][18] 和开发人员 [Chris Dell][19] 和 [Les Pounder][20]）希望它成为一个社区项目，并邀请人们提出问题，提供反馈，以及提交 pull request 以向项目添加功能或修复。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/edublocks

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://scratch.mit.edu/
[2]:https://www.python.org/
[3]:https://edublocks.org/
[4]:https://us.pycon.org/2018/about/
[5]:https://github.com/AllAboutCode/EduBlocks
[6]:https://edupython.tuxfamily.org/
[7]:https://minecraft.net/en-us/edition/pi/
[8]:https://sonic-pi.net/
[9]:https://gpiozero.readthedocs.io/en/stable/
[10]:https://www.raspberrypi.org/products/sense-hat/
[11]:https://edublocks.org/learn.html
[12]:https://edublocks.org/resources/1.pdf
[13]:https://twitter.com/edu_blocks?lang=en
[14]:https://twitter.com/all_about_code
[15]:mailto:support@edublocks.org
[16]:https://github.com/allaboutcode/edublocks
[17]:https://github.com/AllAboutCode/EduBlocks/blob/tarball-install/LICENSE
[18]:https://github.com/JoshuaLowe1002
[19]:https://twitter.com/cjdell?lang=en
[20]:https://twitter.com/biglesp?lang=en
