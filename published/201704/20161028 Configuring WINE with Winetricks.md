用 Winetricks 配置 WINE
============================================================

### 简介

如果 `winecfg` （WINE 的配置工具）是一把螺丝刀，那么 `winetricks` 就是一个钻床。它们各有特长，但是 `winetricks` 真的是一个强大的多的工具。实际上，它甚至可以启动 `winecfg`。

`winecfg` 让你可以改变 WINE 本身的设置，而 `winetricks` 则可以让你改造实际的 Windows 层，它可以让你安装 Windows 重要的系统组件，比如 .dll　文件和系统字体，还可以允许你修改 Windows 注册表的信息。它还有任务管理器、卸载工具和文件浏览器。

尽管 `winetricks` 可以做以上这些工作，但是大部分时间我们用到的功能也就是管理 `dll` 文件和　Windows　组件。

### 安装

和 `winecfg` 不同，`winetricks` 不是集成在 WINE 中的。这样也没什么问题，由于它实际上只是个脚本文件，你可以在各种发行版上很轻松地下载和使用它。现在，许多发行版把 `winetricks` 打包。只要你喜欢，你也可以下载打包后的版本。不过，有些包可能会比较老旧，所以本指南将使用脚本，毕竟脚本通用且更新及时。默认情况下，它的图形界面有些丑，所以你要是想个性化界面，最好通过你的发行版的包管理器安装一个 `zenity`。

现在假定你想在你的 `/home` 目录下配置 `winetricks`。　`cd` 到此，然后 `wget` 这个脚本。

```
$ cd ~

$ wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
```

然后，给这个脚本可执行权限。

```
$ chmod+x winetricks
```

`winetricks` 可以通过命令行运行，在行末指定要安装的东西。但是大部分情况下，你都不知道 .dll 文件或者是你想安装字体确切的名字，那么，这时候最好利用图形界面程序。启动这个程序和其他程序没什么不同，就是在末尾什么都别输入就行了。

```
$ ~/winetricks
```

![winetricks-main](https://linuxconfig.org/images/winetricks-main.png) 

当窗口第一次打开时候，将会给你一个有 <ruby>“查看帮助”<rt>View help</rt></ruby> 和 <ruby>“安装应用”<rt>Install an application</rt></ruby> 选项的菜单。一般情况下，我们选择 <ruby>“选择默认的 wineprefix”<rt>Select the default wineprefix</rt></ruby>，这将是你主要使用的选项。其他的也能用，但是不推荐使用。接下来，单击 “OK”，你就会进入到 WINE prefix 的配置菜单，你可以在这完成所有你要使用 `winetricks` 完成的事情。

![The winetricks prefix menu](https://linuxconfig.org/images/winetricks-prefix.png)

### 字体

![The winetricks font menu](https://linuxconfig.org/images/winetricks-font.png)

字体一直很重要，一些应用程序没有字体就没法正常的加载。`winetricks` 可以轻松地安装许多常用 Windows 字体．在配置菜单中，选中 <ruby>“安装字体”<rt>Install a font</rt></ruby>　单选按钮，然后点击 “OK”　即可。

然后你就会得到一列字体清单，它们都有着相对应的复选框。你很难确切知道你到底需要什么字体，所以一般按每个应用决定使用什么字体，我们可以先安装一款插件 `corefonts`，它包含了大多数 Windows 系统中应用程序所设定的字体。安装它也十分简单，所以可以试试。

要安装 `corefonts` ，请选择相应的复选框，然后点击 “OK”，你就会看到和在 Windows 下差不多的提示，字体就会被安装了。完成了这个插件的安装，你就会回到先前的菜单界面。接下来就是安装你需要的别的插件，步骤相同。

### .dll 文件和组件

![The winetricks dll menu](https://linuxconfig.org/images/winetricks-dll.png)

`winetricks` 安装 Windows 下的 .dll 文件和别的组件也十分简单。如果你需要安装的话，在菜单页选择 <ruby>“安装 Windows DLL 或组件”<rt>Install a Windows DLL or component</rt></ruby>，然后点击 “OK”。 

窗口就会进入到另一个菜单界面，其中包含可用的 dll 和其他 Windows 组件。在相应的复选框进行选择，点击 “OK”。脚本就会下载你选择的组件，接着通过 Windows 一般的安装进程进行安装。像 Windows 机器上安装那样跟着提示往下走。可能会有报错信息。很多时候，Windows　安装程序会报错，但是你接着会收到来自 `winetricks` 窗口的消息，说明它正在绕过此问题。这很正常。由于组件之间的相互依赖关系，你可能会也可能不会看到成功安装的信息。只要确保安装完成时候，菜单页中你的选项仍旧处于被选中状态就行了。

### 注册表

![WINE regedit](https://linuxconfig.org/images/winetricks-regedit.png)

你不需要常常编辑注册表中 WINE 对应的值，但是对于有些程序确实需要。技术层面来讲，`winetricks` 不向用户提供注册表编辑器，但是要访问编辑器也很容易。在菜单页选中<ruby>“运行注册表编辑”<rt>Run regedit</rt></ruby>，点击 “OK”，你就可以打开一个简单的注册表编辑器。事实上，写入注册表的值有点超出本篇引导文章的范围了，但是我还要多说一句，如果你已经知道你在干什么，增加一个注册表条目不是很难。注册表有点像电子表格，你可以将正确的值填入右面的格子中。这个说的有点过于简单，但是就是这样的。你可以在以下地址精准地找到你需要在 WINE Appdp 所要填入或编辑的东西。 https://appdb.winehq.org。

### 结束语

很明显 `winetricks` 还有许多许多强大的功能，但是本篇指南的目的只是给你一点基础知识，以使用这个强大的工具，使你的程序通过 WINE 运行。WINE Appdb 对每个程序都有相应的设置，将来会越来越丰富。

------------------
via: https://linuxconfig.org/configuring-wine-with-winetricks

作者：Nick Congleton
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


