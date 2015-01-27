Ubuntu中跟踪多个时区的简捷方法
================================================================================
![date-time](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/date-time.jpg)

**我是否要确保在我醒来时或者安排与*山姆陈*，Ohso的半个开发商，进行Skype通话时，澳大利亚一个关于Chromebook销售的推特已经售罄，我大脑同时在多个时区下工作。**

那里头有个问题，如果你认识我，你会知道我的脑容量也就那么丁点，跟金鱼差不多，里头却塞着像Windows Vista这样一个臃肿货（也就是，不是很好）。我几乎记不得昨天之前的事情，更记不得我的门和金门大桥脚之间的时间差！

作为臂助，我使用一些小部件和菜单项来让我保持同步。在我常规工作日的空间里，我在多个操作系统间游弋，涵盖移动系统和桌面系统，但只有一个让我最快速便捷地设置“世界时钟”。

**而它刚好是那个名字放在门上方的东西。**

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/timezones-300x180.jpg)

### 添加世界时钟到Ubuntu日期/时间小应用 ###

Unity中默认的日期-时间指示器提供了添加并查看多个时区的支持，不需要附加组件，不需要额外的包。

1. 点击时钟小应用，然后uxuanze‘**时间和日期设置**’条目
1. 在‘**时钟**’标签中，选中‘**其它位置的时间**’选框
1. 点击‘**选择位置**’按钮
1. 点击‘**+**’，然后输入位置名称那个

#### 其它桌面环境 ####

**KDE Plasma**中默认的时钟小应用有类似的功能，其它功能如下：

1. 在数字时钟小部件上右击，然后选择‘**数字时钟设置**’
1. 点击‘**时区**’项
1. 在搜索区输入城市名
1. 点击‘**确定**’

**GNOME Shell**的可扩展特性可以看到有许多世界时钟选项可用，可以用它的默认时间表填补左边的空白，我个人喜欢‘[多个时钟][1]’。对于**Cinnamon**桌面而言也是一样的，它的‘面板小部件’仓库有丰富的可选部件，如超级顺滑的“**世界时钟日历**”。

![World Clock Calendar in Cinnamon 2.4](http://www.omgubuntu.co.uk/wp-content/uploads/2014/12/cinnamon-applet.jpg)

Cinnamon 2.4中的世界时钟日历

**XFCE**和**LXDE**就不那么慷慨了，除了自带的“工作区”作为**多个时钟**添加到面板外，每个都需要手动配置以指定位置。两个都支持‘指示器小部件’，所以，如果你没有依赖于Unity，你可以安装/添加单独的日期/时间指示器。

**Budgie**还刚初出茅庐，不足以胜任角落里的需求，因为Pantheon我还没试过——希望你们通过评论来让我知道得更多。

#### Desktop Apps, Widgets & Conky Themes桌面应用、不见和Conky主题 ####

当然，面板小部件只是收纳其它国家多个时区的一种方式。如果你不满意通过面板去访问，那里还有各种各样的**桌面应用**可供使用，其中许多都可以跨版本，甚至跨平台使用。

**GNOME时钟**就是这样一个应用，在Ubuntu 14.04 LTS及其后续版本中，你可以通过Ubuntu软件中心直接安装。**Conky**是一个很有潜力的备选（尽管我还没发现有哪个预制主题为此目的设计），而其它像[日历时钟][2]这样轻量级的Chrome应用可以在任何安装有Chrome这个免费浏览器的地方工作。

**你也关注时区吗？如果是，你使用什么应用、采用什么方法或者小部件让它显示在顶层呢？**

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/12/add-time-zones-world-clock-ubuntu

作者：[Joey-Elijah Sneddon][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://extensions.gnome.org/extension/605/multiclock/
[2]:http://www.omgchrome.com/calendar-clock-chrome-app/
