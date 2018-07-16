在 Ubuntu 14.04 和 Linux Mint 17 上安装 Atom 文本编辑器
===

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Install_Atom_In_Ubuntu_Linux_Mint.jpeg)

[Atom][1]是[Github][2]上时髦的，功能丰富的开源文本编辑器。目前，它正处于测试阶段，但如果你对它很好奇，那我们就来看看**如何在 Ubuntu 14.04 和 Linux Mint 17 上安装 Atom**

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Atom_Editor.jpeg)

无论是在外观，还是在功能上，Atom 都有很多与[Sublime Text editor][3]相似之处。Sublime Text editor是一个功能强大，并深受程序员喜爱的跨平台文本编辑器，可惜它是闭源的。事实上，在Sublime Text的灵感下，Atom 并不是唯一即将到来的文本编辑器。[Lime Text][4]是 Sublime Text 的开源克隆，目前正处于开发中。

废话不多说，让我们来看看如何在 Ubuntu 14.04 和 Linux Mint 17 下安装 Atom 编辑器。

### 通过PPA源，在Ubuntu和Linux Mint下安装Atom ###

因为 Atom 正处于测试阶段，截止到我写这篇文章前，还没有 Linux 下的二进制文件。但是不用担心，你不需要亲自去编译这些代码（当然如果你乐意的话，你也可以这么做）。感谢[Webupd8 team’s][5]的努力，我们拥有了一个可以很容易将 Atom 安装在32位和64位系统上的PPA。

打开终端，然后使用下面的命令行： 

	sudo add-apt-repository ppa:webupd8team/atom
	sudo apt-get update
	sudo apt-get install atom

就这么简单，你可以通过 Ubuntu 下的 Unity Dash 和 Linux Mint 里的应用程序菜单启动 Atom 编辑器。

### 从Ubuntu和Linux Mint卸载Atom ###

可能，你想要从系统中卸载 Atom 的原因有很多种。不稳定可能是主要原因之一。好吧，不管什么原因，我来说下怎么卸载Atom：

	sudo apt-get remove atom
	sudo add-apt-repository --remove ppa:webupd8team/atom

这些命令会移除 Atom 和 PPA 仓库，运行 auto remove 也是个好方法：

	sudo apt-get autoremove

### 你有哪些使用 Atom 的体验？　###

如果你尝试了Atom，请和我们分享你的体验。你觉的它会成为你最喜欢的文本编辑器吗？

---

via: http://itsfoss.com/install-atom-text-editor-ubuntu-1404-linux-mint-17/

作者：[Abhishek][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:https://atom.io/
[2]:https://github.com/
[3]:http://www.sublimetext.com/
[4]:http://itsfoss.com/lime-text-open-source-alternative/
[5]:https://launchpad.net/~nilarimogard/+archive/ubuntu/webupd8
