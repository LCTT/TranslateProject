修复 Ubuntu 14.04 从待机中唤醒后鼠标键盘出现僵死情况
=========

### 问题: ###

当Ubuntu14.04或14.10从睡眠和待机状态恢复时，鼠标和键盘出现僵死，不能点击也不能输入。解决这种情况是唯一方法就是按关机键强关系统，这不仅非常不便且令人恼火。因为在Ubuntu的默认情况中合上笔记本等同于切换到睡眠模式。

在这篇短文中，我们将学会如何解决Ubuntu14.04和14.10中出现的鼠标僵死问题。

### Ubuntu14.04唤醒后鼠标僵死的解决办法 ###

这个问题的是由内核升级导致的。为何导致这一情况不得而知，但是看起来好像仅需重装输入设备的驱动就能解决了。

    sudo apt-get install --reinstall xserver-xorg-input-all

这则贴士源自一个我们的读者Dev的提问。快试试这篇贴士，看看是否对你也有效。在一个类似的问题中，你可以[修复Ubuntu登录后无Unity界面、侧边栏和Dash的问题][1]。

--------------------------------------------------------------------------------

via: http://itsfoss.com/keyboard-mouse-freeze-suspend/

作者：[Abhishek][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/how-to-fix-no-unity-no-launcher-no-dash-in-ubuntu-12-10-quick-tip/