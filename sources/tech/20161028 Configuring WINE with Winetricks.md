用Winetricks配置WINE

目录


         [1简介][1]
         [2安装][2]
         [3字体][3]
         [4.dulls 和其他组件][4]
         [5注册][5]
         [6关闭][6]
         [7内容表][7]


简介


如果 winecfg (WINE的配置文件) 是一把螺丝刀，那么　winetricks 就是一个钻床．它们各有特长．但是 winetricks 真的是一个强大的工具．实际上，它完全有能力配置 winecfg，充当配置文件的配置文件

winecfg 让你可以改变 WINE 本身的设置，而winetricks 则可以让你改造 Windows 层，它可以让你安装 Windows重要的系统组件，比如 .dulls　文件，还可以允许你修改 Windows注册表的信息．它还有任务管理器，卸载工具和文件浏览器．


尽管 winetricks 可以功能强大，但是大部分时间我们用到的功能也就是管理 dll 文件和　Windows　组件
Even though `winetricks` can do all of this, the majority of the time, you're going to be using it to manage `dlls` and Windows components.

安装

和 winecfg 不同，winetricks 不是集成在 WINE 中的．这样也没什么问题，毕竟它实际上只是个脚本文件．所以你可以很轻松随意地下载到各种 winetricks 的发行版．现在，许多发行版把 winetricks 打包．只要你喜欢，你完全可以下载打包过的文件．不过有些包可能会过期，所以最好是使用引导脚本，毕竟引导脚本有着通用性．一般情况下，图形界面都比较丑，所以你要是想个性化界面，你最好通过发行版的包管理器安装一个 zenity

现在假定你想在你的家目录(~)下配置 winetricks．　cd 到此，然后 wget(Linux下强大的下载命令) 这个脚本

```
$ cd ~
$ wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
```
然后，给这个脚本可执行权限即可

```
$ chmod+x winetricks
```
winetricks 可以通过命令行运行，在行末指定要安装的东西即可．但是大部分情况下，你都不知道 .dlls 或者是你想安装字体的名字，那么，这时候最好利用图形界面的程序．使用这个程序真的很简单，和其他程序没什么不同，就是别在末尾什么都别输入就行了
```
$ ~/winetricks
```

 ![The winetricks main menu](https://linuxconfig.org/images/winetricks-main.png) 

当窗口第一次打开时候，将会给你一个有 View help 和 Install an application 选项的菜单．一般情况下，我们都选择 Select the default wineprefix，这将是你主要使用的选项．其他的也能用，但是我们不推荐．接下来，单击 OK，你就会进入到 WINE 的配置菜单，你可以在这完成所有的你要使用 winetricks 完成的事情

 ![The winetricks prefix menu](https://linuxconfig.org/images/winetricks-prefix.png) 

字体


 ![The winetricks font menu](https://linuxconfig.org/images/winetricks-font.png) 

字体一直很重要，一些应用程序没有字体没法正常的加载．winetricks 可以轻松地安装许多常用 Windows 字体．在配置菜单中，选中 Install a font　单选按钮，然后点击 OK　即可．

然后你就会得到一列字体清单，它们都有着相对应的确认框．你很难确切地知道你到底要安装什么字体，毕竟它们都是在应用程序的配置中预先被设定的，那么我们可以先安装一款插件 corefonts，它包含了大多数 Windows 系统中应用程序被设定的字体．安装它也十分简单，所以可以试试．

要安装 corefonts ，请选择相应的确认框，然后点击 OK ，你就会看到大概和在 Windows 下差不多的提示，字体就会被安装了．完成了这个插件的安装，你就会回到先前的菜单界面．接下来就是安装你需要的别的插件，步骤相同．

.dlls和组件

 ![The winetricks dll menu](https://linuxconfig.org/images/winetricks-dll.png) 

winetricks　安装 Windows 下的 .dll 文件和别的组件也十分简单．如果你需要安装的话，在菜单页选择 Install a Windows DLL or component，然后点击 OK 

窗口就会进入到另一个菜单界面，其中包含可用的 dlls 和其他 Windows 组件．选择相应的确认框，点击 OK，winetricks 就会下载你选择的组件，接着通过 Windows 一般安装进程进行安装．跟着提示，它很像 Windows 界面下的那种提示，忽略掉报错信息．很多时候，Windows　安装程序会报错，但是你会发现 winetricks 已经将它安装到工作区．这很正常．由于组件之间的相互依赖关系，你可能会也可能不会看到成功安装的信息．只要安装完成时候，确定在菜单页中你的选项仍旧处于被选中状态就行了

注册表

 ![WINE regedit](https://linuxconfig.org/images/winetricks-regedit.png) 

在WINE中你不需要常常编辑注册表对应的值，但是对于有些程序确实需要．技术层面来讲，winetricks 不向用户提供注册表编辑器，但是要获取编辑器也很容易．在菜单页选中 Run regedit，点击 OK，你就可以打开一个简单的注册表编辑器．讲真，写入注册表的值有点超出本篇引导文章的范围了，但是我还要多说一句，如果你已经知道你在干什么，增加一个注册表条目不是很难．注册表有点像电子表格，你可以将正确的值填入右面的格子中．这个有点过于简单，但是就是这样做的．你可以在以下地址精准地找到你需要在 WINE Appdp所要填入的东西．

关闭

很明显 winetricks 还有许多许多强大的功能远，远不止此，但是本篇引导的目的只是给你一点基础的知识，在你通过 WINE 运行程序一般都会用到．WINE Appdp 提供了强大的各种程序库，是一笔宝贵的知识财富，以后，它会变得更加无价．好好利用它吧．

--------------------------------------------------------------------------------

via: https://linuxconfig.org/configuring-wine-with-winetricks

作者：[Nick Congleton][a]
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/configuring-wine-with-winetricks
[1]:https://linuxconfig.org/configuring-wine-with-winetricks#h1-introduction
[2]:https://linuxconfig.org/configuring-wine-with-winetricks#h2-installing
[3]:https://linuxconfig.org/configuring-wine-with-winetricks#h3-fonts
[4]:https://linuxconfig.org/configuring-wine-with-winetricks#h4-dlls-and-components
[5]:https://linuxconfig.org/configuring-wine-with-winetricks#h5-registry
[6]:https://linuxconfig.org/configuring-wine-with-winetricks#h6-closing
[7]:https://linuxconfig.org/configuring-wine-with-winetricks#h7-table-of-contents
