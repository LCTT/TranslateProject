Neofetch ：带发行版 Logo 图像的系统信息显示工具
============================================================

Neofetch 是一个跨平台的易于使用的 [系统信息显示命令行脚本][3]，它收集你的系统信息，并在终端中和图像一起显示出来，这个图像可能是你的发行版的 logo  也可能是你选择的一幅 ascii 艺术字。

Neofetch 和 [ScreenFetch][4] 或者 [Linux_Logo][5] 很像，但是它可以高度定制，并且还有一些额外的我们要在下面讨论的特点。

它的主要特点有：运行速度快，可以显示全色图像 —— 用 ASCII 字符显示的发行版 logo ，旁边显示系统信息，可以高度定制，可以随时随地显示系统信息，并且在脚本结束的时候还可以通过一个特殊的参数来启用桌面截图。

#### 系统要求：

1.  Bash 3.0+ 带 ncurses 支持。
2.  w3m-img (有时候会打包成 w3m) 或者 iTerm2 或者 Terminology，用于显示图像。
3.  [imagemagick][1]，用于创建缩略图。
4.  支持 `[\033[14t`  的 [Linux 终端模拟器][2] 或者 xdotool 或者 xwininfo + xprop 或者 xwininfo + xdpyinfo 。
5.  Linux 系统中还需要 feh、nitrogen 或者 gsettings 来提供对墙纸的支持。

注意：你可以从 Neofetch 的 Github 页面了解更多关于可选依赖的信息，以检查你的 [Linux 终端模拟器][6] 是不是真的支持 `\033[14t` 或者是否需要一些额外的依赖来使这个脚本在你的发行版上工作得更好。

### 怎样在 Linux 系统上安装 Neofetch

Neofetch 可以从几乎所有 Linux 发行版的第三方仓库轻松安装，请按照以下各自的安装说明进行安装。

#### Debian

```
$ echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
$ curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
$ sudo apt-get update
$ sudo apt-get install neofetch
```

#### Ubuntu 和 Linux Mint

```
$ sudo add-apt-repository ppa:dawidd0811/neofetch
$ sudo apt-get update
$ sudo apt-get install neofetch
```

#### RHEL, CentOS 和 Fedora

你的系统里面要安装了 `dnf-plugins-core` ，或者用以下命令安装它：

```
$ sudo yum install dnf-plugins-core
```

启用 COPR 仓库然后安装 neofetch。

```
$ sudo dnf copr enable konimex/neofetch
$ sudo dnf install neofetch
```

#### Arch Linux

你可以用 packer 或 Yaourt 从 AUR 安装 neofetch 或 neofetch-git。

```
$ packer -S neofetch
$ packer -S neofetch-git
或
$ yaourt -S neofetch
$ yaourt -S neofetch-git
```

#### Gentoo

从 Gentoo/Funtoo 的官方源安装 app-misc/neofetch。如果你要安装这个程序的 git 版的话，你可以安装  app-misc/neofetch-9999。

### 怎么在 Linux 中使用 Neofetch

一旦你安装了 Neofetch ，使用它的一般语法是：

```
$ neofetch
```

注意： 要是你没有安装 w3m-img  或者 [imagemagick][7] 的话，[screenfetch][8] 会默认被启用，neofetch 会如下图所示显示你的 [ASCII 艺术 logo]。

#### Linux Mint 系统信息

[
 ![Linux Mint 系统信息](http://www.tecmint.com/wp-content/uploads/2016/11/Linux-Mint-System-Information.png) 
][10]

*Linux Mint 系统信息*

#### Ubuntu 系统信息

[
 ![Ubuntu System Information](http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information.png) 
][11]

*Ubuntu 系统信息*

如果你想用图片显示你的发行版 logo，需要用下面的命令安装 w3m-img 或者  imagemagick 。

```
$ sudo apt-get install w3m-img    [On Debian/Ubuntu/Mint]
$ sudo yum install w3m-img        [On RHEL/CentOS/Fedora]
```

然后再次运行 neofetch，你就会看到如下图所示的用你系统的默认墙纸来显示图片。

```
$ neofetch
```
[
 ![Ubuntu System Information with Logo](http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information-with-Logo.png) 
][12]

*Ubuntu 系统信息带 logo*

第一次运行 neofetch 后，它会在这里创建一个配置文件： `$HOME/.config/neofetch/config`。

这个配置文件可以让你通过 `printinfo ()`  函数来调整你想显示在终端的系统信息。你可以增加，修改，删除，也可以使用 bash 代码去调整你要显示的信息。

你可以如下图所示用你喜欢的编辑器打开这个配置文件：

```
$ vi ~/.config/neofetch/config
```

以下是我系统配置的片段 ，显示了 `printinfo ()` 函数。

Neofetch  配置

```
#!/usr/bin/env bash
# vim:fdm=marker
#
# Neofetch config file
# https://github.com/dylanaraps/neofetch

# Speed up script by not using unicode
export LC_ALL=C
export LANG=C

# Info Options {{{

# Info
# See this wiki page for more info:
# https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
printinfo() {
    info title
    info underline

    info "Model" model
    info "OS" distro
    info "Kernel" kernel
    info "Uptime" uptime
    info "Packages" packages
    info "Shell" shell
    info "Resolution" resolution
    info "DE" de
    info "WM" wm
    info "WM Theme" wmtheme
    info "Theme" theme
    info "Icons" icons
    info "Terminal" term
    info "Terminal Font" termfont
    info "CPU" cpu
    info "GPU" gpu
    info "Memory" memory

    # info "CPU Usage" cpu_usage
    # info "Disk" disk
    # info "Battery" battery
    # info "Font" font
    # info "Song" song
    # info "Local IP" localip
    # info "Public IP" publicip
    # info "Users" users
    # info "Birthday" birthday

    info linebreak
    info cols
    info linebreak
}
.....
```

下面的命令可以显示所有你能在 neofetch  脚本中用的参数和配置值：

```
$ neofetch --help
```

要启用所有的功能和参数来运行程序，你可以用 `--test` 参数：

```
$ neofetch --test
```

要再次显示 ASCII 艺术 logo ，你可以用 `--ascii` 参数 :

```
$ neofetch --ascii
```

这篇文章中，我们向你介绍了一个可以高度定制的、用来收集系统信息并将它显示在终端上的命令行脚本。

如果你有什么问题，或者对这个脚本有什么想法，请在下面留言。

最后但是同样重要的是，如果你知道有类似的脚本，请毫不犹豫地告诉我们，感谢反馈。

 在此访问 [neofetch Github 仓库][13]。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/neofetch-shows-linux-system-information-with-logo

作者：[Aaron Kili][a]
译者：[Yinux](https://github.com/Yinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/install-imagemagick-in-linux/
[2]:http://www.tecmint.com/linux-terminal-emulators/
[3]:http://www.tecmint.com/screenfetch-system-information-generator-for-linux/
[4]:http://www.tecmint.com/screenfetch-system-information-generator-for-linux/
[5]:http://www.tecmint.com/linux_logo-tool-to-print-color-ansi-logos-of-linux/
[6]:http://www.tecmint.com/linux-terminal-emulators/
[7]:http://www.tecmint.com/install-imagemagick-in-linux/
[8]:http://www.tecmint.com/screenfetch-system-information-generator-for-linux/
[9]:http://www.tecmint.com/linux_logo-tool-to-print-color-ansi-logos-of-linux/
[10]:http://www.tecmint.com/wp-content/uploads/2016/11/Linux-Mint-System-Information.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/11/Ubuntu-System-Information-with-Logo.png
[13]:https://github.com/dylanaraps/neofetch
