translating by ypingcn.

How to Use Old Xorg Apps in Unity 8 on Ubuntu 16.10

如何在 Ubuntu 16.10 的 Unity 8 上使用之前的 Xorg 程序

====

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-feature-image.jpg "How to Use Old Xorg Apps in Unity 8 on Ubuntu 16.10s")

随着 Ubuntu 16.10 的发布，Unity 8 吸引到了比平时更多的目光。这是因为这个大家最爱的 Linux 发行版的最新版本进行着一项桌面显示实验。桌面发行版是人们最熟悉的 Unity 环境，但有一点点不同。它不再使用 X11 图形技术，Ubuntu的开发者选择了另一种截然不同的方式。

With the release of Ubuntu 16.10, Unity 8 has been getting more attention than usual. This is because the latest release of everyone’s favorite Linux distribution comes with an experimental desktop to play with. This desktop is the Unity environment most are used to, with a twist. It no longer is making use of X11 graphics technology and instead the makers of Ubuntu have gone a different way.

原来，Unity 8 用的是 Mir，这是 Ubuntu 对 Linux 上更好显示服务的号召所做出的回答。这项技术已经 Ubuntu phone 和平板上大量使用，但是这次新版是我们在桌面环境上第一次见到 Mir 。

In its place, Unity 8 is using Mir, Ubuntu’s answer to calls for a better-performing display server on Linux. This technology has been in heavy use already on the Ubuntu phone and tablet, but this new release is the first time we’ve seen it on the desktop.

这项技术相当新颖，结果是没多少 Linux 程序能运行在它之上。不是所有，那也是大部分的程序被设计在 Xorg 和 X11 之上运行。如果你一直尝试在 Unity 8 上运行这些程序，当你了解到在 Unity 8上确实有可能运行之前的 Xorg 程序时，你会很开心的。接下来是如何做！

This technology is new and shiny. As a result, not a lot of established Linux programs can work on it, as most, if not all, of these tools are built to work with Xorg and X11\. However, if you’ve been wanting to try out Unity 8, you’ll be happy to know that it is indeed possible to get these old Xorg apps working in Unity 8\. Here’s how!

### Logging Into Unity 8

### 登录进 Unity 8

![unity8-select-unity-8-login](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-select-unity-8-login.jpg "unity8-select-unity-8-login")

Unity 8 在 Ubuntu 16.10 上是一个可选会话。在使用之前只须牢记一件事情：它不会加载 AMD 的图形驱动，Intel 的同样不会加载。唯一支持的图形驱动是 Nvidia 的开源驱动。要用 Unity 8 的话，只要像往常那样启动 Ubuntu，然后，在登录进去之前，点击用户名上面的 Ubuntu 图标，选择 Unity8 选项。如果万事顺利的话，这个新的、试验性的桌面环境将会加载。

Unity 8 comes as an optional session in Ubuntu 16.10\. There’s one key thing to keep in mind before using it: it will not load with AMD graphics drivers, or Intel for that matter. The only supported graphics drivers as of now are the open source Nvidia drivers. To use the Unity 8 session, start up Ubuntu like normal. Then, before logging in, click the Ubuntu icon above your username and select “Unity8.” If all goes well, the new, experimental desktop will load.

**注意**： Unity 8 非常新而且不稳定，自行承担使用风险。

**Note**: Unity 8 is very new and unstable. Use at your own risk.

### Installing Libertine

### 安装 Libertine 

Xorg 程序（例如 Firefox 等）确实能在 Unity 8 上使用，在使用之前需要一点小调整。在 Mir 桌面上用终端打开 Libertine ，在 scopes 窗口中点击终端图标就能完成。一旦打开，输入你的密码。接下来，输入以下的命令：

Xorg programs (like Firefox, etc.) do work in Unity 8; they just need a little tweak before anything will run. Start off by opening a terminal on the Mir desktop. This is done by clicking the terminal icon in the “scopes” window. Once open, enter your password. After that, enter the following commands:

![unity8-installing-libertine-in-terminal](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-installing-libertine-in-terminal.jpg "unity8-installing-libertine-in-terminal")

```
sudo apt install libertine-tools libertine-scope libertine
```

当这些程序完成安装后，点击并拖动 scopes 窗口以刷新内容。然后，在面板上点击来启动libertine。

When these programs finish installing, click and drag the scope window to refresh it. Then, click on the top-hat to launch libertine.

### Creating Xorg Containers

### 新建 Xorg 容器

打开 Libertine，就到时间来新建一些容器了。这些容器很特别，因为他们能让基于 X11 的 Linux 程序在 Mir/Unity 8 桌面上的容器之中运行。另外，点击“i386 multiarch support"复选框来获得 32 位支持。否则，什么都不要动（或者输入名字和密码），点击”OK”。

With Libertine open, it’s time to create some containers. These containers are special, as they allow X11 based Linux programs to run inside of a container on the Mir/Unity 8 desktop. Additionally, check the “i386 multiarch support” box for 32bit support. Otherwise, leave everything as is (or give it a name and password), and click OK.

![unity8-libertine-create-new-container](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-libertine-create-new-container.jpg "unity8-libertine-create-new-container")

在这之后，这个 Xorg 容器就准备好以供使用了。在 Libertine 找到它并启动。删除也很容易，右键点击容器，选择“删除”选项。

From this point on, the Xorg container is ready to use. Look for it in Libertine and launch the container. It also should be noted that containers can be erased by right-clicking on them, then selecting the “Delete” option.

**注意**：每一个 Xorg 容器有 500 MB的最大内存限制。所以多个容器是有必要的。

**Note**: each Xorg container has a maximum memory limit of 500 megabytes, so multiple containers may be necessary.

### Installing Software

### 安装软件

![unity8-libertine-install-software](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-libertine-install-software.jpg "unity8-libertine-install-software")

两天内在 Libertine 容器中安装好软件。第一步允许用户启动容器后选择“输入包名或者 Debian 文件”，这意味着用户可以在软件中心或者终端找到一个软件的名字，然后输入 Libertine 来安装，也可以指定特定的 DEB 文件来安装，也可以在Libertine LXC 容器中直接搜索安装包。

Software is installed in Libertine containers in two ways. The first way allows for users to launch the container and select “Enter package name or Debian file,” meaning it is possible to find the name of a program in the software center or terminal and enter it into Libertine to install it. It is also possible to specify a .DEB package file for installation. It is also possible to search for the package directly within the Libertine LXC container.

**注意**：Unity 8 非常新，一些程序或许不能在 Libertine 里加载或者完全安装。

**Note**: Unity 8 is very new, and some programs may not load or fully install with Libertine.

### Conclusion

### 结论

Unity 8展现了不少的新特性，它现代、时髦，而且比之前任何一个 Unity 迭代版本都快。唯一限制它的就是使用率。事实是大部分用户更乐意选择实用的应用程序，而不是一个别致新颖的桌面环境。某种程度上来说，使用 Libertine 能解决这个问题，但它不会永久有效。早晚有一天，Canonical 将有必要自行引进程序或者向社区求助来彻底解决这个问题。

Unity 8 shows a lot of promise. It’s modern, sleek, and faster than any iteration of Unity that came before it. The only thing that is holding it back is adoption. The simple fact is that most users would rather have programs that work instead of a fancy, fresh desktop. To an extent, using Libertine solves this issue, but it won’t work forever. Sooner or later Canonical will need to start porting programs on their own or reach out to the community as as whole to make this happen.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/use-old-xorg-apps-unity-8/

作者：[Derrik Diener][a]

译者：[ypingcn](https://github.com/ypingcn)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/use-old-xorg-apps-unity-8/#respond

[3]:https://www.maketecheasier.com/shimo-vpn-client-for-mac/
[4]:https://www.maketecheasier.com/schedule-windows-empty-recycle-bin/
[5]:mailto:?subject=How%20to%20Use%20Old%20Xorg%20Apps%20in%20Unity%208%20on%20Ubuntu%2016.10&body=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F
[6]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F&text=How+to+Use+Old+Xorg+Apps+in+Unity+8+on+Ubuntu+16.10
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F
[8]:https://www.maketecheasier.com/category/linux-tips/
