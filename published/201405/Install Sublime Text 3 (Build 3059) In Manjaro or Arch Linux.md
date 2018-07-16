一条命令在Manjaro/Arch Linux上安装Sublime Text 3  
================================================================================
[Sublime Text 3][1]目前还处于beta测试状态，目前最新的版本为Build 3059。 这个教程中我们将通过AUR安装Sublime Text 3 build 3059。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/Sublime_text_3_manjaro.png)

打开终端并运行下列命令, 选择是否(Y/N)继续安装（这里选择Y）。

    sudo yaourt -S sublime-text-dev

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sublime_text_3_AUR.png)

    loading packages...
    resolving dependencies...
    looking for inter-conflicts...
    Packages (1): sublime-text-dev-3.3059-1
    Total Installed Size: 16.02 MiB
    :: Proceed with installation? [Y/n] y
    (1/1) checking keys in keyring           [########################################] 100%
    (1/1) checking package integrity         [########################################] 100%
    (1/1) loading package files              [########################################] 100%
    (1/1) checking for file conflicts        [########################################] 100%
    (1/1) checking available disk space      [########################################] 100%
    (1/1) installing sublime-text-dev        [########################################] 100%

----------

    ==> sublime-text-dev install/upgrade note:
     ------------------------------------------------------------------------------
	 To disable in-application reminders about new Sublime Text dev versions,
 	 add the following setting to your User Preferences file:
 	 "update_check": false
    ------------------------------------------------------------------

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/05/sublime_text_3.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-sublime-text-3-build-3059-manjaroarch-linux/

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.sublimetext.com/3
