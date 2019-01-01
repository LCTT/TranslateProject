在 Linux 手册页中查看整个 Arch Linux Wiki
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/arch-wiki-720x340.jpg)

不久之前，我写了篇关于一个名叫 [arch-wiki-cli][1] 的命令行脚本的文章，使用它可以在终端命令行中查看 Arch Linux Wiki。使用这个脚本，你可以很轻松的用你喜欢的文本浏览器查看整个 Arch Wiki 网站。显然，使用这个脚本需要你有网络连接。我今天偶然发现了一个名为 Arch-wiki-man 的程序，与其有着相同的功能。就跟名字说的一样，它可以让你在命令行查看 Arch Wiki，但是无需联网。它可以以手册页的形式为你显示来自 Arch Wiki 的任何文章。它会下载整个 Arch Wiki 到本地，并每两天自动推送一次。因此，你的系统上总能有一份 Arch Wiki 最新的副本。

### 安装 Arch-wiki-man

Arch-wiki-man 在 [AUR][2] 中可用，所以你可以通过类似[Yay][3] 的 AUR 帮助程序安装它。

```
$ yay -S arch-wiki-man
```

另外，它也可以使用 NPM 安装。首先确保你已经[安装了 NoodJS][4]，然后使用以下命令安装它。  

```
$ npm install -g arch-wiki-man
```

### 以手册页的形式查看整个 Arch Wiki 

Arch-wiki-man 的典型语法如下：  

```
$ awman <search-query>
```

下面看一些具体的例子：  

#### 搜索一个或多个匹配项

只需要下面的命令，就可以搜索 [Arch Linux 安装指南][5]。  

```
$ awman Installation guide
```

上面的命令将会从 Arch Wiki 中搜索所有包含 “Installation guide” 的条目。如果对于给出的搜索条目有很多的匹配项，将会展示为一个选择菜单。使用上下方向键或是 Vim 风格的方向键（`j`/`k`），移动到你想查看的指南上，点击回车打开。然后就会像下面这样，以手册页的形式展示指南的内容。  

![][6]

awman 指的是 arch wiki man 的首字母组合。  

它支持手册页的所有操作，所以你可以像使用手册页一样使用它。按 `h` 查看帮助选项。  

![][7]

要退出选择菜单而不显示手册页，只需要按 `Ctrl+c`。  

输入 `q` 返回或者/并且退出手册页。

#### 在标题或者概述中搜索匹配项

awman 默认只会在标题中搜索匹配项。但是你也可以指定它同时在标题和概述中搜索匹配项。  

```
$ awman -d vim
```

或者，

```
$ awman --desc-search vim
```

#### 在目录中搜索匹配项

不同于在标题和概述中搜索匹配项，它也能够扫描整个内容以匹配。不过请注意，这样将会使搜索进程明显变慢。  

```
$ awman -k emacs
```

或者，

```
$ awman --apropos emacs
```

#### 在 web 浏览器中打开搜索结果

如果你不想以手册页的形式查看 Arch Wiki 指南，你也可以像下面这样在 web 浏览器中打开它。  

```
$ awman -w pacman
```

或者，

```
$ awman --web pacman
```

这条命令将会在 web 浏览器中打开匹配结果。请注意，使用这个选项需要网络连接。  

#### 在其他语言中搜索

awman 默认打开的是英文的 Arch Wiki 页面。如果你想用其他的语言查看搜索结果，例如西班牙语，只需要像这样做：  

```
$ awman -l spanish codecs
```

![][8]

使用以下命令查看可用的语言：  

```
$ awman --list-languages
```

#### 升级本地的 Arch Wiki 副本

就像我已经说过的，更新会每两天自动推送一次。或者你也可以使用以下命令手动更新。  

```
$ awman-update
arch-wiki-man@1.3.0 /usr/lib/node_modules/arch-wiki-man
└── arch-wiki-md-repo@0.10.84

arch-wiki-md-repo has been successfully updated or reinstalled.
```

：）


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-browse-and-read-entire-arch-wiki-as-linux-man-pages/

作者：[SK][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/search-arch-wiki-website-commandline/
[2]: https://aur.archlinux.org/packages/arch-wiki-man/
[3]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://www.ostechnix.com/install-node-js-linux/
[5]: https://www.ostechnix.com/install-arch-linux-latest-version/
[6]: http://www.ostechnix.com/wp-content/uploads/2018/10/awman-1.gif
[7]: http://www.ostechnix.com/wp-content/uploads/2018/10/awman-2.png
[8]: https://www.ostechnix.com/wp-content/uploads/2018/10/awman-3-1.png
