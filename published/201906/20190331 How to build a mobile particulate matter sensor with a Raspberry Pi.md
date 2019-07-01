[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10939-1.html)
[#]: subject: (How to build a mobile particulate matter sensor with a Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/mobile-particulate-matter-sensor)
[#]: author: (Stephan Tetzel https://opensource.com/users/stephan)

如何用树莓派搭建一个颗粒物传感器
======

> 用树莓派、一个廉价的传感器和一个便宜的屏幕监测空气质量。

![](https://img.linux.net.cn/data/attachment/album/201906/05/005121bbveeavwgyc1i1gk.jpg)

大约一年前，我写了一篇关于如何使用树莓派和廉价传感器测量[空气质量][2]的文章。我们这几年已在学校里和私下使用了这个项目。然而它有一个缺点：由于它基于无线/有线网，因此它不是便携的。如果你的树莓派、你的智能手机和电脑不在同一个网络的话，你甚至都不能访问传感器测量的数据。 

为了弥补这一缺陷，我们给树莓派添加了一块小屏幕，这样我们就可以直接从该设备上读取数据。以下是我们如何为我们的移动细颗粒物传感器搭建并配置好屏幕。

### 为树莓派搭建好屏幕

在[亚马逊][3]、阿里巴巴以及其它来源有许多可以买到的树莓派屏幕，从 ePaper 屏幕到可触控 LCD。我们选择了一个便宜的带触控功能且分辨率为 320*480 像素的[3.5英寸 LCD][3]，可以直接插进树莓派的 GPIO 引脚。3.5 英寸屏幕和树莓派几乎一样大，这一点不错。

当你第一次启动屏幕打开树莓派的时候，会因为缺少驱动屏幕会保持白屏。你得首先为屏幕安装[合适的驱动][5]。通过 SSH 登入并执行以下命令：

```
$ rm -rf LCD-show
$ git clone <https://github.com/goodtft/LCD-show.git>
$ chmod -R 755 LCD-show
$ cd LCD-show/
```

为你的屏幕执行合适的命令以安装驱动。例如这是给我们 MPI3501 型屏幕的命令：

```
$ sudo ./LCD35-show
```

这行命令会安装合适的驱动并重启树莓派。

### 安装 PIXEL 桌面并设置自动启动

以下是我们想要我们项目能够做到的事情：如果树莓派启动，我们想要展现一个有我们空气质量测量数据的网站。

首先，安装树莓派的[PIXEL 桌面环境][6]：

```
$ sudo apt install raspberrypi-ui-mods
```

然后安装 Chromium 浏览器以显示网站：

```
$ sudo apt install chromium-browser
```

需要自动登录以使测量数据在启动后直接显示；否则你将只会看到登录界面。然而树莓派用户并没有默认设置好自动登录。你可以用 `raspi-config` 工具设置自动登录：

```
$ sudo raspi-config
```

在菜单中，选择：“3 Boot Options → B1 Desktop / CLI → B4 Desktop Autologin”。

在启动后用 Chromium 打开我们的网站这块少了一步。创建文件夹 `/home/pi/.config/lxsession/LXDE-pi/`：

```
$ mkdir -p /home/pi/config/lxsession/LXDE-pi/
```

然后在该文件夹里创建 `autostart` 文件:

```
$ nano /home/pi/.config/lxsession/LXDE-pi/autostart
```

并粘贴以下代码：

```
#@unclutter
@xset s off
@xset -dpms
@xset s noblank

# Open Chromium in Full Screen Mode
@chromium-browser --incognito --kiosk <http://localhost>
```

如果你想要隐藏鼠标指针，你得安装 `unclutter` 包并移除 `autostart` 文件开头的注释。

```
$ sudo apt install unclutter
```

![移动颗粒物传感器][7]

我对去年的代码做了些小修改。因此如果你之前搭建过空气质量项目，确保用[原文章][2]中的指导为 AQI 网站重新下载脚本和文件。

通过添加触摸屏，你现在拥有了一个便携的颗粒物传感器！我们在学校用它来检查教室里的空气质量或者进行比较测量。使用这种配置，你无需再依赖网络连接或 WLAN。你可以在任何地方使用这个小型测量站——你甚至可以使用移动电源以摆脱电网。

* * *

这篇文章原来在<ruby>[开源学校解决方案][8]<rt>Open Scool Solutions</rt></ruby>上发表，获得许可重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/mobile-particulate-matter-sensor

作者：[Stephan Tetzel][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stephan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://linux.cn/article-9620-1.html
[3]: https://www.amazon.com/gp/search/ref=as_li_qf_sp_sr_tl?ie=UTF8&tag=openschoolsol-20&keywords=lcd%20raspberry&index=aps&camp=1789&creative=9325&linkCode=ur2&linkId=51d6d7676e10d6c7db203c4a8b3b529a
[4]: https://amzn.to/2CcvgpC
[5]: https://github.com/goodtft/LCD-show
[6]: https://linux.cn/article-8459-1.html
[7]: https://opensource.com/sites/default/files/uploads/mobile-aqi-sensor.jpg (Mobile particulate matter sensor)
[8]: https://openschoolsolutions.org/mobile-particulate-matter-sensor/

