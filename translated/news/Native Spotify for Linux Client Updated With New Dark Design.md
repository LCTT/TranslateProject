本土化Spotify Linux客户端更新，添加新的黑色设计元素
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/spotify.jpg)

**Linux版本的Spotify得到了更新，这一次带着同上个月其他主流服务商对其应用的更加扁平和更加黑色化的设计。**

金属质感的灰色元素和白色清爽的条区设计形成了基于黑色和浅黑色的颜色设计方案。由于受旧时设计的限制，甚至这次新设计没有给该公司的green商标留出空间。

> ‘Spotify相关负责人说这种设计可以突出软件的内容’

在作曲家和个人资料条目中图片的设计上均采用了圆形的设计元素，并且在导航栏和播放控制按钮的地方采用了iOS 7风格。
Rounded elements have been introduced on artist and profile photos, while navigation and player controls buttons have been given iOS 7-style thin line makeovers.

Spotify官方说道这种设计风格突出了软件的内容，他们将之比作“*熄掉所有灯光的剧场。*”

除了吸引你眼球的这些改变，还有一些你可能错过的不易察觉的变化。这包括Open SSL 1.0.x的使用、使用*libavcodec54*来实现本地音乐重放以及播放曲目变化时对本地系统通知的调用支持。

现在，该软件已不再提供32位的版本。

如果长期处于预览阶段，Linux下的本土化Spotify客户端将**支持免费和订阅账户**。

### 安装Spotify ###

要在Ubuntu 14.04 LTS上安装Spotify，你可以打开terminal终端，然后输入下面的命令。

首先将Spotify官方的软件仓库添加到你的软件源列表中：

    sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'

添加该软件仓库的安全密钥来避免不必要的错误：

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

最后，更新并且安装Spotify：

    sudo apt-get update && sudo apt-get install spotify-client-qt

安装完成后就可以从Dash启动Spotify了。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/spotify-linux-preview-update-new-design

译者：[JonathanKang](https://github.com/JonathanKang) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
