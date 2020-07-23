[#]: collector: (lujun9972)
[#]: translator: (this-is-name-right)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to build a WiFi picture frame with a Raspberry Pi)
[#]: via: (https://opensource.com/article/19/2/wifi-picture-frame-raspberry-pi)
[#]: author: (Manuel Dewald https://opensource.com/users/ntlx)

如何用树莓派制作wifi相册
======
DIY一个数字相册，图片流来自云端。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-

images/raspberrypi_board_vector_red.png?itok=yaqYjYqI)

数字相册真的很好，因为它可以让你查看你自己的相片而不用去打印。更棒的是增加和删除数字图片要比打开传

统的相册然后替换里面的相册更简单，当你想要展示一张新的相片的时候。 即使是这样，这还是需要一点手动的

操作，比如从数字相册取出SD卡U盘或者其他的存储介质，然后把存储介质接入电脑，接着再复制图片进入存储

介质。

一个更简单的选项是数字相册通过wifi获得图片，例如从云端服务器获得。下面就是如何制作这样的一个数字相

册。

### 需要使用的材料

  * 老式[TFT][1]的LCD显示屏
  * HDMI到DVI的转接线（因为TFT屏幕支持DVI）
  * 树莓派3
  * Micro SD card
  * 树莓派的电源
  * 键盘
  * 鼠标（可选）



使用线缆连接树莓派到显示器并连接电源。

### 安装Raspbian

**sudo raspi-config**.在网络选项中改变主机名并且在接口选项中允许SSH为了在树莓派上远程工作。连接树莓派

（例如）。

### 建立并安装云客户端

按照这些[步骤][2]下载并将Raspbian复制到SD卡。将SD卡插入树莓派并启动它，然后配置你的wifi。我第一步完成

后Raspian安装程序一般正在运行。 至此我在网络选项中改变主机名并且在接口选项中允许SSH为了远程工作在树

莓派上。连接树莓派（例如）。

我使用[Nextcloud][3]来同步我的图片，但是你可以使用NFS，[Dropbox][4]，或者其他的什么适合你上传图片到相

册的。

 如果你使用Nextcloud按照[介绍][5]安装一个客户端。 这可以很方便的放一张图片到你的相册并且你可能很熟悉安

装在台式机的客户端应用。当连接客户端到Nextcloud服务器上的时候，确保你只选择一个文件夹，这个文件夹里

面存储了你想要显示在数字相册的图片。

### 设置幻灯片放映

我发现设置幻灯片放映最简单的方式是使用[轻量级幻灯片项目][6]，这个项目专门为这个目的。还有一些备用方

案像是配置屏保，这个方式是最最简单设置幻灯片放映的方式了。

在你的树莓派上下载最新的binaries，解包并移动到一个可执行的文件夹里：

```
wget https://github.com/NautiluX/slide/releases/download/v0.9.0/slide_pi_stretch_0.9.0.tar.gz
tar xf slide_pi_stretch_0.9.0.tar.gz
mv slide_0.9.0/slide /usr/local/bin/
```

安装依赖：

```
sudo apt install libexif12 qt5-default
```

通过执行下面的命令播放幻灯片（不要忘记修改图片的路径）。如果你通过SSH访问你树莓派，设置**DISPLAY**

变量来开启连接到树莓派显示屏上的幻灯片。

```
DISPLAY=:0.0 slide -p /home/pi/nextcloud/picframe
```

### 自动播放幻灯片

为了在Raspbian Stretch上自动播放幻灯片，建立如下的文件夹并且添加一个**autostart**文件到里面：

```
mkdir -p /home/pi/.config/lxsession/LXDE/
vi /home/pi/.config/lxsession/LXDE/autostart
```

输入如下的命令来自动开启幻灯片。**slide**命令可以调整到你需要的地方：

```
@xset s noblank
@xset s off
@xset -dpms
@slide -p -t 60 -o 200 -p /home/pi/nextcloud/picframe
```

禁止屏幕空白，树莓派通常会在10分钟后这样做，通过编辑下面的文件修改：

```
vi /etc/lightdm/lightdm.conf
```

添加这两行到文件末尾：

```
[SeatDefaults]
xserver-command=X -s 0 -dpms
```

### 配置上电时间

你可以安排你的相册什么时候打开和关闭通过使用两个简单的定时任务。例如，你想在7am自动打开在11pm自动

关闭。运行**crontab -e**并且输入下面的两行。

```
0 23 * * * /opt/vc/bin/tvservice -o
0 7 * * * /opt/vc/bin/tvservice -p && sudo systemctl restart display-manager
```

 注意这不会打开或侧关闭树莓派的电源；这只会关闭HDMI，当你想要关闭屏幕的时候。 第一行命令将关闭HDMI

在11pm。第二行将打开显示屏并重启显示器管理软件在7am。

### 添加一点最后的感触

通过这些简单的步骤，你可以你自己wifi相册。如果你想要让他更好看，为显示屏做一个木质相框。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/wifi-picture-frame-raspberry-pi

作者：[Manuel Dewald][a]
选题：[lujun9972][b]
译者：[this-is-name-right](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ntlx
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Thin-film-transistor_liquid-crystal_display
[2]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[3]: https://nextcloud.com/
[4]: http://dropbox.com/
[5]: https://github.com/nextcloud/client_theming#building-on-debian
[6]: https://github.com/NautiluX/slide/releases/tag/v0.9.0
