 如何在 Ubuntu 中安装 Light Table 0.8
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2014/11/LightTable-IDE-logo-icon.png)

Light Table 在经过一年以上的开发，已经推出了新的稳定发行版本。现在它只为 Linux 提供64位的二进制包。

LightTable 0.8.0的改动:

- 更改: 我们从 NW.js 切换到了 Electron 
- 更改: Light Table 的发行与自更新进程完全地公开在github上
- 增加: Light Table 可以用提供的脚本在各个支持的平台上从源码构建
- 增加: Light Table 大部分的 node 代码库将通过 npm 依赖来安装，以取代以前采用分叉库的方式
- 增加: 有效文档。更多详情内容见下面
- 修复: 版本号 >= OSX 10.10的系统下的主要的可用性问题
- 更改: 官方不再提供 32位 Linux 软件包下载，不过仍然支持从源码构建
- 修复: ClojureScript eval 支持 ClojureScript 的现代版本
- 参阅更多 [github.com/LightTable/LightTable/releases][1]

![LightTable 0.8.0](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-08.jpg)

### 如何在 Ubuntu 中安装 Light Table 0.8.0 ###

下面的步骤会指导你怎么样在 Ubuntu 下安装官方的二进制包，在目前的 Ubuntu 发行版本中都适用(**仅仅针对64位**)。

在开始之前，如果你安装了之前的版本请做好备份。

**1.** 从以下链接下载 LightTable Linux 下的二进制文件：

- [lighttable-0.8.0-linux.tar.gz][2]

**2.** 从 dash 或是应用启动器，或者是 Ctrl+Alt+T 快捷键打开终端，并且在输入以下命令后敲击回车键：

    gksudo file-roller ~/Downloads/lighttable-0.8.0-linux.tar.gz

![open-via-fileroller](http://ubuntuhandbook.org/wp-content/uploads/2015/12/open-via-fileroller.jpg)

如果命令不工作的话从 Ubuntu 软件中心安装`gksu`。

**3.** 之前的命令使用了 root 用户权限通过档案管理器打开了下载好的存档。

打开它后，请做以下步骤:

- 右击文件并且将其重命名为 **LightTable**
- 将其解压到 **Computer -> /opt/** 目录下。

![extract-lighttable](http://ubuntuhandbook.org/wp-content/uploads/2015/12/extract-lighttable.jpg)

最终你应该安装好了 LightTable，可以在 /opt/ 目录下查看：

![lighttable-in-opt](http://ubuntuhandbook.org/wp-content/uploads/2015/12/lighttable-in-opt.jpg)

**4.** 创建一个启动器使你可以从 dash 工具或是应用启动器打开 LightTable。

打开终端，运行以下命令来创建与编辑一个 LightTable 的启动文件：

    gksudo gedit /usr/share/applications/lighttable.desktop

通过 Gedit 文本编辑器打开文件后，粘贴下面的内容并保存：

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

最后，从 dash 工具或者是应用启动器打开 IDE，好好享受它吧！

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/12/install-light-table-0-8-ubuntu-14-04/

作者：[Ji m][a]
译者：[zky001](https://github.com/zky001)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://github.com/LightTable/LightTable/releases
[2]:https://github.com/LightTable/LightTable/releases/download/0.8.0/lighttable-0.8.0-linux.tar.gz
