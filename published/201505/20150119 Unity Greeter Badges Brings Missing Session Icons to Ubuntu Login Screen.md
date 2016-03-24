‘Unity Greeter Badges’：将丢失的会话图标带回Ubuntu登录屏幕
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/unity-greeter-badges-750x321.jpg)

新出现在**Ubuntu 15.04中的一个软件包解决了我对Unity 欢迎屏的微词：像Cinnamon这样的其它Linux桌面会话没有徽章图标。**

我知道这有点吹毛求疵了；这只是对大多数人而言几乎毫无影响的视觉瑕疵罢了。但是这种不一致性时时刻刻缠绕着我，让我不胜其烦，因为Ubuntu的一些会话带有徽章图标，包括Unity、GNOME和KDE。而剩下的其它桌面环境，包括它自己的一些旁系产品，像Xubuntu，只会在会话切换列表和主用户界面显示了一个不能再简单的白点。

这些点点们造成的这种不一致性刺激着我的神经，即使它只是稍纵即逝，但这种刺激不仅仅来自设计，也来自可用性方面。标牌式的标志符号对于让我们知道我们即将登陆到哪个会话很有帮助。

例如，你能告诉我们这个是个什么会话呢？

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/what-session-is-this-750x247.jpg)

Budgie? 也许是 MATE? 也能是 Cinnamon……我必须点开它才能知道。

没有必要这样做啊。构建Unity Greeter，就是为了让桌面环境开发者能够部署徽章到欢迎屏幕中（有些确实这样做了）。但在许多情况下，像MATE，它的包来自上游的Debian，想要移植一个“Ubuntu专用的补丁包”不太可取，也不太可能。

### 一个解决方案出炉了 ###

一位有经验的Debian维护者[Doug Torrance][1]有了修复该可用性瑕疵的解决方案。与其依赖桌面制造者自己来添加品牌式徽章到他们的包中，与其给Ubuntu增加维护它的责任重担，Torrance还不如自己创建了一个独立的‘unity-greeter-badges’包来收容它们。

承担起了直接提供会话标志的假定责任后，该包确保能同时迎合新旧窗口管理器、会话和桌面。

在30个左右的桌面环境列表中，它为以下桌面捆绑了新的会话徽章：

- Xubuntu
- Cinnamon
- MATE
- Cairo-Dock
- Xmonad
- Awesome
- OpenBox
- Pantheon

最重要的是，‘**Unity-Greeter-Badges**’已经被Ubuntu 15.04收录进去。这就意味着Torrance的包将可以直接安装，不需要PPA，也不需要下载。没有像Unity Greeter一样成为核心包的一部分，它可以以更高效和更及时的方式更新新的图标。

如果你真运行着Ubuntu 15.04，在不久的将来，你就可以从软件中心获取并安装该包了。

不想等到15.04？Torrance已经为Ubuntu 14.04和Ubuntu 14.10用户做了个.deb安装器。

- [下载用于Ubuntu 14.04的unity-greeter-badges][2]
- [下载用于Ubuntu 14.10的unity-greeter-badges][3]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/01/unity-greeter-badges-brings-missing-session-icons-ubuntu-login-screen

作者：[Joey-Elijah Sneddon][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://launchpad.net/~profzoom
[2]:https://launchpad.net/~profzoom/+archive/ubuntu/misc/+files/unity-greeter-badges_0.1-0ubuntu1%7E201412111501%7Eubuntu14.04.1_all.deb
[3]:https://launchpad.net/~profzoom/+archive/ubuntu/misc/+files/unity-greeter-badges_0.1-0ubuntu1%7E201412111501%7Eubuntu14.10.1_all.deb
