[#]: collector: (lujun9972)
[#]: translator: (Starryi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14159-1.html)
[#]: subject: (Create your own video streaming server with Linux)
[#]: via: (https://opensource.com/article/19/1/basic-live-video-streaming-server)
[#]: author: (Aaron J.Prisk https://opensource.com/users/ricepriskytreat)

使用 OBS 搭建视频流媒体服务器
======

> 在 Linux 或 BSD 操作系统上设置基本的实时流媒体服务器。

![](https://img.linux.net.cn/data/attachment/album/202201/08/102934r2qpr1rlkpjb1pwb.jpg)

实时视频流越来越流行。亚马逊的 Twitch 和谷歌的 YouTube 等平台拥有数百万用户，这些用户消磨了无数小时的来观看直播和录制视频。这些视频服务通常可以免费使用，但需要你拥有一个帐户，并且一般会将你的视频内容隐藏在广告中。有些人不希望他们的视频提供给大众观看，或者想更多地控制自己的视频内容。幸运的是，借助强大的开源软件，任何人都可以设置直播服务器。

### 入门

在本教程中，我将说明如何使用 Linux 或 BSD 操作系统设置基本的实时流媒体服务器。

搭建实时流媒体服务器不可避免地提到系统需求问题。这些需求多种多样，因为实时流媒体涉及许多因素，例如：

  * **流媒体质量：** 你想以高清流媒体播放还是标清视频就可以满足你的需求？
  * **收视率：** 你的视频预计有多少观众？
  * **存储：** 你是否打算保留已保存的视频流副本？
  * **访问：** 你的视频流是私有的还是向全世界开放的？

在硬件要求方面没有固定规则，因此我建议你进行测试，以便找到最适合你需求的配置。本项目中，我将服务器安装在配有 4GB 内存、20GB 硬盘空间和单个 Intel i7 处理器内核的虚拟机上。

本项目使用<ruby>实时消息传递协议<rt>Real-Time Messaging Protocol</rt></ruby>（RTMP）来处理音频和视频流。当然还有其他协议可用，但我选择 RTMP 是因为它具有广泛的支持。鉴于像 WebRTC 这样的开放标准变得更加兼容，我比较推荐这条路线。

同样重要的是，要明白“实时”并不总是意味着即时。视频流必须经过编码、传输、缓冲和显示，这通常会增大延迟。延迟可以被缩短或延长，具体取决于你创建的流类型及其属性。

### 设置 Linux 服务器

你可以使用许多不同的 Linux 发行版，但我更喜欢 Ubuntu，因此我下载了 [Ubuntu 服务器版][1] 作为我的操作系统。如果你希望你的服务器具有图形用户界面（GUI），请随意使用 [Ubuntu 桌面版][2] 或其多种风味版本之一。然后，我在我的计算机或虚拟机上启动了 Ubuntu 安装程序，并选择了最适合我的环境的设置。以下是我采取的步骤。

注意：因为这是一个服务器，你可能需要设置静态网络。

![](https://opensource.com/sites/default/files/uploads/stream-server_profilesetup.png)

安装程序完成并重新启动系统后，你会看到一个可爱的新 Ubuntu 系统。 与任何新安装的操作系统一样，安装任何可用的更新：

```
sudo apt update
sudo apt upgrade
```

这个流媒体服务器将使用非常强大通用的 Nginx 网络服务器，所以你需要安装它：

```
sudo apt install nginx
```

然后你需要获取 RTMP 模块，以便 Nginx 可以处理你的媒体流：

```
sudo add-apt-repository universe
sudo apt install libnginx-mod-rtmp
```

修改你的网页服务器配置，使其能够接受和传送你的媒体流。

```
sudo nano /etc/nginx/nginx.conf
```

滚动到配置文件的底部并添加以下代码：

```
rtmp {
   server {
    listen 1935;
    chunk_size 4096;

    application live {
      live on;
      record off;
    }
  }
}
```

![](https://opensource.com/sites/default/files/uploads/stream-server_config.png)

保存配置。我是使用 [Nano][3] 来编辑配置文件的异端。在 Nano 中，你可以通过快捷键 `Ctrl+X`、`Y` 并按下回车来保存你的配置。

这么一个非常小的配置就可以创建一个可工作的流服务器。稍后你将添加更多内容到此配置中，但这是一个很好的起点。

在开始第一个流之前，你需要使用新配置重新启动 Nginx：

```
sudo systemctl restart nginx
```

### 设置 BSD 服务器

如果是“小恶魔”（LCTT 译者注：FreeBSD 的标志是一个拿着叉子的红色小恶魔）的信徒，那么建立并运行一个流媒体服务器也非常容易。

前往 [FreeBSD][4] 网站并下载最新版本。在你的计算机或虚拟机上启动 FreeBSD 安装程序，然后执行初始步骤并选择最适合你环境的设置。由于这是一个服务器，你可能需要设置静态网络。

在安装程序完成并重新启动系统后，你应该就拥有了一个闪亮的新 FreeBSD 系统。像任何其他新安装的系统一样，你可能希望更新所有内容（从这一步开始，请确保你以 root 身份登录）：

```
pkg update
pkg upgrade
```

安装 [Nano][3] 来编辑配置文件：

```
pkg install nano
```

这个流媒体服务器将使用非常强大通用的 Nginx 网络服务器。 你可以使用 FreeBSD 所拥有的优秀 ports 系统来构建 Nginx。

首先，更新你的 ports 树：

```
portsnap fetch
portsnap extract
```

进入 Nginx ports 目录：

```
cd /usr/ports/www/nginx
```

运行如下命令开始构建 Nginx：

```
make install
```

你将看到一个屏幕，询问你的 Nginx 构建中要包含哪些模块。对于这个项目，你需要添加 RTMP 模块。向下滚动直到选中 RTMP 模块，并按下空格键。然后按回车键继续剩下的构建和安装。

Nginx 安装完成后，就该为它配置流式传输了。

首先，在 `/etc/rc.conf` 中添加一个条目以确保 Nginx 服务器在系统启动时启动：

```
nano /etc/rc.conf
```

将此文本添加到文件中：

```
nginx_enable="YES"
```

![](https://opensource.com/sites/default/files/uploads/stream-server_streamingconfig.png)

接下来，创建一个网站根目录，Nginx 将从中提供其内容。我自己的目录叫 `stream`：

```
cd /usr/local/www/
mkdir stream
chmod -R 755 stream/
```

现在你已经创建了你的流目录，通过编辑配置文件来配置 Nginx：

```
nano /usr/local/etc/nginx/nginx.conf
```

在文件顶部加载你的流媒体模块：

```
load_module /usr/local/libexec/nginx/ngx_stream_module.so;
load_module /usr/local/libexec/nginx/ngx_rtmp_module.so;
```

![](https://opensource.com/sites/default/files/uploads/stream-server_modules.png)

在 `Server` 部分下，更改 `root` 位置以匹配你之前创建的目录位置：

```nginx
Location / {
  root /usr/local/www/stream
}
```

![](https://opensource.com/sites/default/files/uploads/stream-server_webroot.png)

最后，添加你的 RTMP 设置，以便 Nginx 知道如何处理你的媒体流：

```
rtmp {
  server {
    listen 1935;
    chunk_size 4096;
    
    application live {
      live on;
      record off;
    }
  }
}
```

保存配置。在 Nano 中，你可以通过快捷键 `Ctrl+X`、`Y`，然后按回车键来执行此操作。

如你所见，这么一个非常小的配置将创建一个工作的流服务器。稍后，你将添加更多内容到此配置中，但这将为你提供一个很好的起点。

但是，在开始第一个流之前，你需要使用新配置重新启动 Nginx：

```
service nginx restart
```

### 设置你的流媒体软件

#### 使用 OBS 进行广播

现在你的服务器已准备好接受你的视频流，是时候设置你的流媒体软件了。本教程使用功能强大的开源的 Open Broadcast Studio（OBS）。

前往 [OBS 网站][5]，找到适用于你的操作系统的版本并安装它。OBS 启动后，你应该会看到一个首次运行向导，该向导将帮助你使用最适合你的硬件的设置来配置 OBS。

![](https://opensource.com/sites/default/files/uploads/stream-server_autoconfig.png)

OBS 没有捕获任何内容，因为你没有为其提供源。在本教程中，你只需为流捕获桌面。单击“<ruby>来源<rt>Source</rt></ruby>”下的 “+” 按钮，选择“<ruby>显示捕获<rt>Screen Capture</rt></ruby>”，然后选择要捕获的桌面。

单击“<ruby>确定<rt>OK</rt></ruby>”，你应该会看到 OBS 镜像了你的桌面。

现在可以将你新配置的视频流发送到你的服务器了。在 OBS 中，单击“<ruby>文件 > 设置<rt>File > Settings</rt></ruby>”。 单击“<ruby>流<rt>Stream</rt></ruby>”部分，并将“<ruby>串流类型<rt>Stream Type</rt></ruby>” 设置为“<ruby>自定义流媒体服务器<rt>Custom Streaming Server</rt></ruby>”。

在 URL 框中，输入前缀 `rtmp://` 后跟流媒体服务器的 IP 地址，后跟 `/live`。例如，`rtmp://IP-ADDRESS/live`。

接下来，你可能需要输入“<ruby>串流密钥<rt>Stream key</rt></ruby>”，这是观看你的流所需的特殊标识符。 在“<ruby>串流密钥<rt>Stream key</rt></ruby>”框中输入你想要（并且可以记住）的任何关键词。

![](https://opensource.com/sites/default/files/uploads/stream-server_streamkey.png)

单击“<ruby>应用<rt>Apply</rt></ruby>”，然后单击“<ruby>确定<rt>OK</rt></ruby>”。

现在 OBS 已配置为将你的流发送到你的服务器，你可以开始你的第一个视频流。 单击“<ruby>开始推流<rt>Start Streaming</rt></ruby>”。 

如果一切正常，你应该会看到按钮更改为“<ruby>停止推流<rt>Stop Streaming</rt></ruby>”，并且在 OBS 的底部将出现一些带宽指标。

![](https://opensource.com/sites/default/files/uploads/stream-server_metrics.png)

如果你收到错误消息，请仔细检查 OBS 中的流设置是否有拼写错误。如果一切看起来都不错，则可能是另一个问题阻止了它的工作。

### 观看你的视频流

如果没有人观看，就说明直播视频不是很好，所以请成为你的第一个观众！

有许多支持 RTMP 的开源媒体播放器，但最著名的可能是 [VLC 媒体播放器][6]。

安装并启动 VLC 后，通过单击“<ruby>媒体 > 打开网络串流<rt>Media > Open Network Stream</rt></ruby>” 打开你的流。输入你的流的路径，添加你在 OBS 中设置的串流密钥，然后单击“<ruby>播放<rt>Play</rt></ruby>”。 例如，`rtmp://IP-ADDRESS/live/SECRET-KEY`。

你现在应该可以看到自己的实时视频流了！

![](https://opensource.com/sites/default/files/uploads/stream-server_livevideo.png)

### 接下来要做什么？

本项目是一个非常简单的设置，可以让你开始工作。 以下是你可能想要使用的另外两个功能。

  * **限制访问：** 你可能想要做的下一件事情是限制对你服务器的访问，因为默认设置允许任何人与服务器之间进行流传输。有多种设置方法，例如操作系统防火墙、[.htaccess 文件][7]，甚至使用 [STMP 模块中的内置访问控制][8]。
  * **录制流：** 这个简单的 Nginx 配置只会流传输而不会保存你的视频，但这很容易修改。在 Nginx 配置文件中的 RTMP 部分下，设置录制选项和要保存视频的位置。确保你设置的路径存在并且 Nginx 能够写入它。

    ```
    application live {
      live on;
      record all;
      record_path /var/www/html/recordings;
      record_unique on;
    }
    ```

实时流媒体的世界在不断发展，如果你对更高级的用途感兴趣，可以在互联网上找到许多其他很棒的资源。祝你好运，直播快乐！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/basic-live-video-streaming-server

作者：[Aaron J.Prisk][a]
选题：[lujun9972][b]
译者：[Starryi](https://github.com/Starryi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ricepriskytreat
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/download/server
[2]: https://www.ubuntu.com/download/desktop
[3]: https://www.nano-editor.org/
[4]: https://www.freebsd.org/
[5]: https://obsproject.com/
[6]: https://www.videolan.org/vlc/index.html
[7]: https://httpd.apache.org/docs/current/howto/htaccess.html
[8]: https://github.com/arut/nginx-rtmp-module/wiki/Directives#access
