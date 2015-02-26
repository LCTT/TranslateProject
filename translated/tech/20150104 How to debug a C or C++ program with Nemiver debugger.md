使用Nemiver调试器找出C/C++程序中的bug
================================================================================

如果你读过[my post on GDB][1],你就会明白我认为一个调试器对一段C/C++程序来说意味着多么的重要和有用。然而，如果一个像GDB的命令行对你而言听起来更像一个问题而不是一个解决方案，那么你也许会对Nemiver更感兴趣。[Nemiver][2] 是一款基于GTK＋的独立图形化用于C/C＋＋程序的调试器，同时它以GDB作为其后端。最令人佩服的是其速度和稳定性，Nemiver时一个非常可靠，具备许多优点的调试工具。

###  Nemiver的安装 ###

基于Debian发行版，它的安装时非常直接简单如下：

    $ sudo apt-get install nemiver 

在Arch Linux中安装如下：

    $ sudo pacman -S nemiver 

在Fedora中安装如下：

    $ sudo yum install nemiver 

如果你选择自己变异，[GNOME website][3]中最新源码包可用。

最令人欣慰的是，它能够很好地与GNOME环境像结合。

###   Nemiver的基本用法 ###

启动Nemiver的命令：

    $ nemiver 

你也可以通过执行一下命令来启动：

    $ nemiver [path to executable to debug] 

你会注意到如果在调试模式下执行编译（－g标志表示GCC）将会更有帮助。

还有一个优点是Nemiver的快速加载，所以你应该可以马上看到主屏幕的默认布局。





![](https://farm9.staticflickr.com/8679/15535277554_d320f6692c_c.jpg)

默认情况下，断点通常位于主函数的第一行。这样就可以空出时间让你去认识调试器的基本功能：

![](https://farm9.staticflickr.com/8669/16131832596_bc68ae18a8_o.jpg)

- Next line (mapped to F6)
- Step inside a function (F7)
- Step out of a function (Shift+F7) 
- 下一行 （映射到F6）
- 执行内部行数（F7）
- 执行外部函数（Shift+F7）  ##  我不确定这个保留哪个都翻译出来了 ##

但是由于我个人的喜好是“Run to cursor（运行至光标）”，该选项使你的程序运行精确至你光标下的行，并且默认映射到F11.

下一步，断点通常是容易使用的。最快捷的方式是使用F8设置一个断点在相应的行。但是Nemiver也有一个更富在的菜单在“Debug”项，这允许你在一个特定的函数，行数，二进制位置文件的位置，或者类似一个异常，分支或者exec的事件。

![](https://farm8.staticflickr.com/7579/16157622315_d680a63896_z.jpg)


你也可以通过追踪来查看一个变量。在“Debug”选项，你可以通过命名来匹配一个表达式来检查。然后也可以通过将其添加到列表中以方便访问。这可能是最有用的一个功能虽然我从未因为浓厚的兴趣将鼠标悬停在一个变量来获取它的值。值得注意的是，将鼠标放置在相应位置时不生效的。如果想要让它更好地工作，Nemiver是可以看到结构并给所有成员的变量赋值。

![](https://farm8.staticflickr.com/7465/15970310470_7ed020c613.jpg)


谈到方便地访问信息，我也非常欣赏这个程序的平面布局。默认情况下，代码在上个部分，标签在下半部分。这授予你访问中断输出、文本追踪、断点列表、注册地址、内存映射和变量控制。但是注意到在“Edit”“Preferences”“Layout”下你可以选择不同的布局，包括动态修改。

![](https://farm9.staticflickr.com/8606/15971551549_00e4cdd32e_c.jpg)

![](https://farm8.staticflickr.com/7525/15535277594_026fef17c1_z.jpg)


自然而然，一旦你设置了所有短点，观察点和布局，您可以在“File”下很方便地保存以免你不小心关掉Nemiver。


###  Nemiver的高级用法 ### 


到目前为止，我们讨论的都是Nemiver的基本特征，例如，你马上开始喝调试一个简单的程序需要什么。如果你有更高的药求，特别是对于一些更佳复杂的程序，你应该会对接下来提到的这些特征更感兴趣。


#### 调试一个正在运行的进程 ####


Nemiver允许你连接到一个正在运行的进程进行调试。在“File”菜单，你可以过滤出正在运行的进程，并连接到这个进程。

![](https://farm9.staticflickr.com/8593/16155720571_00e4cdd32e_z.jpg)


#### 通过TCP连接远程调试一个程序 ####

Nemiver支持远程调试，当你在一台远程机器设置一个轻量级调试服务器，你可以通过调试服务器启动Nemiver从另一台机器去调试承载远程服务器上的目标。如果出于某些原因，你不能在远程机器上吗很好地驾驭Nemiver或者GDB，那么远程调试对于你来说将非常有用。在“File”菜单下，指定二进制文件、共享库的地址和端口。

![](https://farm8.staticflickr.com/7469/16131832746_c47dee4ef1.jpg)

#### 使用你的GDB二进制进行调试 ####

如果你想自行通过Nemiver进行编译，你可以在“Edit（编辑）”“Preferences（首选项）”“Debug（调试）”下给GDB制定一个新的位置。如果你想在Nemiver使用GDB的定制版本，那么这个选项对你来说是非常实用的。


#### 循序一个子进程或者父进程 ####

Nemiver是可以兼容一个子进程或者附近成的。想激活这个功能，请到“Debugger”下面的“Preferences（首选项）”。

![](https://farm8.staticflickr.com/7512/16131832716_5724ff434c_z.jpg)

总而言之，Nemiver大概是我最喜欢的没有IDE的调试程序。在我看来，它甚至可以击败GDB，并且[命令行][4]程序对我本身来说更接地气。所以，如果你从未使用过的话，我会强烈推荐你使用。我只能庆祝我们团队背后给了我这么一个可靠、稳定的程序。

你对Nemiver有什么见解？你是否也考虑它作为独立的调试工具？或者仍然坚持使用IDE？让我们在评论中探讨吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/debug-program-nemiver-debugger.html

作者：[Adrien Brochard][a]
译者：[disylee](https://github.com/disylee)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://xmodulo.com/gdb-command-line-debugger.html
[2]:https://wiki.gnome.org/Apps/Nemiver
[3]:https://download.gnome.org/sources/nemiver/0.9/
[4]:http://xmodulo.com/recommend/linuxclibook
