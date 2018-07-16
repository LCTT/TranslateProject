Ubuntu 每日贴士- Skype小更新，修复64位系统上PulseAudio问题
================================================================================
Skype最近为Linux系统发布了一个小更新，包括在Ubuntu上修复PulseAudio 3.x 和 4.x 的音频噪声问题，解决由于缺失libasound2-plugins:i386和其他导致在Ubuntu/Debian 64位系统上的崩溃。

如果你正在Ubuntu上使用Skype，你也许想要升级来获取这些修复。这个版本除了解决这些问题没有其他新的。

这是根据changelog的完整修复列表。

- **临时解决**  PulseAudio 3.x 和 4.x 音频噪声问题。
- **Bug 修复** 在打开不带表情符号的聊天时的崩溃。
- **Bug 修复** 由于缺失libasound2-plugins:i386依赖而导致的在Ubuntu/Debian 64位系统上不正常崩溃。
- **Bug 修复** 一些拨号面板数字不能正常工作。

对于Ubuntu用户,这里是如何更新。

如果你已经安装了Skype,你要在更新前先卸载它因为它会也许会创建与当前安装冲突的文件。

要从Ubuntu移除Skype,在终端上运行命令。

    sudo apt-get autoremove --purge skype

在卸载完Skype,进入[Skype 下载界面][1]并获取最新的Ubuntu下的版本。保存下载并在Ubuntu软件中心打开它。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/skypeubuntuupgrade.png)

因为软件中心必须下载额外的Skype包,安装也许会花费一些时间,请耐心等待。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/skypeubuntuupgrade1.png)

如果你通过软件中心安装Skype时遇到了问题,进入下载文件夹并运行下面的命令来强制按照下面的命令安装Skype。

    sudo dpkg -i skype-ubuntu*.deb; sudo apt-get -f install

安装完Skype后,进入Unity 面板并运行此时最新的4.2.0.14版本。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/skypeubuntuupgrade2.png)

就是这样!享受吧!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-skype-minor-update-fixes-pulseaudio-64-bit-issues/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.skype.com/en/download-skype/skype-for-computer/
