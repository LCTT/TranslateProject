如何创建定制的 Ubuntu Live CD 镜像
======

![](https://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-720x340.png)

今天让我们来讨论一下如何创建 Ubuntu Live CD 的定制镜像（ISO）。我们以前可以使用 [Pinguy Builder][1] 完成这项工作。但是，现在它似乎停止维护了。最近 Pinguy Builder 的官方网站似乎没有任何更新。幸运的是，我找到了另一种创建 Ubuntu Live CD 镜像的工具。使用 Cubic 即 **C**ustom **Ub**untu **I**SO **C**reator 的首字母缩写，这是一个用来创建定制的可启动的 Ubuntu Live CD（ISO）镜像的 GUI 应用程序。

Cubic 正在积极开发，它提供了许多选项来轻松地创建一个定制的 Ubuntu Live CD ，它有一个集成的 chroot 命令行环境（LCTT 译注：chroot  —— Change Root，也就是改变程序执行时所参考的根目录位置），在那里你可以定制各种方面，比如安装新的软件包、内核，添加更多的背景壁纸，添加更多的文件和文件夹。它有一个直观的 GUI 界面，在 live 镜像创建过程中可以轻松的利用导航（可以利用点击鼠标来回切换）。您可以创建一个新的自定义镜像或修改现有的项目。因为它可以用来制作 Ubuntu live 镜像，所以我相信它可以用在制作其他 Ubuntu 的发行版和衍生版镜像中，比如 Linux Mint。

### 安装 Cubic

Cubic 的开发人员已经做出了一个 PPA 来简化安装过程。要在 Ubuntu 系统上安装 Cubic ，在你的终端上运行以下命令:

```
sudo apt-add-repository ppa:cubic-wizard/release
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E
sudo apt update
sudo apt install cubic
```

### 利用 Cubic 创建 Ubuntu Live CD 的定制镜像

安装完成后，从应用程序菜单或 dock 启动 Cubic。这是在我在 Ubuntu 16.04 LTS 桌面系统中 Cubic 的样子。

为新项目选择一个目录。它是保存镜像文件的目录。

![][3]

请注意，Cubic 不是创建您当前系统的 Live CD 镜像，而是利用 Ubuntu 的安装 CD 来创建一个定制的 Live CD，因此，你应该有一个最新的 ISO 镜像。

选择您存储 Ubuntu 安装 ISO 镜像的路径。Cubic 将自动填写您定制操作系统的所有细节。如果你愿意，你可以改变细节。单击 Next 继续。

![][4]

接下来，来自源安装介质中的压缩的 Linux 文件系统将被提取到项目的目录（在我们的例子中目录的位置是 `/home/ostechnix/custom_ubuntu`)。

![][5]

一旦文件系统被提取出来，将自动加载到 chroot 环境。如果你没有看到终端提示符，请按几次回车键。

![][6]

在这里可以安装任何额外的软件包，添加背景图片，添加软件源列表，添加最新的 Linux 内核和所有其他定制到你的 Live CD 。

例如，我希望 `vim` 安装在我的 Live CD 中，所以现在就要安装它。

![][7]

我们不需要使用 `sudo`，因为我们已经在具有最高权限（root）的环境中了。

类似地，如果需要，可以安装更多的任何版本 Linux 内核。

```
apt install linux-image-extra-4.10.0-24-generic
```

此外，您还可以更新软件源列表（添加或删除软件存储库列表）：

![][8]

修改源列表后，不要忘记运行 `apt update` 命令来更新源列表：

```
apt update
```

另外，您还可以向 Live CD 中添加文件或文件夹。复制文件或文件夹（右击它们并选择复制或者利用 `CTRL+C`），在终端右键单击（在 Cubic 窗口内)，选择 “Paste file(s)”，最后点击 Cubic 向导底部的 “Copy”。

![][9]

**Ubuntu 17.10 用户注意事项**

> 在 Ubuntu 17.10 系统中，DNS 查询可能无法在 chroot 环境中工作。如果您正在制作一个定制的 Ubuntu 17.10  Live 镜像，您需要指向正确的 `resolve.conf` 配置文件：

>```
ln -sr /run/systemd/resolve/resolv.conf /run/systemd/resolve/stub-resolv.conf
```

> 要验证 DNS 解析工作，运行:

> ```
cat /etc/resolv.conf
ping google.com
```

如果你想的话，可以添加你自己的壁纸。要做到这一点，请切换到 `/usr/share/backgrounds/` 目录，

```
cd /usr/share/backgrounds
```

并将图像拖放到 Cubic 窗口中。或复制图像，右键单击 Cubic 终端窗口并选择 “Paste file(s)” 选项。此外，确保你在 `/usr/share/gnome-backproperties` 的XML文件中添加了新的壁纸，这样你可以在桌面上右键单击新添加的图像选择 “Change Desktop Background” 进行交互。完成所有更改后，在 Cubic 向导中单击 “Next”。

接下来，选择引导到新的 Live ISO 镜像时使用的 Linux 内核版本。如果已经安装了其他版本内核，它们也将在这部分中被列出。然后选择您想在 Live CD 中使用的内核。

![][10]

在下一节中，选择要从您的 Live 映像中删除的软件包。在使用定制的 Live 映像安装完 Ubuntu 操作系统后，所选的软件包将自动删除。在选择要删除的软件包时，要格外小心，您可能在不知不觉中删除了一个软件包，而此软件包又是另外一个软件包的依赖包。

![][11]

接下来， Live 镜像创建过程将开始。这里所要花费的时间取决于你定制的系统规格。

![][12]

镜像创建完成后后，单击 “Finish”。Cubic 将显示新创建的自定义镜像的细节。

如果你想在将来修改刚刚创建的自定义 Live 镜像，不要选择“ Delete all project files, except the generated disk image and the corresponding MD5 checksum file”（除了生成的磁盘映像和相应的 MD5 校验和文件之外，删除所有的项目文件**） ，Cubic 将在项目的工作目录中保留自定义图像，您可以在将来进行任何更改。而不用从头再来一遍。

要为不同的 Ubuntu 版本创建新的 Live 镜像，最好使用不同的项目目录。

### 利用 Cubic 修改 Ubuntu Live CD 的定制镜像

从菜单中启动 Cubic ，并选择一个现有的项目目录。单击 “Next” 按钮，您将看到以下三个选项：

1. Create a disk image from the existing project. （从现有项目创建一个磁盘映像。）
2. Continue customizing the existing project.（继续定制现有项目。）
3. Delete the existing project.（删除当前项目。）

![][13]

第一个选项将允许您从现有项目中使用之前所做的自定义设置创建一个新的 Live  ISO 镜像。如果您丢失了 ISO 镜像，您可以使用第一个选项来创建一个新的。

第二个选项允许您在现有项目中进行任何其他更改。如果您选择此选项，您将再次进入 chroot 环境。您可以添加新的文件或文件夹，安装任何新的软件，删除任何软件，添加其他的 Linux 内核，添加桌面背景等等。

第三个选项将删除现有的项目，所以您可以从头开始。选择此选项将删除所有文件，包括新生成的 ISO 镜像文件。

我用 Cubic 做了一个定制的 Ubuntu 16.04 LTS 桌面 Live CD 。就像这篇文章里描述的一样。如果你想创建一个 Ubuntu Live CD， Cubic 可能是一个不错的选择。

就这些了，再会！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/create-custom-ubuntu-live-cd-image/

作者：[SK][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/pinguy-builder-build-custom-ubuntu-os/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-2.png 
[5]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-3.png 
[6]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-4.png 
[7]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-6.png 
[8]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-5.png 
[9]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-7.png 
[10]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-8.png 
[11]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-10-1.png 
[12]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-12-1.png 
[13]:http://www.ostechnix.com/wp-content/uploads/2017/10/Cubic-13.png 
