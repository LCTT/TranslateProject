Linux 新手必知必会的 10 条 Linux 基本命令
=====================================================================

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/4225072_orig.png)


Linux 对我们的生活产生了巨大的冲击。至少你的安卓手机使用的就是 Linux 核心。尽管如此，在第一次开始使用 Linux 时你还是会感到难以下手。因为在 Linux 中，通常需要使用终端命令来取代 Windows 系统中的点击启动图标操作。但是不必担心，这里我们会介绍 10 个 Linux 基本命令来帮助你开启 Linux 神秘之旅。


### 帮助新手走出第一步的 10 个 Linux 基本命令

当我们谈论 Linux 命令时，实质上是在谈论 Linux 系统本身。这短短的 10 个 Linux 基本命令不会让你变成天才或者 Linux 专家，但是能帮助你轻松开始 Linux 之旅。使用这些基本命令会帮助新手们完成 Linux 的日常任务，由于它们的使用频率如此至高，所以我更乐意称他们为 Linux 命令之王！

让我们开始学习这 10 条 Linux 基本命令吧。


#### 1. sudo

这条命令的意思是“以超级用户的身份执行”，是 SuperUserDo 的简写，它是新手将要用到的最重要的一条 Linux 命令。当一条单行命令需要 root 权限的时候，`sudo`命令就派上用场了。你可以在每一条需要 root 权限的命令前都加上`sudo`。

```
$ sudo su
```


#### 2. ls (list)


跟其他人一样，你肯定也经常想看看目录下都有些什么东西。使用列表命令，终端会把当前工作目录下所有的文件以及文件夹展示给你。比如说，我当前处在 /home 文件夹中，我想看看 /home 文件夹中都有哪些文件和目录。

```
/home$ ls
```


在 /home 中执行`ls`命令将会返回类似下面的内容：

```
imad lost+found
```


#### 3. cd

变更目录命令（cd）是终端中总会被用到的主要命令。它是最常用到的 Linux 基本命令之一。此命令使用非常简单，当你打算从当前目录跳转至某个文件夹时，只需要将文件夹键入此命令之后即可。如果你想跳转至上层目录，只需要在此命令之后键入两个点 (..) 就可以了。
​
举个例子，我现在处在 /home 目录中，我想移动到 /home 目录中的 usr 文件夹下，可以通过以下命令来完成操作。

```
/home $ cd usr

/home/usr $
```


#### 4. mkdir

只是可以切换目录还是不够完美。有时候你会想要新建一个文件夹或子文件夹。此时可以使用 mkdir 命令来完成操作。使用方法很简单，只需要把新的文件夹名跟在 mkdir 命令之后就好了。

```
~$ mkdir folderName
```


#### 5. cp

拷贝-粘贴（copy-and-paste）是我们组织文件需要用到的重要命令。使用 `cp` 命令可以帮助你在终端当中完成拷贝-粘贴操作。首先确定你想要拷贝的文件，然后键入打算粘贴此文件的目标位置。

```
$ cp src des
```

注意：如果目标目录对新建文件需要 root 权限时，你可以使用 `sudo` 命令来完成文件拷贝操作。


#### 6. rm

rm 命令可以帮助你移除文件甚至目录。如果不希望每删除一个文件都提示确认一次，可以用`-f`参数来强制执行。也可以使用 `-r` 参数来递归的移除文件夹。

```
$ rm myfile.txt
```


#### 7. apt-get

这个命令会依据发行版的不同而有所区别。在基于 Debian 的发行版中，我们拥有 Advanced Packaging Tool（APT）包管理工具来安装、移除和升级包。apt-get 命令会帮助你安装需要在 Linux 系统中运行的软件。它是一个功能强大的命令行，可以用来帮助你对软件执行安装、升级和移除操作。

在其他发行版中，例如 Fedora、Centos，都各自不同的包管理工具。Fedora 之前使用的是 yum，不过现在 dnf 成了它默认的包管理工具。

```
$ sudo apt-get update

$ sudo dnf update
```


#### 8. grep

当你需要查找一个文件，但是又忘记了它具体的位置和路径时，`grep` 命令会帮助你解决这个难题。你可以提供文件的关键字，使用`grep`命令来查找到它。

```
$ grep user /etc/passwd
```


#### 9. cat

作为一个用户，你应该会经常需要浏览脚本内的文本或者代码。`cat`命令是 Linux 系统的基本命令之一，它的用途就是将文件的内容展示给你。

```
$ cat CMakeLists.txt
```


#### 10. poweroff

最后一个命令是 `poweroff`。有时你需要直接在终端中执行关机操作。此命令可以完成这个任务。由于关机操作需要 root 权限，所以别忘了在此命令之前添加`sudo`。

```
$ sudo poweroff
```


### 总结

如我在文章开始所言，这 10 条命令并不会让你立即成为一个 Linux 大拿，但它们会让你在初期快速上手 Linux。以这些命令为基础，给自己设置一个目标，每天学习一到三条命令，这就是此文的目的所在。在下方评论区分享有趣并且有用的命令。别忘了跟你的朋友分享此文。


--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/10-basic-linux-commands-that-every-linux-newbies-should-remember

作者：[Commenti][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxandubuntu.com/home/10-basic-linux-commands-that-every-linux-newbies-should-remember#comments
[1]: http://linuxandubuntu.com/home/category/linux
