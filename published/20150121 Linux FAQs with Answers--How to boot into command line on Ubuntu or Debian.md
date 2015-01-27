Linux 有问必答：如何在Ubuntu或者Debian中启动后进入命令行
================================================================================
> **提问**：我运行的是Ubuntu桌面，但是我希望启动后临时进入命令行。有什么简便的方法可以启动进入终端？

Linux桌面自带了一个显示管理器（比如：GDM、KDM、LightDM），它们可以让计算机启动自动进入一个基于GUI的登录环境。然而，如果你要直接启动进入终端怎么办？ 比如，你在排查桌面相关的问题或者想要运行一个不需要GUI的应用程序。

注意虽然你可以通过按下Ctrl+Alt+F1到F6临时从桌面GUI切换到虚拟终端。然而，在这种情况下你的桌面GUI仍在后台运行，这不同于纯文本模式启动。

在Ubuntu或者Debian桌面中，你可以通过传递合适的内核参数在启动时启动文本模式。

### 启动临时进入命令行 ###

如果你想要禁止桌面GUI并临时进入一次文本模式，你可以使用GRUB菜单。

首先，打开你的电脑。当你看到初始的GRUB菜单时，按下‘e’。

![](https://farm8.staticflickr.com/7490/16112246542_bc1875a397_z.jpg)

接着会进入下一屏，这里你可以修改内核启动选项。向下滚动到以“linux”开始的行，这里就是内核参数的列表。删除参数列表中的“quiet”和“splash”。在参数列表中添加“text”。

![](https://farm8.staticflickr.com/7471/15493282603_8a70f70af2_z.jpg)

升级的内核选项列表看上去像这样。按下Ctrl+x继续启动。这会以详细模式启动控制台一次（LCTT译注：由于没有保存修改，所以下次重启还会进入 GUI）。

![](https://farm8.staticflickr.com/7570/15925676530_b11af59243_z.jpg)

### 永久启动进入命令行 ###

如果你想要永久启动进入命令行，你需要[更新定义了内核启动参数GRUB设置][1]。

在文本编辑器中打开默认的GRUB配置文件。

    $ sudo vi /etc/default/grub 

查找以GRUB\_CMDLINE\_LINUX\_DEFAULT开头的行，并用“#”注释这行。这会禁止初始屏幕，而启动详细模式（也就是说显示详细的的启动过程）。

更改GRUB_CMDLINE_LINUX="" 成：

    GRUB_CMDLINE_LINUX="text"

接下来取消“#GRUB_TERMINAL=console”的注释。

更新后的GRUB配置看上去像下面这样。

![](https://farm9.staticflickr.com/8673/16107564442_9345d94491_b.jpg)

最后，使用update-grub命令来基于这些更改重新生成/boot下的GRUB2配置文件。

    $ sudo update-grub 

这时，你的桌面应该可以从GUI启动切换到控制台启动了。可以通过重启验证。

![](https://farm8.staticflickr.com/7518/16106378151_81ac6b5a49_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/boot-into-command-line-ubuntu-debian.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/add-kernel-boot-parameters-via-grub-linux.html