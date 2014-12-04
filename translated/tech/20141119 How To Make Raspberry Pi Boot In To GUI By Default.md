如何让树莓派默认启动进入图形界面
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/raspberry_pi_gui.jpg)

我买树莓派已经有一段时间了，但是实话说我几乎还没有用它做过什么事情。自从我的Dell超级本送到Dell服务中心后（已经有数星期了），我再次开始使用树莓派作为替代。

我之前已经写过一篇[在Ubuntu中如何在SD卡上安装Raspbian系统][1]。我也重装了一次树莓派。第一次启动的时候我漏掉了一件事情就是设置图形界面。这样当我再次启动树莓派的时候，我直接进入了命令行。我该接下来如何运行Respbian图形界面呢？

### 设置Raspbian图形启动 ###

当你第一次安装Raspbian系统时，确实有一些选项需要你来配置，由于匆忙，我没有注意到这些，只是快速完成屏幕上的选项。如果你遇到了和我一样的情况，最终只是进入到了Raspbian操作系统的命令行界面，不要失望，因为设置树莓派以图形界面启动很容易。让我们看看该如何操作。

### 第一步: ###

当你在命令行时，以默认的用户名和密码登录（如果你没有修改过）。Raspbian的默认用户是pi，默认密码应该是raspberry。

#### 第二步: ####

当你登录后，运行下面的命令：

    sudo raspi-config

这条命令会打开树莓派的配置，就像我们第一次启动看到的那样。

#### 第三步: ####

在这个配置界面下， 寻找**Enable Boot to Desktop/Scratch**这个选项。用箭头、tab和/或者回车键的组合来选中它（我忘记使用的是哪些了）。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Raspbian_Gui_setup.jpg)

#### 第四步: ####

下一屏中，选择** Desktop Login as user ‘Pi’ at the graphical desktop. **

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Raspbian_Gui_setup_1.jpg)

#### 第五步: ####

接下来你会被要求重启。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Raspbian_Gui_setup_2.jpg)

下次启动后，你会登录到LXDE桌面环境。接下来你就可以享受树莓派的图形界面了。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/raspbian-welcome-screen-gui.jpeg)

我希望这个教程能够帮助设置你的树莓派默认启动进入图形界面。欢迎在评论区留下你的问题和建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/raspberry-pi-gui-boot/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
