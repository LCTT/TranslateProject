 如何在 Ubuntu 14.04, 15.10 中安装Light Table 0.8
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2014/11/LightTable-IDE-logo-icon.png)

Light Table 在经过一年以上的开发，已经推出了新的稳定发行版本。现在它只为Linux提供64位的二进制包。
LightTable 0.8.0的改动:

- 更改: 我们从 NW.js 中选择了 Electron 
- 更改: LT’s 发行版本与自更新进程在github上面完全的公开
- 增加: LT 可以由提供的脚本从源码在支持的不同平台上安装
- 增加: LT’s 大部分的代码库将用npm依赖来安装以取代以forked库安装
- 增加: 有效文档. 更多详情内容见下面
- 修复: 版本号>= OSX 10.10的系统下工作的主要的可用性问题
- 更改: 32位Linux不再提供官方包文件下载，从源码安装仍旧将被支持
- 修复: ClojureScript eval 在ClojureScript的现代版本可以正常工作
- 参阅更多 [github.com/LightTable/LightTable/releases][1]

![LightTable 0.8.0](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-08.jpg)

### 如何在Ubuntu中安Light Table 0.8.0: ###

下面的步骤回指导你怎么样在Ubuntu下安装官方的二进制包，在目前Ubuntu发行版本都适用(**仅仅针对64位**)。

在开始之前，如果你安装了之前的版本请做好备份。

**1.** 
从以下链接下载LightTable Linux下的二进制文件：

- [lighttable-0.8.0-linux.tar.gz][2]

**2.** 
从dash或是应用启动器，或者是Ctrl+Alt+T快捷键打开终端，并且在输入以下命令后敲击回车键：

    gksudo file-roller ~/Downloads/lighttable-0.8.0-linux.tar.gz

![open-via-fileroller](http://ubuntuhandbook.org/wp-content/uploads/2015/12/open-via-fileroller.jpg)

如果命令不工作的话从Ubuntu软件中心安装`gksu`。

**3.** 
之前的命令使用了root用户权限通过档案管理器打开了下载好的存档。


打开它后，请做以下步骤:

- 右击文件并且将其重命名为 **LightTable**
- 将其解压到 **Computer -> /opt/** 目录下。

![extract-lighttable](http://ubuntuhandbook.org/wp-content/uploads/2015/12/extract-lighttable.jpg)

最终你应该安装好了LightTable，可以在/opt/ 目录下查看：

![lighttable-in-opt](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-in-opt.jpg)

**4.** 创建一个启动器使你可以从dash工具或是应用启动器打开LightTable。

打开终端，运行以下命令来创建与编辑一个LightTable的启动文件：

    gksudo gedit /usr/share/applications/lighttable.desktop

通过Gedit文本编辑器打开文件后, 粘贴下面的内容并保存:

    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Light Table
    GenericName=Text Editor
    Comment=Open source IDE that modify, from running programs to embed websites and games
    Exec=/opt/LightTable/LightTable %F
    Terminal=false
    MimeType=text/plain;
    Icon=/opt/LightTable/resources/app/core/img/lticon.png
    Categories=TextEditor;Development;Utility;
    StartupNotify=true
    Actions=Window;Document;
    
    Name[en_US]=Light Table
    
    [Desktop Action Window]
    Name=New Window
    Exec=/opt/LightTable/LightTable -n
    OnlyShowIn=Unity;
    
        [Desktop Action Document]
    Name=New File
    Exec=/opt/LightTable/LightTable --command new_file
    OnlyShowIn=Unity;

因此它看起来像:

![lighttable-launcher](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-launcher.jpg)

最后，从dash工具或者是应用启动器打开IDE，好好享受它吧！

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/12/install-light-table-0-8-ubuntu-14-04/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://github.com/LightTable/LightTable/releases
[2]:https://github.com/LightTable/LightTable/releases/download/0.8.0/lighttable-0.8.0-linux.tar.gz
