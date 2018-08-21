
如何确定你的Linux发行版中有没有某个软件包
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/Whohas-720x340.png)


有时，你可能会想知道如何在你的Linux发行版上寻找一个特定的软件包。或者，你仅仅只是想知道安装在你的Linux上的软件包有什么版本。如果这就是你想知道的信息，你今天走运了。我正好知道一个小工具能帮你抓到上述信息，下面隆重推荐--'Whohas'：这是一个命令行工具，它能一次查询好几个软件包列表，以检查的你软件包是否存在。目前，whohas支持Arch， Debian， Fedora， Gentoo, Mandriva， openSUSE， Slackware， Source Mage， Ubuntu， FreeBSD， NetBSD， OpenBSD（LCTT译注：*BSD不是Linux）， Fink， MacPorts 和Cygwin. 使用这个小工具，软件包的维护者能轻而易举从别的Linux发行版里找到ebuilds, pkgbuilds 等等类似的包定义文件。
'Whohas'是用Perl语言开发的免费，开源的工具。

###在你的Linux中寻找一个特定的包

**安装 Whohas**


Whohas 在Debian, Ubuntu, Linux Mint的默认软件仓库里提供。如果你正在使用某种基于DEB的系统， 你可以用如下命令安装：

```
$ sudo apt-get install whohas

```

对基于Arch的系统，[**AUR**][1]里就有提供whohas。你能使用任何的ARU助手程序来安装。


使用 [**Packer**][2]:

```
$ packer -S whohas

```

或使用[**Trizen**][3]:


```
$ trizen -S whohas

```

使用[**Yay**][4]:

```
$ yay -S whohas

```

使用[**Yaourt**][5]:

```
$ yaourt -S whohas

```


在别的Linux发行版上，从[**here**][6]下载源代码并手工编译安装。

**使用方法**



Whohas的主要目标是想让你知道：


  * 哪个Linux发布版提供了用户依赖的包。
  * 对于各个Linux发行版，指定的软件包是什么版本，或者在这个Linux发行版的各个不同版本上，指定的软件包是什么版本。



让我们试试看上面的的功能，比如说，哪个Linux发行版里有**vim**这个软件？我们可以运行如下命令：

```
$ whohas vim

```


这个命令将会显示所有包含可安装的vim的Linux发行版的信息，包括包的大小，仓库地址和下载URL。

![][8]


你甚至可以通过管道将输出的结果按照发行版的字母排序，只需加入‘sort’ 命令即可。

```
$ whohas vim | sort

```


请注意上述命令将会显示所有以**vim**开头的软件包，包括vim-spell,vimcommander, vimpager等等。你可以继续使用Linux的grep命令在vim的前后加上空格来缩小你的搜索范围，直到满意为止。

```
$ whohas vim | sort | grep " vim"

$ whohas vim | sort | grep "vim "

$ whohas vim | sort | grep " vim "

```


所有将空格放在包名字前面的搜索将会显示以包名字结尾的包。所有将空格放在包名字后面的搜索将会显示以包名字开头的包。前后都有空格将会严格匹配。


又或者，你就使用‘--strict’来严格限制结果。

```
$ whohas --strict vim

```


有时，你想知道一个包在不在一个特定的Linux发行版里。例如，你想知道vim是否在Arch Linux里，请运行：


```
$ whohas vim | grep "^Arch"

```

（LCTT译注：在结果里搜索以Arch开头的Linux）


Linux发行版的命名缩写为:'archlinux', 'cygwin', 'debian', 'fedora', 'fink', 'freebsd', 'gentoo', 'mandriva', 'macports', 'netbsd', 'openbsd', 'opensuse', 'slackware', 'sourcemage'和‘ubuntu’。


你也可以用**-d**选项来得到同样的结果。


```
$ whohas -d archlinux vim

```


这个命令将在仅仅Arch Linux发行版下搜索vim包。


如果要在多个Linux发行版下搜索，如’arch linux‘,'ubuntu',请使用如下命令。


```
$ whohas -d archlinux,ubuntu vim

```


你甚至可以用‘whohas’来查找哪个发行版有'whohas'包。

```
$ whohas whohas

```

更详细的信息，请参照手册。

```
$ man whohas

```

**最后的话**


当然，任何一个Linux发行版的包管理器都能轻松的在对应的软件仓库里找到自己管理的包。不过, whohas帮你整合并比较了在不同的Linux发行版下指定的软件包信息，这样你能轻易的跨平台之间进行比较。试一下whohas，你一定不会失望的。


好了，今天就到这里吧，希望前面讲的对你有用，下次我还会带来更多好东西！！


欧耶！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-if-a-package-is-available-for-your-linux-distribution/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[DavidChenLiang](https://github.com/davidchenliang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/whohas/
[2]:https://www.ostechnix.com/install-packer-arch-linux-2/
[3]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[4]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]:https://www.ostechnix.com/install-yaourt-arch-linux/
[6]:http://www.philippwesche.org/200811/whohas/intro.html
[7]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]:http://www.ostechnix.com/wp-content/uploads/2018/06/whohas-1.png
