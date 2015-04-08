如何清理你的 Ubuntu 14.10/14.04/13.10 系统
================================================================================
前面我们已经讨论了[如何清理 Ubuntu GNU/Linux 系统][1]，这篇教程将在原有教程的基础上，增加对新的 Ubuntu 发行版本的支持，并介绍更多的工具。

假如你想清理你的 Ubuntu 主机，你可以按照以下的一些简单步骤来移除所有不需要的垃圾文件。

## 移除多余软件包 ##

这又是一个内置功能，但这次我们不必使用新得立包管理软件(Synaptic Package Manager)，而是在终端中达到目的。

现在，在终端窗口中键入如下命令：

```
sudo apt-get autoclean
```

这便激活了包清除命令。这个命令所做的工作是： 自动清除那些当你安装或升级程序时系统所缓存的 `.deb` 包(即清除 `/var/cache/apt/archives` 目录，不过只清理过时的包)。如果需要使用清除命令，只需在终端窗口中键入以下命令：

```
sudo apt-get clean
```

然后你就可以使用自动移除命令。这个命令所做的工作是：清除那些 在系统中被某个已经卸载的软件 作为依赖所安装的软件包。要使用自动移除命令，在终端窗口中键入以下命令：

```
sudo apt-get autoremove
```

## 移除不需要的本地化数据 ##

为达到此目的，我们需要安装 `localepurge` 软件，它将自动移除一些不需要的本地化数据（LCTT 译注：即各种语言翻译）。这个软件是一个简单的脚本，它将从那些不再需要的本地化文件和本地化联机手册( man pages ) 所占用的空间中回收磁盘空间。这个软件将在任何 apt 安装命令运行时 被自动激活。

在 Ubuntu 中安装 `localepurge`

```
sudo apt-get install localepurge
```

在通过 `apt-get install` 安装任意软件后， localepurge 将移除所有不是使用你系统中所设定语言的翻译文件和翻译的联机手册。

假如你想设置 `localepurge`，你需要编辑 `/ect/locale.nopurge` 文件。

根据你已经安装的软件，这将为你节省几兆的磁盘空间。

例子：-

假如我试着使用 `apt-get` 来安装 `dicus`软件：

```
sudo apt-get install discus
```

在软件安装完毕之后，你将看到如下提示：

> localepurge: Disk space freed in /usr/share/locale: 41860K

## 移除孤包 ##

假如你想移除孤包，你需要安装 `deborphan` 软件：

在 Ubuntu 中安装 `deborphan` :

```
sudo apt-get install deborphan
```

### 使用 deborphan ###

打开终端并键入如下命令即可:

```
sudo deborphan | xargs sudo apt-get -y remove --purge
```

### 使用 GtkOrphan 来移除孤包 ###

`GtkOrphan` (一个针对 debian 系发行版本的 Perl/Gtk2  应用) 是一个分析用户安装过程状态并查找孤立库文件的图形化工具，它为 `deborphan` 提供了一个 GUI 前端，并具备移除软件包的功能。

#### 在 Ubuntu 中安装 GtkOrphan ####

打开终端并运行如下命令：

```
sudo apt-get install gtkorphan
```

#### 一张截图 ####

![](http://www.ubuntugeek.com/wp-content/uploads/2015/01/41.png)

### 使用 Wajig 移除孤包 ###

`Wajig`是 Debian 包管理系统中一个简单的软件包管理前端。它将 apt、apt-cache、 dpkg、 /etc/init.d 中的脚本等 通过一个单一命令集成在一起，它的设计初衷是使用简单和为它的所有功能提供丰富的文档。

通过适当的 `sudo`配置，大多数（如果不是全部）的软件包安装和创建等任务可以通过一个用户 shell 来完成。`Wajig` 也适用于一般的系统管理。另外，一个 Gnome GUI 命令 `gjig`也被囊括在这个软件包之中。

#### 在 Ubuntu 中安装 Wajig ####

打开终端并运行如下命令：

```
sudo apt-get install wajig
```

## Debfoster --- 跟踪你在安装过程中的操作 ##

debfoster 将会维护一个列有被明确需要安装的软件包的列表，但不包括那些作为某个软件的依赖而被安装的软件包。参数是完全可选的，你甚至可以使得在 dpkg 和/或 apt-get 每次运行之后马上激活 debfoster 。

另外，你还可以在命令行中使用 debfoster 来安装或移除某些特定的软件包。那些后缀为 `---` 的软件包将会被移除，而没有后缀的软件包将会被安装。

假如一个新的软件包或 debfoster 注意到作为某个软件包的依赖的软件包是一个孤包，则 debfoster 将会询问你下一步如何操作。若你决定保留这个孤包， debfoster 将只会进行记录并继续安装过程；若你觉得这个软件包不足以引起你的兴趣，在 debfoster 询问这个问题后，它将移除这个软件包。进一步的，如果你的决定使得其他的软件包变为孤包，更多的提问将会接踵而来。

### 在 Ubuntu 中安装 debfoster ###

打开终端并运行如下命令：

```
sudo apt-get install debfoster
```

### 使用 debfoster ###

为了创建一个初始跟踪文件，可以使用如下命令：

```
sudo debfoster -q
```

你总可以编辑 `/var/lib/debfoster/keepers` 文件，来定义那些你想留在系统中的软件包。

为了编辑这个文件，可以键入：

```
sudo vi /var/lib/debfoster/keepers
```

要强制使 debfoster 去移除所有没有被列在上面这个文件的软件包，或安装作为某些列在这个文件中的软件包的依赖，它也同时会添加所有在这个列表中没有被安装的软件包。若要根据这个列表来执行相关操作，只需执行：

```
sudo debfoster -f
```

若需要跟踪你新安装的软件包，你需要时不时地执行如下命令：

```
sudo debfoster
```

## xdiskusage -- 查看你的硬盘空间都去哪儿了 ##

图形化地展示磁盘使用情况的 du。xdiskusage 是一个用户友好型的程序，它将为你展示你所有磁盘的使用情况。 它是在 Phillip C. Dykstra 所写的 “xdu” 程序的基础上设计的。做了一些修改以使得它可以为你运行 “du”命令，并显示磁盘的剩余空间，并且假如你想清晰地了解你的磁盘空间都去哪儿了，它还可以生成一个 PostScript 格式的名为 display.xdiskusage 的文件。

### 在 Ubuntu 中安装 xdiskusage ###

只需使用如下命令：

```
sudo apt-get install xdiskusage
```

若你想打开这个应用，你需要使用如下命令：

```
sudo xdiskusage
```

一旦这个应用被打开，你将看到如下图所示的界面：

![](http://www.ubuntugeek.com/wp-content/uploads/2015/01/5.png)


## Bleachbit ##

BleachBit 能快速地释放磁盘空间并不知疲倦地保护你的隐私。它可以释放缓存，删除 cookie，清除 Internet 上网历史，粉碎临时文件，删除日志，丢弃你所不知道存在何处的垃圾。为 Linux 和 Windows 系统而设计，它支持擦除清理数以千计的应用程序，如 Firefox, Internet Explorer, Adobe Flash, Google Chrome, Opera, Safari 等等。除了简单地删除文件，BleachBit 还包括许多高级功能，诸如粉碎文件以防止恢复，擦除磁盘空间来隐藏被其他应用程序所删除文件的痕迹，为火狐“除尘”，使其速度更快等。比免费更好，BleachBit 是一个开源软件。

### 在 Ubuntu 中安装 Bleachbit  ###

打开终端并运行如下命令：

```
sudo apt-get install bleachbit
```

### 一张截图 ###

![](http://www.ubuntugeek.com/wp-content/uploads/2015/01/6.png)

### 使用 Ubuntu-Tweak ###

最后，你也可以使用 [Ubuntu-Tweak][2] 来清理你的系统。

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/cleaning-up-a-ubuntu-gnulinux-system-updated-with-ubuntu-14-10-and-more-tools-added.html

作者：[ruchi][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.ubuntugeek.com/cleaning-up-all-unnecessary-junk-files-in-ubuntu.html
[2]:http://linux.cn/article-3335-1.html
