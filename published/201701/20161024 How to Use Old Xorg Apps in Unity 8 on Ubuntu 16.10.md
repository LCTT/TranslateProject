如何在 Ubuntu 16.10 的 Unity 8 上运行老式 Xorg 程序
====

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-feature-image.jpg "How to Use Old Xorg Apps in Unity 8 on Ubuntu 16.10s")

随着 Ubuntu 16.10 的发布，Unity 8 越来越吸引到了更多人的关注。这是因为在这个大家最爱的 Linux 发行版的最新版本中可以体验其带有的试验性桌面。桌面发行版是人们最熟悉的 Unity 环境，但有一点点不同。它不再使用 X11 图形技术，Ubuntu 的开发者选择了另一种截然不同的方式。

原来，Unity 8 用的是 Mir，这是 Ubuntu 为了在 Linux 上提供显示服务而做出的努力。这项技术已经在 Ubuntu phone 和平板上大量使用，但是这次新版是我们在桌面环境上第一次见到 Mir 。

这项技术相当新颖，结果是没多少 Linux 程序能运行在它之上。不是所有，那也是大部分的程序设计在 Xorg 和 X11 之上运行。如果你想要试试在 Unity 8 上运行这些程序，你肯定会为在 Unity 8上确实能够运行之前的 Xorg 程序而高兴。接下来是如何做！

### 登录进 Unity 8

![unity8-select-unity-8-login](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-select-unity-8-login.jpg "unity8-select-unity-8-login")

Unity 8 在 Ubuntu 16.10 上是一个可选会话。在使用之前只须牢记一件事情：它不会加载 AMD 的图形驱动，Intel 的同样不会加载。唯一支持的图形驱动是 Nvidia 的开源驱动。要用 Unity 8 的话，只要像往常那样启动 Ubuntu，然后，在登录进去之前，点击用户名上面的 Ubuntu 图标，选择 Unity8 选项。如果万事顺利的话，这个新的、试验性的桌面环境将会加载。

**注意**： Unity 8 非常新而且不稳定，自行承担使用风险。

### 安装 Libertine 

Xorg 程序（例如 Firefox 等）确实能在 Unity 8 上使用，在使用之前需要一点小调整。在 Mir 桌面上用终端打开 Libertine ，在 Scopes 窗口中点击终端图标就能完成。一旦打开，输入你的密码。接下来，输入以下的命令：

![unity8-installing-libertine-in-terminal](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-installing-libertine-in-terminal.jpg "unity8-installing-libertine-in-terminal")

```
sudo apt install libertine-tools libertine-scope libertine
```

当这些程序完成安装后，点击并拖动 Scopes 窗口以刷新内容。然后，在面板上点击来启动 libertine。

### 新建 Xorg 容器

打开 Libertine，就可以新建一些（应用）容器了。这些容器很特别，因为它们能让基于 X11 的 Linux 程序在 Mir/Unity 8 桌面上的容器之中运行。另外，如果需要支持 32 位应用，勾选“i386 multiarch support”复选框。否则，什么都不要动（或者输入名字和密码），点击“OK”。

![unity8-libertine-create-new-container](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-libertine-create-new-container.jpg "unity8-libertine-create-new-container")

在这之后，这个 Xorg 容器就准备好，可以使用了。在 Libertine 找到它并启动。删除也很容易，右键点击容器，选择“删除”选项。

**注意**：每一个 Xorg 容器有 500 MB的最大内存限制。所以多个容器是有必要的。

### 安装软件

![unity8-libertine-install-software](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-libertine-install-software.jpg "unity8-libertine-install-software")

在 Libertine 容器中安装软件有两个方法。第一种是允许用户启动容器后选择“输入包名或者 Debian 文件”，这意味着用户可以在软件中心或者终端找到一个软件的名字，然后在 Libertine 中输入它来安装。也可以指定特定的 DEB 文件来安装，可以在Libertine LXC 容器中直接搜索安装包。

**注意**：Unity 8 非常新，一些程序或许不能在 Libertine 里加载或者完全安装。

### 结论

Unity 8 展现了不少的新特性，它现代、时髦，而且比之前任何一个 Unity 迭代版本都快。唯一限制它的就是使用率。事实是大部分用户更乐意选择实用的应用程序，而不是一个别致新颖的桌面环境。某种程度上来说，使用 Libertine 能解决这个问题，但它不会永久有效。早晚有一天，Canonical 都需要自行移植这些程序或者向社区求助来彻底解决这个问题。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/use-old-xorg-apps-unity-8/

作者：[Derrik Diener][a]
译者：[ypingcn](https://github.com/ypingcn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/use-old-xorg-apps-unity-8/#respond

[3]:https://www.maketecheasier.com/shimo-vpn-client-for-mac/
[4]:https://www.maketecheasier.com/schedule-windows-empty-recycle-bin/
[5]:mailto:?subject=How%20to%20Use%20Old%20Xorg%20Apps%20in%20Unity%208%20on%20Ubuntu%2016.10&body=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F
[6]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F&text=How+to+Use+Old+Xorg+Apps+in+Unity+8+on+Ubuntu+16.10
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F
[8]:https://www.maketecheasier.com/category/linux-tips/
