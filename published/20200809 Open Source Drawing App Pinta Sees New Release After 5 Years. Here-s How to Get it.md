[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12501-1.html)
[#]: subject: (Open Source Drawing App Pinta Sees New Release After 5 Years. Here’s How to Get it!)
[#]: via: (https://itsfoss.com/pinta-new-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

开源绘画应用 Pinta 在 5 年后迎来新版本
====== 

> 开源绘画应用 Pinta 时隔 5 年多迎来新版本。新版本修复了众多 BUG，并增加了新功能。

[Pinta][1] 是一款[开源绘画应用，适用于 Linux][2]、Windows 和 macOS。你可以用它来进行自由手绘/素描。你也可以用它在现有的图片上添加箭头、方框、文字等。

![][3]

日前，Pinta 1.7 版本在时隔近 5 年后发布。让我们来看看新版本中都有哪些功能。

### Pinta 1.7 的新功能

以下是最新版本的 Pinta 带来的新功能：

  * 可以在图片之间切换的标签视图
  * 增加了一个平滑擦除工具
  * 拖放 URL 以在 Pinta 中下载并打开图像进行编辑
  * 铅笔工具可以在不同的混合模式之间切换
  * 按住 Ctrl 键可以缩放“选定移动”工具
  * 矩形选择工具现在在选区的每个角落显示不同的箭头光标
  * 提高了与选区互动时的性能，特别是对大图像而言

还有许多 bug 修复，这应该会改善整个 Pinta 的体验。你可以在[官方发布说明][4]中了解更多变化。

### 在 Ubuntu 和其他 Linux 发行版上安装 Pinta 1.7

对于 Ubuntu 和基于 Ubuntu 的 Linux 发行版，有一个[官方 PPA 可用][5]。如果你使用的是 Ubuntu 18.04 或 20.04，可以使用这个 PPA。

打开一个终端，使用下面的命令来添加新的仓库。你会被要求输入你的密码。你可能已经知道，当你在终端中输入密码时，不会有任何显示。只要输入密码，然后按回车键就可以了。

```
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
```

在 Ubuntu 18.04 和更高版本上已不再需要，但其他一些发行版可能需要更新缓存：

```
sudo apt update
```

现在用这个命令安装最新版本的 Pinta：

```
sudo apt install pinta
```

好的是，如果你之前安装了 Pinta 1.6，它就会更新到新版本。

#### 移除 Pinta

要删除通过 PPA 安装的 Pinta，请使用此命令：

```
sudo apt remove pinta
```

你还应该[删除此 PPA][6]：

```
sudo add-apt-repository -r ppa:pinta-maintainers/pinta-stable
```

#### 在其他发行版上安装 Pinta

在我上次检查时，Pinta 1.7 还没有在 Fedora 或 AUR 上出现。你可以等待一段时间，或者下载源码自己试试。

- [下载 Pinta 1.7][7]

Pinta 团队也更新了用户指南，提供了详细的文档。如果你是新手或者想深入使用 Pinta，可以参考[本用户指南][8]进行参考。

### 结束语

我很高兴能看到 Pinta 的新版本。它是我编辑图像的常用工具，可以为教程添加箭头、方框和文字。最近我使用 [Shutter][9] 来达到这个目的，但有了这个新版本，我也许会再次改用 Pinta。

你呢？你使用 Pinta 吗，或者你过去用过它吗？你期待使用新版本吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/pinta-new-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.pinta-project.com/
[2]: https://itsfoss.com/open-source-paint-apps/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/pinta-1-7.png?resize=800%2C517&ssl=1
[4]: https://www.pinta-project.com/releases/1-7
[5]: https://launchpad.net/~pinta-maintainers/+archive/ubuntu/pinta-stable
[6]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[7]: https://www.pinta-project.com/releases/
[8]: https://www.pinta-project.com/user-guide/
[9]: https://itsfoss.com/install-shutter-ubuntu/
