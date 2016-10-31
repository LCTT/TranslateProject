如何在Ubuntu的命令行下管理浏览器书签
=======

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-feature-image.jpg "How to Manage Browser Bookmarks from the Ubuntu Command Lines")


浏览器数钱虽然不常被提及，但是作为浏览因特网的一部分。没有好的书签功能，网站可能会丢失，下次不能访问。这就是为什么一个好的书签管理器很重要。


所有的现代浏览器提供了一些形式的管理工具，虽然它们严格上来讲缺少功能。如果你已经厌倦了这些内置在浏览器中的主流工具，你或许想要寻找一个替代品。这里介绍**Buku**：一个命令行下的书签管理器。它不仅可以管理你的数钱，还可以给它们加密，保存在一个数据库中等等。下面是如何安装它。

### 安装

![buku-installing-buku-in-ubuntu](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-installing-buku-in-ubuntu.jpg "buku-installing-buku-in-ubuntu")

Buku不是非常流行。结果就是用户需要自己构建。然而，在Ubuntu上安装比它看上去简单得多。打开终端并且使用apt安装`git`和`python3`，这两个工具在构建中很关键。

```
sudo apt python3-cryptography python3-bs4
```

装完所需的工具后，就可以拉取源码了。

```
git clone https://github.com/jarun/Buku/.
cd Buku
```

最后要安装它，只需要运行make命令。在这之后就可以在终端中输入buku来运行Buku了。

```
sudo make install
```

**注意**：虽然这份指导针对的是Ubuntu，但是Buku可以在任何Linux发行版中用相似的方法安装。

### 导入书签

![buku-import-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-import-bookmarks.jpg "buku-import-bookmarks")

要将数钱直接导入buku中，首先从浏览器中将书签导出成一个html文件。接着，输入下面的命令：

```
buku -i bookmarks.html
```

最后，导入的书签会添加到Buku的数据库中。

### 导出书签

![buku-export-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-export-bookmarks.jpg "buku-export-bookmarks")

导出书签和导入一样简单。要导出所有的书签，使用下面的命令：

```
buku -e bookmarks.html
```

它会和其他书签管理器一样，将数据库中所有的书签导出成一个html文件。之后就可以用它做你任何要做的事情了！

### 打开书签

![buku-open-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-open-bookmarks.jpg "buku-open-bookmarks")

要打开一个书签，首先要搜索。这需要用`-s`标志。运行下面的命令来搜索：

```
buku -s searchterm
```

接着一旦找到匹配的结果，输入旁边的数字，书签将会在默认的浏览器中打开了。

### 加密

不像其他的书签管理器，Buku可以加密你的数据。这对拥有“敏感”书签的用户而言很有用的功能。要加密数据库，使用`-l`标志来创建一个密码。

```
buku -l
```

![buku-encrypt-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-encrypt-bookmarks.jpg "buku-encrypt-bookmarks")

数据库加锁后，没有输入密码将不能打开书签。要解密它，使用-k标志。

```
buku -k
```

![buku-decrypt-bookmarks](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-decrypt-bookmarks.jpg "buku-decrypt-bookmarks")

### 其他功能

这个书签管理器有许多不同的功能。要了解其他的功能，使用`--help`开关。当使用这个开关后，所有的开关和标志以及每个功能详细内容都会列出来。这个非常有用，由于用户经常忘记东西，并且有时可以打开一个备忘单也不错。

```
buku --help
```

![buku-list-options](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/buku-list-options.jpg "buku-list-options")

### 总结

即使这个工具不是浏览器的一部分，它的功能比任何现在管理器提供的功能多。尽管事实是它在命令行中运行，它也有一些激烈的竞争。书签对大部分人来言并不重要，但是哪些不喜欢现有选择以及喜欢Linux命令行的应该看一下Buku。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/manage-browser-bookmarks-ubuntu-command-line/?utm_medium=feed&utm_source=feedpress.me&utm_campaign=Feed%3A+maketecheasier

作者：[Derrik Diener][a]

译者：[geekpi](https://github.com/geekpi)

校对：[校对者ID](https://github.com/校对者ID)

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
