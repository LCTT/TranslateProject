从源代码编译Vim实际上并不困难。
这里是你所想要做的内容：

1.首先，安装包括Git在内的所有提前需要的库。
对于一个Debian Linux发行像Ubuntu，
这将是以下命令：

    ```sh
    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    ```

   在Ubuntu 16.04, `liblua5.1-dev` 作为lua开发包的名称而非`lua5.1-dev`.

   (如果你知道你将使用哪种语言，随意删去你不需要的包。例如：Python2 `python-dev` 或者是 Ruby `ruby-dev`。这一原则适用于整个页面的大部分内容。)

    对于Fedora 20, 将是以下命令:

    ```sh
    sudo yum install -y ruby ruby-devel lua lua-devel luajit \
        luajit-devel ctags git python python-devel \
        python3 python3-devel tcl-devel \
        perl perl-devel perl-ExtUtils-ParseXS \
        perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
        perl-ExtUtils-Embed
    ```

这一步需要纠正的问题是如何安装Fedora 20的XSubPP：

    ```sh
    # symlink xsubpp (perl) from /usr/bin to the perl dir
    sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp 
    ```

2. 如果你已经装上vim，删掉它。

    ```sh
    sudo apt-get remove vim vim-runtime gvim
    ```

    在Ubuntu 12.04.2你或许也需要同时删除下面这些软件包:

    ```sh
    sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox
    ```

3. 一旦上述内容被安装好之后，获取vim源代码很容易。
注意：如果你使用python，你的配置路径或许有一个特定的机器的名字 (例如`config-3.5m-x86_64-linux-gnu`)。
   检查/usr/lib/python[2/3/3.5]路径来找到你的python配置路径, 据此更改`python-config-dir`和/或`python3-config-dir`的参数。

添加/删除下面的的标记符以适合您的设置。例如，如果您不打算写任何Lua，您可以删去`enable-luainterp`。

同时，如果你不使用vim8.0，确认下面VIMRUNTIMEDIR参数设置正确
   (例如，使用vim 8.0a, 就用/usr/share/vim/vim80a).
   记住一些vim安装是直接安装在/usr/share/vim;调整好以适应你的系统:

    ```sh
    cd ~
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp=yes \
                --enable-pythoninterp=yes \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --enable-python3interp=yes \
                --with-python3-config-dir=/usr/lib/python3.5/config \
                --enable-perlinterp=yes \
                --enable-luainterp=yes \
                --enable-gui=gtk2 --enable-cscope --prefix=/usr
    make VIMRUNTIMEDIR=/usr/share/vim/vim80
    ```
    在Ubuntu 16.04,由于同时开启了Python2和Python3，Python支持将不工作。 阅读 [answer by chirinosky](http://stackoverflow.com/questions/23023783/vim-compiled-with-python-support-but-cant-see-sys-version) 以获取变通的处理方法。

    如果你想要可以轻松卸载vim请使用`checkinstall`.

    ```sh
    sudo apt-get install checkinstall
    cd ~/vim
    sudo checkinstall
    ```

    否则, 你可以使用`make`来安装.

    ```sh
    cd ~/vim
    sudo make install
    ```

    让vim成为你默认的编辑器请使用`update-alternatives`.

    ```sh
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
    sudo update-alternatives --set editor /usr/bin/vim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
    sudo update-alternatives --set vi /usr/bin/vim
    ```

4. 仔细检查，你查看输出`vim --version`来获取实际上在运行新的Vim应用程序版本.

    **如果你的gvim不工作 (在 ubuntu 12.04.1 LTS),试着把
    `--enable-gui=gtk2`参数变为`--enable-gui=gnome2`**

	如果你遇到问题，仔细检查在步骤3开始提到的你`configure`配置使用的是正确的Python的config目录。

这些`configure`和`make`命令假设你是一个Debian发行版，Vim的运行库文件目录放在
`/usr/share/vim/vim80/`,这不是vim的默认。 在`configure`命令中的`--prefix=/usr`也是如此。这些参数或许对一个不是基于Debian的Linux发行版来说是有所不同的，在类似的场景中, 试着移除 `configure`命令中的
    `--prefix`变量和`make`命令中的`VIMRUNTIMEDIR`(换句话说，使用默认的)。

   如果你遇到麻烦, 这里是一些 [其它编译Vim的有用的信息]
    (http://vim.wikia.com/wiki/Building_Vim).
    
--------------------------------------------------------------------------------

via: https://www.dataquest.io/blog/data-science-portfolio-project/

作者：[Val Markovic][a]

译者：[译者ID](https://github.com/zky001)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:   https://github.com/Valloric
