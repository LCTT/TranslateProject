Pick：一款 Linux 上的命令行模糊搜索工具
======

![](https://www.ostechnix.com/wp-content/uploads/2017/09/search-720x340.jpg)

今天，我们要讲的是一款有趣的命令行工具，名叫 Pick。它允许用户通过 ncurses(3X) 界面来从一系列选项中进行选择，而且还支持模糊搜索的功能。当你想要选择某个名字中包含非英文字符的目录或文件时，这款工具就很有用了。你根本都无需学习如何输入非英文字符。借助 Pick，你可以很方便地进行搜索、选择，然后浏览该文件或进入该目录。你甚至无需输入任何字符来过滤文件/目录。这很适合那些有大量目录和文件的人来用。

### 安装 Pick

对 Arch Linux 及其衍生品来说，Pick 放在 [AUR][1] 中。因此 Arch 用户可以使用类似 [Pacaur][2]，[Packer][3]，以及 [Yaourt][4] 等 AUR 辅助工具来安装它。

```
pacaur -S pick
```

或者，

```
packer -S pick
```

或者，

```
yaourt -S pick
```

Debian，Ubuntu，Linux Mint 用户则可以通过运行下面命令来安装 Pick。

```
sudo apt-get install pick
```

其他的发行版则可以从[这里][5]下载最新的安装包，然后按照下面的步骤来安装。在写本指南时，其最新版为 1.9.0。

```
wget https://github.com/calleerlandsson/pick/releases/download/v1.9.0/pick-1.9.0.tar.gz
tar -zxvf pick-1.9.0.tar.gz
cd pick-1.9.0/
```

使用下面命令进行配置：

```
./configure
```

最后，构建并安装 Pick：

```
make
sudo make install
```

### 用法

通过将它与其他命令集成能够大幅简化你的工作。我这里会给出一些例子，让你理解它是怎么工作的。

让们先创建一堆目录。

```
mkdir -p abcd/efgh/ijkl/mnop/qrst/uvwx/yz/
```

现在，你想进入目录 `/ijkl/`。你有两种选择。可以使用 `cd` 命令：

```
cd abcd/efgh/ijkl/
```

或者，创建一个[快捷方式][6] 或者说别名指向这个目录，这样你可以迅速进入该目录。

但，使用 `pick` 命令则问题变得简单的多。看下面这个例子。

```
cd $(find . -type d | pick)
```

这个命令会列出当前工作目录下的所有目录及其子目录，你可以用上下箭头选择你想进入的目录，然后按下回车就行了。

像这样：

![][8]

而且，它还会根据你输入的内容过滤目录和文件。比如，当我输入 “or” 时会显示如下结果。

![][9]

这只是一个例子。你也可以将 `pick` 命令跟其他命令一起混用。

这是另一个例子。

```
find -type f | pick | xargs less
```

该命令让你选择当前目录中的某个文件并用 `less` 来查看它。

![][10]

还想看其他例子？还有呢。下面命令让你选择当前目录下的文件或目录，并将之迁移到其他地方去，比如这里我们迁移到 `/home/sk/ostechnix`。

```
mv "$(find . -maxdepth 1 |pick)" /home/sk/ostechnix/
```

![][11]

通过上下按钮选择要迁移的文件，然后按下回车就会把它迁移到 `/home/sk/ostechnix/` 目录中的。

![][12]

从上面的结果中可以看到，我把一个名叫 `abcd` 的目录移动到 `ostechnix` 目录中了。

使用方式是无限的。甚至 Vim 编辑器上还有一个叫做 [pick.vim][13] 的插件让你在 Vim 中选择更加方便。

要查看详细信息，请参阅它的 man 页。

```
man pick
```

我们的讲解至此就结束了。希望这款工具能给你们带来帮助。如果你觉得我们的指南有用的话，请将它分享到您的社交网络上，并向大家推荐我们。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pick-commandline-fuzzy-search-tool-linux/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/pick/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/install-yaourt-arch-linux/
[5]:https://github.com/calleerlandsson/pick/releases/
[6]:https://www.ostechnix.com/create-shortcuts-frequently-used-directories-shell/
[7]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_001-3.png
[9]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_002-1.png
[10]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_004-1.png
[11]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_005.png
[12]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_006-1.png
[13]:https://github.com/calleerlandsson/pick.vim/
