Spotify 原生Linux客户端更新，暗黑风格来袭
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/spotify.jpg)

**继streaming service上个月在其它平台上发布它的应用之后，以同样的扁平化和黑色风格的设计，Linux版本的Spotify客户端也发布了更新。**

金属质感的灰色元素和白色清爽的条区设计形成了基于黑色的风格，以黑色和浅黑色的颜色为主。甚至公司的绿色的商标也不能幸免，以奇怪的颜色出现在各种地方。

在作曲家和个人资料条目中图片的设计上均采用了圆形的设计元素，并且在导航栏和播放控制按钮的地方采用了iOS 7风格。

Spotify官方说道这种设计风格突出了软件的内容，他们将之比作“*熄掉所有灯光的剧场。*”

除了吸引你眼球的这些改变，还有一些你可能错过的不易察觉的变化。这包括Open SSL 1.0.x的使用、使用*libavcodec54*来实现本地音乐重放以及播放曲目变化时对本地系统通知的调用支持。

现在，该软件已不再提供32位的版本。

由于长期处于预览阶段，Linux下的原生Spotify客户端**支持免费和订阅账户**。

### 安装Spotify ###

要在Ubuntu 14.04 LTS上安装Spotify，你可以打开终端，然后输入下面的命令。

首先将Spotify官方的软件仓库添加到你的软件源列表中：

    sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'

添加该软件仓库的安全密钥来避免不必要的错误：

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

最后，更新并且安装Spotify：

    sudo apt-get update && sudo apt-get install spotify-client-qt

安装完成后就可以从Dash启动Spotify了。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/spotify-linux-preview-update-new-design

译者：[JonathanKang](https://github.com/JonathanKang) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
