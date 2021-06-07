[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11335-1.html)
[#]: subject: (How to Install Shutter Screenshot Tool in Ubuntu 19.04)
[#]: via: (https://itsfoss.com/install-shutter-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 19.04 中安装 Shutter 截图工具
======

Shutter 是我在 [Linux 中最喜欢的截图工具][1]。你可以使用它截图，还可以用它编辑截图或其他图像。它是一个在图像上添加箭头和文本的不错的工具。你也可以使用它在 Ubuntu 或其它你使用的发行版中[调整图像大小][2]。FOSS 上大多数截图教程都使用 Shutter 编辑。

![Install Shutter Ubuntu][8]


虽然 [Shutter][4] 一直是一款很棒的工具，但它的开发却停滞了。这几年来一直没有新版本的 Shutter。甚至像 [Shutter 中编辑模式被禁用][5]这样的简单 bug 也没有修复。根本没有开发者的消息。

也许这就是为什么新版本的 Ubuntu 放弃它的原因。在 Ubuntu 18.04 LTS 之前，你可以在软件中心，或者[启用 universe 仓库][7]来[使用 apt-get 命令][6]安装它。但是从 Ubuntu 18.10 及更高版本开始，你就不能再这样做了。

抛开这些缺点，Shutter 是一个很好的工具，我想继续使用它。也许你也是像我这样的 Shutter 粉丝，并且想要使用它。好的方面是你仍然可以在 Ubuntu 19.04 中安装 Shutter，这要归功于非官方 PPA。

### 在 Ubuntu 19.04 上安装 Shutter

![][3]

我希望你了解 PPA 的概念。如果不了解，我强烈建议阅读我的指南，以了解更多关于[什么是 PPA 以及如何使用它][9]。

现在，打开终端并使用以下命令添加新仓库：

```
sudo add-apt-repository -y ppa:linuxuprising/shutter
```

不需要再使用 `apt update`，因为从 Ubuntu 18.04 开始，仓库会在添加新条目后自动更新。

现在使用 `apt` 命令安装 Shutter：

```
sudo apt install shutter
```

完成。你应该已经安装 Shutter 截图工具。你可从菜单搜索并启动它。

### 删除通过非官方 PPA 安装的 Shutter

最后我以卸载 Shutter 以及删除添加的仓库来结束教程。

首先，从系统中删除 Shutter：

```
sudo apt remove shutter
```

接下来，从你的仓库列表中删除 PPA：

```
sudo add-apt-repository --remove ppa:linuxuprising/shutter
```

你或许还想了解 [Y PPA Manager][11]，这是一款 PPA 图形管理工具。

Shutter 是一个很好的工具，我希望它能被积极开发。我希望它的开发人员没问题，他/她可以找一些时间来处理它。或者是时候让其他人分叉并继续让它变得更棒。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-shutter-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/take-screenshot-linux/
[2]: https://itsfoss.com/resize-images-with-right-click/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/08/shutter-screenshot.jpg?ssl=1
[4]: http://shutter-project.org/
[5]: https://itsfoss.com/shutter-edit-button-disabled/
[6]: https://itsfoss.com/apt-get-linux-guide/
[7]: https://itsfoss.com/ubuntu-repositories/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/Install-Shutter-ubuntu.jpg?resize=800%2C450&ssl=1
[9]: https://itsfoss.com/ppa-guide/
[11]: https://itsfoss.com/y-ppa-manager/
