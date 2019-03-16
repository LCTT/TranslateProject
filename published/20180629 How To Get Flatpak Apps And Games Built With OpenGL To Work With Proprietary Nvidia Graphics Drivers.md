[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Get Flatpak Apps And Games Built With OpenGL To Work With Proprietary Nvidia Graphics Drivers)
[#]: via: (https://www.linuxuprising.com/2018/06/how-to-get-flatpak-apps-and-games-built.html)
[#]: author: (Logix https://plus.google.com/118280394805678839070)

如何使得支持 OpenGL 的 Flatpak 应用和游戏在专有 Nvidia 图形驱动下工作
======
> 一些支持 OpenGL 并打包为 Flatpak 的应用和游戏无法使用专有 Nvidia 驱动启动。本文将介绍如何在不安装开源驱动（Nouveau）的情况下启动这些 Flatpak 应用或游戏。

![](https://2.bp.blogspot.com/-A6PQn0xS7t8/WzYZDH6L_cI/AAAAAAAAAyE/ZBHroHnrY1scqo-dhSRV3YapO4OeBJlOQCLcBGAs/s1600/flatpak.png)

这有个例子。我在我的 Ubuntu 18.04 桌面上使用专有的 Nvidia 驱动程序 （`nvidia-driver-390`），当我尝试启动以 Flatpak 形式安装的最新版本 [Krita 4.1][2] （构建了 OpenGL 支持）时，显示了如下错误：

```
$ /usr/bin/flatpak run --branch=stable --arch=x86_64 --command=krita --file-forwarding org.kde.krita
Gtk-Message: Failed to load module "canberra-gtk-module"
Gtk-Message: Failed to load module "canberra-gtk-module"
libGL error: No matching fbConfigs or visuals found
libGL error: failed to load driver: swrast
Could not initialize GLX
```

[Winepak][3] 游戏（以 Flatpak 方式打包的绑定了 Wine 的 Windows 游戏）似乎也受到了这个问题的影响，这个问题从 2016 年出现至今。

要修复使用 OpenGL 和专有 Nvidia 图形驱动时无法启动的 Flatpak 游戏和应用的问题，你需要为已安装的专有驱动安装一个运行时环境。以下是步骤。

1、如果尚未添加 FlatHub 仓库，请添加它。你可以在[此处][1]找到针对 Linux 发行版的说明。

2、现在，你需要确定系统上安装的专有 Nvidia 驱动的确切版本。

_这一步取决于你使用的 Linux 发行版，我无法涵盖所有​​情况。下面的说明是面向 Ubuntu（以及 Ubuntu 风格的版本），但希望你可以自己弄清楚系统上安装的 Nvidia 驱动版本。_

要在 Ubuntu 中执行此操作，请打开 “软件与更新”，切换到 “附加驱动” 选项卡并记下 Nvidia 驱动包的名称。

比如，你可以看到我的是 “nvidia-driver-390”：

![](https://1.bp.blogspot.com/-FAfjtGNeUJc/WzYXMYTFBcI/AAAAAAAAAx0/xUhIO83IAjMuK4Hn0jFUYKJhSKw8y559QCLcBGAs/s1600/additional-drivers-nvidia-ubuntu.png)

这里还没完成。我们只是找到了 Nvidia 驱动的主要版本，但我们还需要知道次要版本。要获得我们下一步所需的确切 Nvidia 驱动版本，请运行此命令（应该适用于任何基于 Debian 的 Linux 发行版，如 Ubuntu、Linux Mint 等）：

```
apt-cache policy NVIDIA-PACKAGE-NAME
```

这里的 “NVIDIA-PACKAGE-NAME” 是 “软件与更新” 中列出的 Nvidia 驱动包名称。例如，要查看 “nvidia-driver-390” 包的确切安装版本，请运行以下命令：

```
$ apt-cache policy nvidia-driver-390
nvidia-driver-390:
  Installed: 390.48-0ubuntu3
  Candidate: 390.48-0ubuntu3
  Version table:
 *** 390.48-0ubuntu3 500
        500 http://ro.archive.ubuntu.com/ubuntu bionic/restricted amd64 Packages
        100 /var/lib/dpkg/status
```

在这个命令的输出中，查找 “Installed” 部分并记下版本号（不包括 “-0ubuntu3” 之类）。现在我们知道了已安装的 Nvidia 驱动的确切版本（我例子中的是 “390.48”）。记住它，因为下一步我们需要。

3、最后，你可以从 FlatHub 为你已安装的专有 Nvidia 图形驱动安装运行时环境。

要列出 FlatHub 上所有可用的 Nvidia 运行时包，你可以使用以下命令：

```
flatpak remote-ls flathub | grep nvidia
```

幸运地是 FlatHub 上提供这个 Nvidia 驱动的运行时环境。你现在可以使用以下命令继续安装运行时：

针对 64 位系统：

```
flatpak install flathub org.freedesktop.Platform.GL.nvidia-MAJORVERSION-MINORVERSION
```

将 “MAJORVERSION” 替换为 Nvidia 驱动的主要版本（在上面的示例中为 390），将 “MINORVERSION” 替换为次要版本（步骤2，我例子中的为 48）。

例如，要为 Nvidia 图形驱动版本 390.48 安装运行时，你必须使用以下命令：

```
flatpak install flathub org.freedesktop.Platform.GL.nvidia-390-48
```

对于 32 位系统（或能够在 64 位上运行 32 位的应用或游戏），使用以下命令安装 32 位运行时：

```
flatpak install flathub org.freedesktop.Platform.GL32.nvidia-MAJORVERSION-MINORVERSION
```

再说一次，将 “MAJORVERSION” 替换为 Nvidia 驱动的主要版本（在上面的示例中为 390），将 “MINORVERSION” 替换为次要版本（步骤2，我例子中的为 48）。

比如，要为 Nvidia 图形驱动版本 390.48 安装 32 位运行时，你需要使用以下命令：

```
flatpak install flathub org.freedesktop.Platform.GL32.nvidia-390-48
```

以上就是你要运行支持 OpenGL 的 Flatpak 的应用或游戏的方法。

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/06/how-to-get-flatpak-apps-and-games-built.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://flatpak.org/setup/
[2]:https://www.linuxuprising.com/2018/06/free-painting-software-krita-410.html
[3]:https://www.linuxuprising.com/2018/06/winepak-is-flatpak-repository-for.html
[4]:https://github.com/winepak/applications/issues/23
[5]:https://github.com/flatpak/flatpak/issues/138
