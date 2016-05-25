也许你需要在 Antergos 与 Arch Linux 中查看印度语和梵文？
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Indian-languages.jpg)

你们到目前或许知道，我最近一直在尝试体验 [Antergos Linux][1]。在安装完[Antergos][2]后我所首先注意到的一些事情是在默认的 Chromium 浏览器中**没法正确显示印度语脚本**。

这是一件奇怪的事情，在我之前桌面Linux的体验中是从未遇到过的。起初，我认为是浏览器的问题，所以我安装了Firefox，然而问题依旧，Firefox也不能正确显示印度语。和Chromium不显示任何东西不同的是，Firefox确实显示了一些东西，但是毫无可读性。

![No hindi support in Arch Linux based Antergos](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Hindi_Support_Antergos_Arch_linux_1.jpeg)

*Chromium中的印度语显示*


![No hindi support in Arch Linux based Antergos](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Hindi_Support_Antergos_Arch_linux_2.jpeg)

*Firefox中的印度语显示*

奇怪吧？那么，默认情况下基于Arch的Antergos Linux中没有印度语的支持吗？我没有去验证，但是我假设其它基于梵语脚本的印地语之类会产生同样的问题。

在这个快速指南中，我打算为大家演示如何来添加梵语支持，以便让印度语和其它印地语都能正确显示。

### 在Antergos和Arch Linux中添加印地语支持 ###

打开终端，使用以下命令：

    sudo yaourt -S ttf-indic-otf

键入密码，它会提供给你对于印地语的译文支持。

重启Firefox，会马上正确显示印度语了，但是它需要一次重启来显示印度语。因此，我建议你在安装了印地语字体后**重启你的系统**。

![Adding Hindi display support in Arch based Antergos Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Hindi_Support_Antergos_Arch_linux_4.jpeg)

我希望这篇快速指南能够帮助你，让你可以在Antergos和其它基于Arch的Linux发行版中，如Manjaro Linux，阅读印度语、梵文、泰米尔语、泰卢固语、马拉雅拉姆语、孟加拉语，以及其它印地语。

--------------------------------------------------------------------------------

via: http://itsfoss.com/display-hindi-arch-antergos/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://antergos.com/
[2]:http://itsfoss.com/tag/antergos/
