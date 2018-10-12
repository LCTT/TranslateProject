使用 Chrome 扩展将 YouTube 播放器控件添加到 Linux 桌面
======

一个我怀念的 Unity 功能（虽然只使用了一小段时间）是在 Web 浏览器中访问 YouTube 等网站时在 Ubuntu 声音指示器中自动出现播放器控件，因此你可以直接从顶部栏暂停或停止视频，以及浏览视频/歌曲信息和预览。

这个 Unity 功能已经消失很久了，但我正在为 Gnome Shell 寻找类似的东西，然后我遇到了 [browser-mpris2][1]，这是一个为 Google Chrome/Chromium 实现 MPRIS v2 接口的扩展，目前只支持 YouTube，我想可能会有一些读者会喜欢这个。

该扩展还适用于 Opera 和 Vivaldi 等基于 Chromium 的 Web 浏览器。

browser-mpris2 也支持 Firefox，但因为通过 `about:debugging` 加载扩展是临时的，而这是 browser-mpris2 所需要的，因此本文不包括 Firefox 的指导。开发人员[打算][2]将来将扩展提交到 Firefox 插件网站上。

使用此 Chrome 扩展，你可以在支持 MPRIS2 的 applets 中获得 YouTube 媒体播放器控件（播放、暂停、停止和查找
）。例如，如果你使用 Gnome Shell，你可将 YouTube 媒体播放器控件作为永久显示的控件，或者你可以使用 Media Player Indicator 之类的扩展来实现此目的。在 Cinnamon /Linux Mint with Cinnamon 中，它出现在声音 Applet 中。

我无法在 Unity 上用它，我不知道为什么。我没有在不同桌面环境（KDE、Xfce、MATE 等）中使用其他支持 MPRIS2 的 applet 尝试此扩展。如果你尝试过，请告诉我们它是否适用于你的桌面环境/支持 MPRIS2 的 applet。

以下是在使用 Gnome Shell 的 Ubuntu 18.04 并装有 Chromium 浏览器的[媒体播放器指示器][3]的截图，其中显示了有关当前正在播放的 YouTube 视频的信息及其控件（播放/暂停，停止和查找）：

![](https://1.bp.blogspot.com/-rsc4FpYBSrI/W3VtPphfdOI/AAAAAAAABXY/YfKV6pBncs0LAwTwYSS0tKRJADDfZDBfwCLcBGAs/s640/browser-mpris2-gnome-shell-sound-indicator.png)

在 Linux Mint 19 Cinnamon 中使用其默认声音 applet 和 Chromium 浏览器的截图：

![](https://2.bp.blogspot.com/-I2DuYetv7eQ/W3VtUUcg26I/AAAAAAAABXc/Tv-RemkyO60k6CC_mYUxewG-KfVgpFefACLcBGAs/s1600/browser-mpris2-cinnamon-linux-mint.png)

### 如何为 Google Chrom/Chromium安装 browser-mpris2

1、 如果你还没有安装 Git 就安装它

在 Debian/Ubuntu/Linux Mint 中，使用此命令安装 git：

```
sudo apt install git
```

2、 下载并安装 [browser-mpris2][1] 所需文件。

下面的命令克隆了 browser-mpris2 的 Git 仓库并将 chrome-mpris2 安装到 `/usr/local/bin/`（在一个你可以保存 browser-mpris2 文件夹的地方运行 `git clone ...` 命令，由于它会被 Chrome/Chromium 使用，你不能删除它）：

```
git clone https://github.com/otommod/browser-mpris2
sudo install browser-mpris2/native/chrome-mpris2 /usr/local/bin/
```

3、 在基于 Chrome/Chromium 的 Web 浏览器中加载此扩展。

![](https://3.bp.blogspot.com/-yEoNFj2wAXM/W3Vvewa979I/AAAAAAAABXo/dmltlNZk3J4sVa5jQenFFrT28ecklY92QCLcBGAs/s640/browser-mpris2-chrome-developer-load-unpacked.png)

打开 Goog​​le Chrome、Chromium、Opera 或 Vivaldi 浏览器，进入 Extensions 页面（在 URL 栏中输入 `chrome://extensions`），在屏幕右上角切换到“开发者模式”。然后选择 “Load Unpacked” 并选择 chrome-mpris2 目录（确保没有选择子文件夹）。

复制扩展 ID 并保存它，因为你以后需要它（它类似于这样：`emngjajgcmeiligomkgpngljimglhhii`，但它会与你的不一样，因此确保使用你计算机中的 ID！）。

4、 运行 `install-chrome.py`（在 `browser-mpris2/native` 文件夹中），指定扩展 id 和 chrome-mpris2 路径。

在终端中使用此命令（将 `REPLACE-THIS-WITH-EXTENSION-ID` 替换为上一步中 `chrome://extensions` 下显示的 browser-mpris2 扩展 ID）安装此扩展：

```
browser-mpris2/native/install-chrome.py REPLACE-THIS-WITH-EXTENSION-ID /usr/local/bin/chrome-mpris2
```

你只需要运行此命令一次，无需将其添加到启动或其他类似的地方。你在 Google Chrome 或 Chromium 浏览器中播放的任何 YouTube 视频都应显示在你正在使用的任何 MPRISv2 applet 中。你无需重启 Web 浏览器。

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/add-youtube-player-controls-to-your.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/otommod/browser-mpris2
[2]:https://github.com/otommod/browser-mpris2/issues/11
[3]:https://extensions.gnome.org/extension/55/media-player-indicator/
