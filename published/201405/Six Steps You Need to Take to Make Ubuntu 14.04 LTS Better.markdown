六步优化你的 Ubuntu 14.04
================================================================================

![](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-2.jpg) 

**Ubuntu 14.04 LTS (Trusty Tahr) 是一个非常优秀的操作系统，但是与其他发行版一样，它的初始化配置对用户来说并不是最优的配置。虽然这样有许多原因，但我们可以自己做一些配置来极大地提升你的Ubuntu操作体验。**

Ubuntu 是一款非常优秀的操作系统，而且其14.04的最新版本也是Canonical迄今为止制作的最精心版本，但是对于许多用户来说，这一系统中仍存在许多需要改善的方面。确实，如果你希望获得完整的操作体验，你需要进行一些设置修改。

比如，当你第一次启动这一系统时，你需要打开“软件与更新”(Software & Updates)，确认在第一个选项“Ubuntu Software”中所有的子选项都被选中。因为如果你想获得所有重要的包，你需要这些软件库被激活。

![Software & Updates repositories](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-3.jpg)
“软件与更新”(Software & Updates)软件库

第二个修改是安装Ubuntu Restricted Extras. 这样可以安装许多由于法律原因而无法与操作系统绑定的重要软件包，如Adobe公司的Flash与Microsoft的字体。自己安装这些软件是没有任何问题的，但开发者不能默认地包含这些软件。打开一个终端，输入如下命令：

    sudo apt-get update
    sudo apt-get install ubuntu-restricted-extras

安装完成后，你需要删掉系统默认的即时消息软件：Empathy. 它是GNOME的一部分，而且是一个非常有限的并有bugs的解决方案。你需要安装Pidgin来替换。根据如下命令进行安装：

    sudo apt-get remove empathy
    sudo apt-get install pidgin
    sudo apt-get install pidgin-plugin-pack

现在，如果你已经完成了对即时消息软件的处理，你需要安装视频卡(video card)的驱动。如果你有Intel的GPU，你不需要做任何事情，但是如果你的GPU是NVIDIA或者AMD的，你可能需要相应公司的驱动，这样可以在游戏中为你提供更好的性能。再次打开“软件与更新”(Software & Updates)，点击最后一个选项：额外驱动(Additional Drivers)，选择你需要的驱动。这需要一定时间，请耐心等待。然后重启。

![Software & Updates drivers](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-4.jpg)
“软件与更新”(Software & Updates)驱动

然后，你可能也想终止通过Unity's Dash的在线搜索。打开“系统设置”，选择“安全与隐私”(Security and Privacy). 在第三个选项“搜索”中，你可以发现一个按钮可以关闭在线搜索。

![Stop online search in Ubuntu 14.04 LTS](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-5.jpg)
在Ubuntu 14.04 LTS中关闭在线搜索

最后，你可能也想稍微定制一下桌面。在桌面点击鼠标右键，选择改变桌面背景。你会发现一个名为“启动器图标大小”的滚动条。你可以激活这个滚动条，修改结果也可以实时看到。在“行为”选项中，你也可以发现一个选项来选择在应用窗口中显示菜单，而不是在Unity的顶部条那显示。

![Change the way menus are displayed](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-6.jpg)
改变菜单的显示方式

以上就是所有的内容。你依据这些做的任何改变都可以将你的Ubuntu 14.04 LTS定制成你自己的版本，而且这些只是针对操作系统外貌的改变，极少针对特性与性能。

希望你喜欢！

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341.shtml

译者：[Hao-Ding](https://github.com/Hao-Ding) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出