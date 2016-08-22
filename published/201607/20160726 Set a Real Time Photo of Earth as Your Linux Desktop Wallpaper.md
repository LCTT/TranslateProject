为你的 Linux 桌面设置一张实时的地球照片
=================================================================

![](http://www.omgubuntu.co.uk/wp-content/uploads/2016/07/Screen-Shot-2016-07-26-at-16.36.47-1.jpg)

厌倦了看同样的桌面背景了么？这里有一个（可能是）世界上最棒的东西。

‘[Himawaripy][1]’ 是一个 Python 3 小脚本，它会抓取由[日本 Himawari 8 气象卫星][2]拍摄的接近实时的地球照片，并将它设置成你的桌面背景。

安装完成后，你可以将它设置成每 10 分钟运行的定时任务（自然，它要在后台运行），这样它就可以实时地取回地球的照片并设置成背景了。

因为 Himawari-8 是一颗同步轨道卫星，你只能看到澳大利亚上空的地球的图片——但是它实时的天气形态、云团和光线仍使它很壮丽，对我而言要是看到英国上方的就更好了！

高级设置允许你配置从卫星取回的图片质量，但是要记住增加图片质量会增加文件大小及更长的下载等待！

最后，虽然这个脚本与其他我们提到过的其他脚本类似，它还仍保持更新及可用。

###获取 Himawaripy

Himawaripy 已经在一系列的桌面环境中都测试过了，包括 Unity、LXDE、i3、MATE 和其他桌面环境。它是自由开源软件，但是整体来说安装及配置不太简单。

在该项目的 [Github 主页][0]上可以找到安装和设置该应用程序的所有指导（提示：没有一键安装功能）。

- [实时地球壁纸脚本的 GitHub 主页][0]

### 安装及使用

![](http://www.omgubuntu.co.uk/wp-content/uploads/2016/07/Screen-Shot-2016-07-26-at-16.46.13-750x143.png)

一些读者请我在本文中补充一下一步步安装该应用的步骤。以下所有步骤都在其 GitHub 主页上，这里再贴一遍。

1、下载及解压 Himawaripy

这是最容易的步骤。点击下面的下载链接，然后下载最新版本，并解压到你的下载目录里面。

 - [下载 Himawaripy 主干文件（.zip 格式）][3]

2、安装 python3-setuptools

你需要手工来安装主干软件包，Ubuntu 里面默认没有安装它：

```
sudo apt install python3-setuptools
```

3、安装 Himawaripy

在终端中，你需要切换到之前解压的目录中，并运行如下安装命令：

```
cd ~/Downloads/himawaripy-master
sudo python3 setup.py install
```

4、 看看它是否可以运行并下载最新的实时图片：
```
himawaripy
```
5、 设置定时任务

如果你希望该脚本可以在后台自动运行并更新（如果你需要手动更新，只需要运行 ‘himarwaripy’ 即可）

在终端中运行：
```
crontab -e
```
在其中新加一行（默认每10分钟运行一次）
```
*/10 * * * * /usr/local/bin/himawaripy
```
关于[配置定时任务][4]可以在 Ubuntu Wiki 上找到更多信息。

该脚本安装后你不需要不断运行它，它会自动的每十分钟在后台运行一次。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2016/07/set-real-time-earth-wallpaper-ubuntu-desktop

作者：[JOEY-ELIJAH SNEDDON][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://plus.google.com/117485690627814051450/?rel=author
[1]: https://github.com/boramalper/himawaripy
[2]: https://en.wikipedia.org/wiki/Himawari_8
[0]: https://github.com/boramalper/himawaripy
[3]: https://github.com/boramalper/himawaripy/archive/master.zip
[4]: https://help.ubuntu.com/community/CronHowto