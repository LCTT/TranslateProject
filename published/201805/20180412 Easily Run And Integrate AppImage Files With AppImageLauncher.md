使用 AppImageLauncher 轻松运行和集成 AppImage 文件
======

你有没有下载过 AppImage 文件，而你不知道如何使用它？或许你可能知道如何使用它，但是你每次要运行它时必须要进入到下载了该 .AppImage 的文件夹中来运行它，或者手动为其创建启动程序。

使用 AppImageLauncher，这些就都是过去的问题。该程序可让你轻松运行 AppImage 文件，而无需使其可执行。但它最有趣的特点是可以轻松地将 AppImage 与你的系统进行整合：AppImageLauncher 可以自动将 AppImage 程序快捷方式添加到桌面环境的程序启动器/菜单（包括程序图标和合适的说明）中。

这 里有个例子，我想在 Ubuntu 上使用 [Kdenlive][2]，但我不想从仓库中安装它，因为它有大量的 KDE 依赖，我不想把它们弄到我的 Gnome 系统中。因为没有它的 Flatpak 或 Snap 镜像，我只能去下载了 Kdenlive  的 AppImage。

在没有把下载的 [Kdenline][2] AppImage 变成可执行的情况下，我第一次双击它时（安装好了 AppImageLauncher），AppImageLauncher 提供了两个选项：

“Run once”或者“Integrate and run”。

![](https://3.bp.blogspot.com/-k1O4Bl3wuwU/Ws82wwzvEwI/AAAAAAAAALo/mTCmnEzFpmsmOz0BxH6ASOXIqc5jp63MwCLcBGAs/s1600/appimagelauncher_1.png)

点击 “Integrate and run”，这个 AppImage 就被复制到 `~/.bin/` （家目录中的隐藏文件夹）并添加到菜单中，然后启动该程序。

要删除它也很简单，只要您使用的桌面环境支持桌面动作就行。例如，在 Gnome Shell 中，只需右键单击“活动概览”中的应用程序图标，然后选择“Remove from system”：

![](https://1.bp.blogspot.com/--YONMK9mJyM/Ws825HZCpcI/AAAAAAAAALs/TJy9IVOjA0klMUqHQMOduserMTjmfT_tgCLcBGAs/s1600/appimagelauncher-remove-app.png)

更新：该应用只初步为 Ubuntu 和 Mint 做了开发，但它最近会提供 Debian、 Netrunner 和 openSUSE 支持。本文首次发布后添加的另一个功能是支持 AppImage 的更新；你在启动器中可以找到 “Update AppImage”。

### 下载 AppImageLauncher

AppImageLauncher 支持 Ubuntu、 Debian、Netrunner 和 openSUSE。如果你使用 Ubuntu 18.04，请确保你下载的 deb 包的名字中有“bionic”，而其它的 deb 是用于旧一些的 Ubuntu 版本的。

- [下载 AppImageLauncher][1]


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/04/easily-run-and-integrate-appimage-files.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/TheAssassin/AppImageLauncher/releases
[2]:https://kdenlive.org/download/
