FreeTube：注重隐私的开源桌面 YouTube 播放器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Freetube-720x340.png)

你已经知道我们需要 Google 帐户才能订阅频道并从 YouTube 下载视频。如果你不希望 Google 追踪你在 YouTube 上的行为，那么有一个名为 **“FreeTube”** 的开源 Youtube 播放器。它能让你无需使用帐户观看、搜索和下载 Youtube 视频并订阅你喜爱的频道，这可以防止 Google 获取你的信息。它为你提供完整的无广告体验。另一个值得注意的优势是它有一个内置的基础的 HTML5 播放器来观看视频。由于我们没有使用内置的 YouTube 播放器，因此 Google 无法跟踪“观看次数”，也无法视频分析。FreeTube 只会发送你的 IP 详细信息，但这也可以通过使用 VPN 来解决。它是完全免费、开源的，可用于 GNU/Linux、Mac OS X 和 Windows。

### 功能

* 观看没有广告的视频。
* 防止 Google 使用 Cookie 或 JavaScript 跟踪你观看的内容。
* 无须帐户订阅频道。
* 本地存储订阅、历史记录和已保存的视频。
* 导入/备份订阅。
* 迷你播放器。
* 亮/暗的主题。
* 免费、开源。
* 跨平台。

### 安装 FreeTube

进入[发布页面][1]并根据你使用的操作系统获取版本。在本指南中，我将使用 **.tar.gz** 文件。

```
$ wget https://github.com/FreeTubeApp/FreeTube/releases/download/v0.1.3-beta/FreeTube-linux-x64.tar.xz
```

解压下载的归档：

```
$ tar xf FreeTube-linux-x64.tar.xz
```

进入 Freetube 文件夹：

```
$ cd FreeTube-linux-x64/
```

使用命令启动 Freeube：

```
$ ./FreeTub
```

这就是 FreeTube 默认界面的样子。

![][3]

### 用法

FreeTube 目前使用 **YouTube API** 搜索视频。然后，它使用 **Youtube-dl HTTP API** 获取原始视频文件并在基础的 HTML5 视频播放器中播放它们。由于订阅、历史记录和已保存的视频都存储在本地系统中，因此你的详细信息将不会发送给 Google 或其他任何人。

在搜索框中输入视频名称，然后按下回车键。FreeTube 会根据你的搜索查询列出结果。

![][4]

你可以点击任何视频来播放它。

![][5]

如果你想更改主题或默认 API、导入/导出订阅，请进入**设置**部分。

![][6]

请注意，FreeTube 仍处于 **beta** 阶段，所以仍然有 bug。如果有任何 bug，请在本指南最后给出的 GitHub 页面上报告。

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/freetube-an-open-source-desktop-youtube-player-for-privacy-minded-people/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/FreeTubeApp/FreeTube/releases
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-3.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-5-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/FreeTube-2.png
