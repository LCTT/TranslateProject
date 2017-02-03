从源代码编译 Vim 8.0
========

从源代码编译 Vim 实际上并不那么困难。下面是你所要做的：

1、首先，安装包括 Git 在内的所有必备的库。对于一个 Debian 类的 Linux 发行版，例如 Ubuntu，命令如下：

```
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
```

在 Ubuntu 16.04 上，lua 开发包的名称是 `liblua5.1-dev` 而非 `lua5.1-dev`。

如果你知道你将使用哪种语言，可随意删去你不需要的包。例如：Python2 `python-dev` 或者是 Ruby `ruby-dev`。这一原则适用于本文的大部分内容。

对于 Fedora 20，将是以下命令:

```
sudo yum install -y ruby ruby-devel lua lua-devel luajit \
    luajit-devel ctags git python python-devel \
    python3 python3-devel tcl-devel \
    perl perl-devel perl-ExtUtils-ParseXS \
    perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
    perl-ExtUtils-Embed
```

在 Fedora 20 上需要这一步来纠正安装 XSubPP 时出现的问题：

```
# 从 /usr/bin 到 perl 目录做个 xsubpp (perl) 的符号链接
sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp 
```

2、 如果你已经安装了 vim，删掉它。

```
sudo apt-get remove vim vim-runtime gvim
```

如果是 Ubuntu 12.04.2，你或许也需要同时删除下面这些软件包:

```
sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox
```

3、 一旦上述内容都被安装好之后，获取 vim 源代码很容易。

注意：如果你使用 python，你的配置目录或许有一个特定的机器名 (例如 `config-3.5m-x86_64-linux-gnu`)。检查 `/usr/lib/python[2/3/3.5]` 目录来找到你的 python 配置目录，据此更改 `python-config-dir` 和/或 `python3-config-dir `的参数。

添加/删除下面的编译参数以适合您的设置。例如，如果您不打算写任何 Lua 脚本，您可以删去 `enable-luainterp`。

同时，如果你使用的不是 vim 8.0，请确认下面 `VIMRUNTIMEDIR` 参数设置正确（例如，如果使用 vim 8.0a, 就用 `/usr/share/vim/vim80a`）。记住，一些 vim 安装是直接安装在 `/usr/share/vim` 下的；调整好参数以适应你的系统:
   
```
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
    
在 Ubuntu 16.04 上，由于同时开启了 Python2 和 Python3，Python 支持将不工作。 阅读 [chirinosky 的回答](http://stackoverflow.com/questions/23023783/vim-compiled-with-python-support-but-cant-see-sys-version) 以获取变通的处理方法。

如果你想将来轻松卸载 vim，可以使用 `checkinstall` 来安装 。
    
```
sudo apt-get install checkinstall
cd ~/vim
sudo checkinstall
```

否则，可以使用 `make` 来安装。
    
```
cd ~/vim
sudo make install
```

要让 vim 成为你默认的编辑器，请使用 `update-alternatives`。
    
```
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
```

4、 再检查下，通过查看 `vim --version` 输出来确认确实在运行新的 Vim 应用程序版本。

**如果你的 gvim 不工作（在 ubuntu 12.04.1 LTS 上），试着把 `--enable-gui=gtk2` 参数变为 `--enable-gui=gnome2`。**

如果你遇到问题，仔细检查在步骤 3 开始提到的，使用正确的 Python 配置目录配置 `configure`。

这些 `configure` 和 `make` 命令假设你是一个 Debian 发行版，Vim 的运行库文件目录放在 `/usr/share/vim/vim80/`，这不是 vim 的默认路径。 在 `configure` 命令中的 `--prefix=/usr` 也是如此。这些参数或许对一个不是基于 Debian 的 Linux 发行版来说是有所不同的，在这种情况下，试着移除 `configure` 命令中的 `--prefix` 变量和 `make` 命令中的 `VIMRUNTIMEDIR` (换句话说，使用这些参数的默认值)。

如果你遇到麻烦, 这里是一些[其它编译 Vim 的有用的信息](http://vim.wikia.com/wiki/Building_Vim)。

--------------------------------------------------------------------------------

via: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

作者：[Val Markovic][a]
译者：[zky001](https://github.com/zky001)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:   https://github.com/Valloric
