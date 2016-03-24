如何在Crunchbang下恢复Openbox的默认配置
================================================================================
[CrunchBang][1]是一个很好地融合了速度、风格和内容的基于Debian GNU/Linux的发行版。使用了灵活的Openbox窗口管理器，高度定制化并且提供了一个现代、全功能的GNU/Linux系统而没有牺牲性能。

Crunchbang是高度自定义的，用户可以尽情地地把它调整成他们想要的样子。这一切都通过文本文件（配置）。我作为一个Crunchbang用户，我最近搞乱了我的**menu.xml**配置文件，它负责下面的菜单显示。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/curnchbang_menu_xml.png)

我的菜单配置文件中丢失了所有内容。由于我没有备份（最好备份配置文件）。我不得不搜索Crunchbang安装后的默认配置。这里就是我如何修复的过程，这里要感谢Crunchbang论坛。

了解所有为你预备份的默认配置是很有趣的，你可以在这里找到：

    /etc/skel/.config/

因此对于任何默认配置，你只需复制他们并重启适当的程序。

我在这里使用Openbox的**menu.xml**作为示例：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/curnchbang_menu_xml_etc.png)

    cp -r /etc/skel/.config/openbox/menu.xml ~/.config/openbox/menu.xml

接着重启openbox。

    openbox --restart

--------------------------------------------------------------------------------

via: http://www.unixmen.com/recover-default-openbox-config-files-crunchbang/

作者：[Enock Seth Nyamador][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/
[1]:http://crunchbang.org/