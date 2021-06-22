[#]: collector: (lujun9972)
[#]: translator: (this-is-name-right)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12448-1.html)
[#]: subject: (How to build a WiFi picture frame with a Raspberry Pi)
[#]: via: (https://opensource.com/article/19/2/wifi-picture-frame-raspberry-pi)
[#]: author: (Manuel Dewald https://opensource.com/users/ntlx)

如何用树莓派制作 WiFi 相框
======

> DIY一个数码相框，图片流来自云端。

![](https://img.linux.net.cn/data/attachment/album/202007/24/212836agkae2776gude1cb.jpg)

数码相框真的很好，因为它可以让你查看你自己的相片而不必打印出来。更棒的是，当你想要展示一张新的相片的时候，增加和删除数字图片要比打开传统的相框然后替换里面的相框更简单。不过，这还是需要一点手动的操作，比如从数字相框取出 SD 卡、U 盘或者其他的存储介质，然后把存储介质接入电脑，接着再复制图片进入存储介质。

一个更简单的选项是数字相框通过 WiFi 获得图片，例如从云端服务器获得。下面就是如何制作这样的一个数字相框。

### 需要使用的材料

  * 老式 [TFT][1] 的 LCD 显示屏
  * HDMI 到 DVI 的转接线（因为 TFT 屏幕支持 DVI）
  * 树莓派 3
  * Micro SD 卡
  * 树莓派的电源
  * 键盘
  * 鼠标（可选）

使用线缆连接树莓派到显示器，并连接电源。

### 安装 Raspbian

按照以下[指示][2]下载并将 Raspbian 烧录到 Micro SD 卡中。将 Micro SD 卡插入树莓派，启动它，并配置你的 WiFi。在安装完 Raspbian 后，我的第一个操作通常是运行 `sudo raspi-config`。在那里，我在网络选项中更改主机名（例如，改为 `picframe`），并在接口选项中启用 SSH 以远程连接到树莓派。使用（例如）`ssh pi@picframe` 连接到树莓派。

### 建立并安装云客户端

我使用 [Nextcloud][3] 来同步我的图片，但是你可以使用 NFS、[Dropbox][4]，或者其他的适合你的需求的方式上传图片到相框。

如果你使用 Nextcloud，请按照[以下说明][5]在 Raspbian 上安装客户端。这可以很方便的放图片到你的相框，并且你可能很熟悉安装在台式机的这个客户端应用。当连接客户端到 Nextcloud 服务器上的时候，请确保只选择存储你要在相框上显示的图片的文件夹。

### 设置幻灯片放映

我发现设置幻灯片放映最简单的方式是使用一个专门为这个目的建立的[轻量级的幻灯片项目][6]。还有一些备用方案，像是配置屏保，这个应用似乎是最最简单设置幻灯片放映的方式了。

在你的树莓派上下载最新的二进制程序，解包并移动到一个可执行的文件夹里：

```
wget https://github.com/NautiluX/slide/releases/download/v0.9.0/slide_pi_stretch_0.9.0.tar.gz
tar xf slide_pi_stretch_0.9.0.tar.gz
mv slide_0.9.0/slide /usr/local/bin/
```

安装依赖关系：

```
sudo apt install libexif12 qt5-default
```

通过执行下面的命令播放幻灯片（不要忘记修改图片的路径）。如果你通过 SSH 访问你树莓派，设置 `DISPLAY` 变量来在连接到树莓派显示屏上开始播放幻灯片。

```
DISPLAY=:0.0 slide -p /home/pi/nextcloud/picframe
```

### 自动播放幻灯片

为了在 Raspbian Stretch 上自动播放幻灯片，建立如下的文件夹并且添加一个 `autostart` 文件到里面：

```
mkdir -p /home/pi/.config/lxsession/LXDE/
vi /home/pi/.config/lxsession/LXDE/autostart
```

在文件中输入如下的命令来自动开启幻灯片。`slide` 命令可以调整到你需要的地方：

```
@xset s noblank
@xset s off
@xset -dpms
@slide -p -t 60 -o 200 -p /home/pi/nextcloud/picframe
```

禁止屏幕空白，树莓派通常会在 10 分钟后这样做，通过编辑下面的文件修改：

```
vi /etc/lightdm/lightdm.conf
```

添加这两行到文件末尾：

```
[SeatDefaults]
xserver-command=X -s 0 -dpms
```

### 配置上电时间

你可以安排你的相框什么时候打开和关闭通过使用两个简单的定时任务。例如，你想在上午 7 点自动打开，在晚上 11 点自动关闭。运行 `crontab -e` 并且输入下面的两行：

```
0 23 * * * /opt/vc/bin/tvservice -o
0 7 * * * /opt/vc/bin/tvservice -p && sudo systemctl restart display-manager
```

注意这不会打开或关闭树莓派的电源；这只会关闭 HDMI，它会关闭屏幕。第一行命令将在晚上 11 点关闭 HDMI。第二行将在早上 7 点打开显示屏并重启显示器管理器。

### 附言

通过这些简单的步骤，你创建了你自己 WiFi 相框。如果你想要让它更好看，为显示屏做一个木质相框吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/wifi-picture-frame-raspberry-pi

作者：[Manuel Dewald][a]
选题：[lujun9972][b]
译者：[this-is-name-right](https://github.com/this-is-name-right)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ntlx
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Thin-film-transistor_liquid-crystal_display
[2]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[3]: https://nextcloud.com/
[4]: http://dropbox.com/
[5]: https://github.com/nextcloud/client_theming#building-on-debian
[6]: https://github.com/NautiluX/slide/releases/tag/v0.9.0
