如何在Ubuntu/Debian/Linux Mint中编译和安装wxWidgets
================================================================================

### wxWidgets ###

wxWidgets是一个程序开发框架/库， 允许你在Windows、Mac、Linux中使用相同的代码跨平台开发。它主要用C++写成，但也可以与其他语言绑定比如Python、Perl、Ruby。

本教程中我将向你展示如何在基于Debian的linux中如Ubuntu和Linux Mint中编译wxwidgets 3.0+。

从源码编译wxWidgets并不困难，仅仅需要几分钟。库可以按不同的方式来编译，比如静态或者动态库。

### 1. 下载 wxWidgets ###

第一步你需要从[wxwidgets.org][1]下载wxWidgets源码文件。

做完后，解压到目录。

### 2. 设置编译环境 ###

要编译wxwidgets，我们需要一些工具包括C++编译器，在Linux上是g++。所有这些可以通过apt-get工具从仓库中安装。

我们还需要wxWidgets依赖的GTK开发库。

    $ sudo apt-get install libgtk-3-dev build-essential checkinstall

> 这个叫做checkinstall的工具允许我们为wxwidgets创建一个安装包，这样之后就可以轻松的使用包管理器来卸载。

### 3. 编译 wxWidgets ###

进入到wxWidgets解压后的目录。为了保持清洁，创建一个编译用的目录。

    $ mkdir gtk-build
    $ cd gtk-build/

现在运行configure和make命令。每个将花费一些时间来完成。

    $ ../configure --disable-shared --enable-unicode
    $ make

"--disable-shared"选项将会编译静态库而不是动态库。

make命令完成后，编译就成功了。是时候安装wxWidgets到正确的目录。

更多信息请参考install.txt和readme.txt，这可在wxwidgets中的/docs/gtk/目录下找到。

### 4. 安装 checkinstall ###

现在我们不使用"make install"命令，我们使用checkinstall命令来创建一个wxwidgets的deb安装包。运行命令：

    $ sudo checkinstall

checkinstall会询问几个问题，请保证在提问后提供一个版本号，否则将会失败。

完成这一切后，wxWidgets就安装好了，deb文件也会创建在相同的目录下。

### 5. 追踪安装的文件 ###

如果你想要检查文件安装的位置，使用dpkg命令后面跟上checkinstall提供的包名。

    $ dpkg -L package_name
    /.
    /usr
    /usr/local
    /usr/local/lib
    /usr/local/lib/libwx_baseu-3.0.a
    /usr/local/lib/libwx_gtk3u_propgrid-3.0.a
    /usr/local/lib/libwx_gtk3u_html-3.0.a
    /usr/local/lib/libwxscintilla-3.0.a
    /usr/local/lib/libwx_gtk3u_ribbon-3.0.a
    /usr/local/lib/libwx_gtk3u_stc-3.0.a
    /usr/local/lib/libwx_gtk3u_qa-3.0.a
    /usr/local/lib/libwx_baseu_net-3.0.a
    /usr/local/lib/libwxtiff-3.0.a

### 6. 编译示例 ###

编译wxWidgets完成后就可以马上编译示例程序了。在相同的目录下，一个新的sample目录已经创建了。

进入它并运行下面的命令

    $ compile samples
    $ cd samples/
    $ make

make命令完成后，进入sample 子目录，这里就有一个可以马上运行的Demo程序了。

### 7. 编译你的第一个程序 ###

你完成编译demo程序后，可以写你自己的程序来编译了。这个也很简单。

假设你用的是C++，这样的话你还可以使用编辑器的高亮特性。比如gedit、kate、kwrite等等。或者用全功能的IDE像Geany、Codelite、Codeblocks等等。

然而你的第一个程序只需要用一个文本编辑器来快速完成。

如下：

    #include <wx/wx.h>
    
    class Simple : public wxFrame
    {
    public:
        Simple(const wxString& title)
    		: wxFrame(NULL, wxID_ANY, title, wxDefaultPosition, wxSize(250, 150))
    	{
    		Centre();
    	}
    };
    
    class MyApp : public wxApp
    {
    public:
    	bool OnInit()
    	{
    		Simple *simple = new Simple(wxT("Simple"));
    		simple->Show(true);
    		return true;
    	}
    };
    
    wxIMPLEMENT_APP(MyApp);

现在保存并用下面的命令编译。

    # compile
    $ g++ basic.cpp `wx-config --cxxflags --libs std` -o program
    
    # run
    $ ./program

#### 和非标准的库一起编译 ####

面展示的wx-config命令默认只支持标准的库。如果你使用的是Aui库，那么你需要指定额外用到的库。

    $ g++ code.cpp `wx-config --cxxflags --libs std,aui` -o program

更多的信息参考这里[这里][2]。

### 资源 ###

下载wxWidgets的源码和帮助
[https://www.wxwidgets.org/downloads/][3]

wxWidgets编译的wiki页面
[https://wiki.wxwidgets.org/Compiling_and_getting_started][4]

使用wxWidgets最新版本(3.0+)的事项
[https://wiki.wxwidgets.org/Updating_to_the_Latest_Version_of_wxWidgets][5]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/install-wxwidgets-ubuntu/

作者：[Silver Moon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117145272367995638274/posts
[1]:https://www.wxwidgets.org/downloads/
[2]:https://wiki.wxwidgets.org/Updating_to_the_Latest_Version_of_wxWidgets#The_wx-config_script
[3]:https://www.wxwidgets.org/downloads/
[4]:https://wiki.wxwidgets.org/Compiling_and_getting_started
[5]:https://wiki.wxwidgets.org/Updating_to_the_Latest_Version_of_wxWidgets
