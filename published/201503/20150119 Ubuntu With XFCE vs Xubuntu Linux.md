Ubuntu & XFCE vs Xubuntu
=========================================================

Ubuntu拥有漂亮的桌面体验以及强大的应用程序。Xubuntu轻量、快速并且可定制，哪个更适合你？

---------------------------------------------------------

![](http://f.tqn.com/y/linux/1/W/T/J/1/ubuntudesktop.png)

首先，这篇文章不是用来说明Ubuntu比Xubuntu更好或者Xubuntu比Ubuntu更好之类的东西。

并且，我同时也会在这篇文章中介绍Ubuntu用户如何获取基本的XFCE桌面，以及如何安装完整的Xubuntu桌面。

[Ubuntu][1]以及[Xubuntu][2]是针对不同目的开发的操作系统，为什么我会强调这一点，是为了说明什么时候或者为什么你应该使用Ubuntu或Xubuntu。

比较这两个操作系统就像比较[劳斯莱斯][3]与[保时捷][4]。这两个都是很棒的车，但是如果把劳斯莱斯给一个赛车迷，他们也许会卖掉它买个其他的车，同样，如果把保时捷给舒格勋爵或者休·海夫纳这类人可能也不那么合适。

Ubuntu拥有一个适用性很强的桌面环境，叫做Unity，并且默认会安装一些很棒的Linux应用程序，包括Rhythmbox以及[LibreOffic][5]。Ubuntu就像是劳斯莱斯。它为舒适而生，并且尽可能的提供满足需要的漂亮的解决方案。

作为一个Ubuntu用户，就像汽车里面的乘客。你在到达目的地的过程中就可以同时把事情搞定，并且所有的事看起来都很漂亮并且很简单。

另一方面，Xubuntu采用了轻量的[XFCE桌面环境][6]。内置的应用自然也是轻量级的，使用它们也可以完成工作，但是不像Ubuntu自带的应用那么完整。

XFCE桌面环境可以高度定制化，你可以把你的桌面搞成任何你想要的形式。

Xubuntu就像一个改装过的跑车。你可以把它改装成任何你想要的样子。但不是做为一名乘客，而更像是驾驶员开着它快速漂移过弯，或者小心翼翼的通过狭小的弯角。

如果你不关心如何美化或者定制桌面，并且你发现Ubuntu用起来很顺手，那么你没必要切换到Xubuntu。

但是，如果你发现Unity没办法满足你的要求，并且感觉你的计算机在运行Ubuntu时或多或少有一些性能压力，那么当然就可以考虑考虑Xubuntu。

上周我发了一篇文章介绍怎么[创建Xubuntu启动优盘][c]，并且也写了一篇[安装Xubuntu的教程][b]（译者注：链接为github地址）。

不过，如果你已经安装了Ubuntu，就不用这么费事照着教程再来一遍了。你只需要继续读完这篇文章，就可以在Ubuntu里面安装一个更合适的解决方案。

那么如果你已经装了Ubuntu，如何切换到Xubuntu呢？

你需要做一个选择题。问题是，你是仅仅需要一个更轻量的、可定制化的XFCE桌面，还是同时也需要那些Xubuntu内置的轻量级应用。

先来看看这些应用吧。下面有一个列表，列出了Ubuntu和Xubuntu内置的应用程序。如果你只需要几个Xubuntu应用程序，那么我建议你只安装XFCE然后单独安装这些应用。如果你需要一半以上的应用，那就安装整个Xubuntu桌面环境吧。

<table class="table table-bordered table-striped table-condensed">
 <caption>
  <strong>Ubuntu与Xubuntu内置应用对比</strong>
 </caption> 
 <tbody> 
  <tr> 
   <td><strong>应用类型</strong></td> 
   <td><strong>Ubuntu</strong></td> 
   <td><strong>Xubuntu</strong></td> 
  </tr> 
  <tr> 
   <td>音频</td> 
   <td>Rhythmbox</td> 
   <td>gmusicbrowser</td> 
  </tr> 
  <tr> 
   <td>视频</td> 
   <td>Totem</td> 
   <td>Parole</td> 
  </tr> 
  <tr> 
   <td>照片管理</td> 
   <td>Shotwell</td> 
   <td>Ristretto</td> 
  </tr> 
  <tr> 
   <td>办公</td> 
   <td>LibreOffice</td> 
   <td>Abiword/Gnumeric</td> 
  </tr> 
  <tr> 
   <td>浏览器</td> 
   <td>FireFox</td> 
   <td>FireFox</td> 
  </tr> 
  <tr> 
   <td>Email</td> 
   <td>&nbsp;</td> 
   <td>Thunderbird</td> 
  </tr> 
  <tr> 
   <td>即时通讯</td> 
   <td>Empathy</td> 
   <td>Pidgin</td> 
  </tr> 
 </tbody> 
</table>

### 如何在Ubuntu安装XFCE桌面环境 ###

![默认的XFCE桌面](http://f.tqn.com/y/linux/1/W/U/J/1/xfce1.png)

接下来，我会使用命令行工具[apt-get][7]介绍在Ubuntu安装XFCE桌面的方法。

打开一个终端窗口，在Unity环境，你可以在[Dash][8]中搜索“TERM”，或者使用组合键 `CTRL+ALT+T`。

安装XFCE桌面十分简单，输入下列命令就可以了：

>sudo apt-get update
>sudo apt-get install xfce4

点击右上角设置图标然后登出，来切换到[XFCE桌面环境][9]。

切换到登入界面以后，点击在你用户名旁边的小Ubuntu图标，就会出现Unity桌面和XFCE桌面的选项。切换到XFCE然后正常登录。

系统会显示一个消息，提示你是否使用默认的面板布局或者使用单独的面板。

[最新版本的Xubuntu][10]在顶部包含一个单独的面板，不过我更喜欢双面板，顶部一个标准面板，底部一个常用程序的停靠面板。

需要注意的是，XFCE桌面菜单系统和Xubuntu的菜单有些差异，除非你安装[一个更好的菜单系统][11]，设置两个面板或许是个更好的选择。

这取决与选择的是哪个选项，不过没关系，如果后面你改变了主意，也可以很容易重新设置。XFCE可以进行深度的自定义。

### 不重新安装的情况下，如何从Ubuntu切换到Xubuntu ###

![从Ubuntu切换到Xubuntu](http://f.tqn.com/y/linux/1/W/W/J/1/xfce3.png)

如果你想全都使用Xubuntu的东西，但是又不想按照那些介绍重新安装系统的话，看看下面的东西。

通过搜索“TERM”，或者组合键`CTRL+ALT+T`，打开一个终端窗口。

在终端输入如下命令：

>sudo apt-get update
>sudo apt-get install xubuntu-desktop

花费的时间会比安装XFCE桌面长一些，但是要比重新安装Xubuntu系统要快。

安装完成以后，点击右上角图标，然后登出。

在登录界面，点击Ubuntu图标。会出现Unity和Xubuntu选项。点击Xubuntu，然后正常登入。

Xubuntu桌面就会显示出来啦。

这里会有一些差异。菜单仍然是XFCE菜单，而不是Xubuntu菜单。某些图标也不会出现在顶部面板中。但是这些小问题都不足以让我们花时间卸载Ubuntu然后重装Xubuntu。

下一篇文章中，我会介绍如何自定义Xubuntu以及XFCE桌面。

-----

via : http://linux.about.com/od/dist/fl/Ubuntu-With-XFCE-vs-Xubuntu-Linux.htm

作者：[Gary Newell][a]
译者：[zhouj-sh](https://github.com/Zhouj-sh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[b]:https://github.com/ZhouJ-sh/TranslateProject/blob/0c4ad0bc8e79e28c1f7f8ccf805708829baa8ea9/translated/share/20150116%20A%20Step%20By%20Step%20Guide%20To%20Installing%20Xubuntu%20Linux.md
[c]:https://github.com/ZhouJ-sh/TranslateProject/blob/d91316c19c6668b82cfabf9f89e4ad07c7193202/translated/share/20150119%203%20Ways%20To%20Create%20A%20Lightweight%20And%20Persistent%20Xubuntu%20Linux%20USB%20Drive.md
[1]:http://www.everydaylinuxuser.com/2014/11/an-everyday-linux-user-review-of-ubuntu.html
[2]:http://www.everydaylinuxuser.com/2015/01/an-everyday-linux-user-review-of.html
[3]:http://exoticcars.about.com/od/overviewsofmaker1/p/RollsHistory.htm
[4]:http://exoticcars.about.com/od/overviewsofmaker1/p/PorscheHistory.htm
[5]:http://office.about.com/od/FreeOpenSourceOfficeSoftware/a/All-About-Libreoffice-4-0.htm
[6]:http://linux.about.com/cs/linux101/g/xfce.htm
[7]:http://linux.about.com/od/ubusrv_doc/a/ubusg11t01.htm
[8]:http://linux.about.com/od/howtos/fl/Learn-Ubuntu-The-Unity-Dash.htm
[9]:http://linux.about.com/cs/linux101/g/xfce.htm
[10]:http://www.everydaylinuxuser.com/2015/01/an-everyday-linux-user-review-of.html
[11]:http://xubuntugeek.blogspot.co.uk/2013/12/how-to-install-whisker-menu-in-xubuntu.html
