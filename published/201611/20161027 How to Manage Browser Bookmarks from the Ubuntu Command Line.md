如何在 Ubuntu 命令行下管理浏览器书签
=======

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-feature-image.jpg "How to Manage Browser Bookmarks from the Ubuntu Command Lines")

浏览器书签虽然不常被提及，但是作为互联网浏览的一部分。没有好的书签功能，网站链接可能会丢失，下次再不能访问。这就是为什么一个好的书签管理器很重要。

所有的现代浏览器都提供了一些形式的管理工具，虽然它们严格上来讲功能较少。如果你已经厌倦了这些内置在浏览器中的主流工具，你或许想要寻找一个替代品。这里介绍 **Buku**：一个命令行下的书签管理器。它不仅可以管理你的书签，还可以给它们加密，将它们保存在一个数据库中等等。下面是如何安装它。

### 安装

![buku-installing-buku-in-ubuntu](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-installing-buku-in-ubuntu.jpg "buku-installing-buku-in-ubuntu")

Buku 不是非常流行。因此，用户需要自己编译它。然而，在 Ubuntu 上安装实际上很简单。打开终端并且使用 apt 安装`git` 和 `python3`，这两个工具在构建中很关键。

```
sudo apt python3-cryptography python3-bs4
```

装完所需的工具后，就可以拉取源码了。

```
git clone https://github.com/jarun/Buku/.
cd Buku
```

最后要安装它，只需要运行 `make` 命令。在这之后就可以在终端中输入 `buku`来运行 Buku 了。

```
sudo make install
```

**注意**：虽然这份指导针对的是 Ubuntu，但是 Buku 可以在任何 Linux 发行版中用相似的方法安装。

### 导入书签

![buku-import-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-import-bookmarks.jpg "buku-import-bookmarks")

要将书签直接导入 Buku 中，首先从浏览器中将书签导出成一个 html 文件。接着，输入下面的命令：

```
buku -i bookmarks.html
```

最后，导入的书签会添加到 Buku 的数据库中。

### 导出书签

![buku-export-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-export-bookmarks.jpg "buku-export-bookmarks")

导出书签和导入一样简单。要导出所有的书签，使用下面的命令：

```
buku -e bookmarks.html
```

它会和其他书签管理器一样，将数据库中所有的书签导出成一个 html 文件。之后就可以用它做你任何要做的事情了！

### 打开书签

![buku-open-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-open-bookmarks.jpg "buku-open-bookmarks")

要打开一个书签，首先要搜索。这需要用 `-s` 选项。运行下面的命令来搜索：

```
buku -s searchterm
```

接着一旦找到匹配的结果，输入旁边的数字，书签将会在默认的浏览器中打开了。

### 加密

不像其他的书签管理器，Buku 可以加密你的数据。这对拥有“敏感”书签的用户而言很有用的功能。要加密数据库，使用 `-l` 标志来创建一个密码。

```
buku -l
```

![buku-encrypt-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-encrypt-bookmarks.jpg "buku-encrypt-bookmarks")

数据库加锁后，没有输入密码将不能打开书签。要解密它，使用 `-k` 选项。

```
buku -k
```

![buku-decrypt-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-decrypt-bookmarks.jpg "buku-decrypt-bookmarks")

### 其他功能

这个书签管理器有许多不同的功能。要了解其他的功能，使用 `--help` 选项。当使用这个选项后，所有的选项以及每个功能详细内容都会列出来。这个非常有用，由于用户经常忘记东西，并且有时可以打开一个备忘单也不错。

```
buku --help
```

![buku-list-options](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-list-options.jpg "buku-list-options")

### 总结

即使这个工具不是浏览器的一部分，它的功能比任何现在管理器提供的功能多。尽管事实是它在命令行中运行，但是也有很好的竞争力。书签对大部分人来言并不重要，但是哪些不喜欢现有选择以及喜欢 Linux 命令行的应该看一下 Buku。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/manage-browser-bookmarks-ubuntu-command-line/

作者：[Derrik Diener][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/manage-browser-bookmarks-ubuntu-command-line/#comments
[2]:https://www.maketecheasier.com/author/derrikdiener/
[3]:https://support.google.com/adsense/troubleshooter/1631343
[4]:https://www.maketecheasier.com/hidden-google-games/
[5]:https://www.maketecheasier.com/change-app-permissions-windows10/
[6]:mailto:?subject=How%20to%20Manage%20Browser%20Bookmarks%20from%20the%20Ubuntu%20Command%20Line&body=https%3A%2F%2Fwww.maketecheasier.com%2Fmanage-browser-bookmarks-ubuntu-command-line%2F
[7]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fmanage-browser-bookmarks-ubuntu-command-line%2F&text=How+to+Manage+Browser+Bookmarks+from+the+Ubuntu+Command+Line
[8]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fmanage-browser-bookmarks-ubuntu-command-line%2F
[9]:https://www.maketecheasier.com/category/linux-tips/
