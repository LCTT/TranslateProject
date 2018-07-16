如何在linux上通过GRUB添加内核参数
================================================================================

我们可以在linux内核启动时为其提供各种各样的参数。这些参数可以自定义内核默认的行为，或者通知内核关于硬件的配置信息。内核参数应在内核启动时通过引导装载程序，如GRUB或LILO传递给内核。

在本教程中，我将会描述**如何在linux上通过GRUB添加内核参数**。

如果你在使用GRUB引导装载程序，想修改或添加内核参数，你可以编辑GRUB配置文件。下面是针对特定发行版在GRUB的配置文件中添加内核启动参数的方法。

### 在Debian或Ubuntu上添加内核启动参数###

在基于Debian的系统上，如果你想在系统启动时添加内核参数，你可以编辑 /etc/default/grub 目录下的GRUB配置模板。在 GRUB\_CMDLINE\_LINUX\_DEFAULT 变量中以 “name=value” 的格式添加内核参数。

    $ sudo -e /etc/default/grub 

> GRUB\_CMDLINE\_LINUX\_DEFAULT="...... name=value"

然后运行下面的命令来生成一个GRUB的配置文件。

    $ sudo update-grub 

如果无法找到 update-grub 命令，你可以通过下面的命令安装它。

    $ sudo apt-get install grub2-common 

### 在Fedora上添加内核启动参数 ###

在Fedora上，想要在启动时添加内核参数，你可以编辑 /etc/default/grub目录下的 GRUB 配置模板。在 GRUB\_CMDLINE\_LINUX 变量中以 “name=value” 的格式添加内核参数。

    $ sudo -e /etc/default/grub 

> GRUB\_CMDLINE\_LINUX="...... name=value"

然后运行下面的命令生成 GRUB2 配置文件。

    $ sudo grub2-mkconfig -o /boot/grub2/grub.cfg

### 在CentOS上添加内核启动参数 ###

在CentOS上，想要在启动时添加内核参数，你可以直接编辑GRUB配置文件 /boot/grub/grub.conf。在配置文件中，找到描述默认使用的Linux映像的条目。文件中最顶行的字符串 “default=N”会指示哪一个条目是默认的映像。 

[![](http://farm8.staticflickr.com/7429/10618657834_8082c2806b_z.jpg)][1]

找到默认的映像条目后，在以 “kernel /vmlinuz-” 开头的那一段的结尾附加上内核参数。参数的格式为 “name=value” 。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/add-kernel-boot-parameters-via-grub-linux.html

译者：[Linchenguang](https://github.com/Linchenguang) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.flickr.com/photos/xmodulo/10618657834/
