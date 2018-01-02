学习如何高效地使用 man 页
======

不久前，我们发布了一篇简短的指引描述了如何轻易地[回忆起忘记的 Linux 命令 ][1]。那篇指引对于无法记住命令的人来说真的非常有用。今天，我们就来学习一下如何高效而又迅速地从 man 页中获取你所需要的信息。如你所知，一个标准的 man 页分成很多个部分，每部分都有一个独立的标题。当你想查看特定的标志/选项时，可能需要向下滚动很长时间才能找到。这是个效率底下而且很耗时间的过程。这也是为什么学会高效使用 man 页来精确定位你想要的内容。

在本文中，我会分享一些常用的跟 man 页相关的重要技巧。

### 学习高效地使用 Man 页

#### 基础用法

我们都知道，我们可以使用类似下面的命令来打开关于某个命令（比如 `mkdir`）的 man 页：

```
man mkdir
```

可以使用 `空格`，`d`，`b` 以及上下箭头等来浏览 man 页。要跳转道 man 页的末尾，可以按 `End` 键而想跳转到 man 页的头部则可以按 `Home` 键。在当前打开的 man 页中按下 `h` 键会显示所有有用的键盘快捷键和一般用法。（LCTT 译注：这些快捷键其实是 man 所使用的 less 分页器的快捷键）

![][3]

按 `q` 可以退出 man 页。

#### 回忆起忘记的命令

对于那些不知道想要哪个命令的家伙，可以去查看一下我第一段中提到的那个链接。使用 man 页我们也能做到这一点。假设说，你想要创建一个目录，而你忘记了使用哪个命令来创建目录。

为了回忆起那个忘记的命令，可以将 man 和 `grep` 命令联用：

```
man -k directory | grep create
```

输出结果为：

```
CURLOPT_NEW_DIRECTORY_PERMS (3) - permissions for remotely created directories
libssh2_sftp_mkdir_ex (3) - create a directory on the remote file system
mkdir (2) - create a directory
mkdirat (2) - create a directory
mkdtemp (3) - create a unique temporary directory
mkdtemp (3p) - create a unique directory or file
mkfontdir (1) - create an index of X font files in a directory
mklost+found (8) - create a lost+found directory on a mounted Linux second extended file。。。
mkstemp (3p) - create a unique directory
mktemp (1) - create a temporary file or directory
pam_mkhomedir (8) - PAM module to create users home directory
```

![][4]

你只需要阅读一下每个命令的描述然后挑选出合适的命令就行了。啊，现在你记起来了。`mkdir` 正式你想要的，对吧？就是那么简单。

#### 在 man 页中搜索

若你在 man 页中想要查找特定字符串。只需要输入 `/` （前斜线）再加上你想要搜索的字符串，像这样：

```
/<search_string> 或 <pattern>
```

假设你正在查看 `mount` 命令的 man 页，想要寻找关于 `-bind` 选项的相关信息。可以输入：

```
/bind
```

![][5]

当前 man 页中任何匹配搜索字符串的内容都会被高亮显示。

![][6]

按下 `n` 和 `SHIFT+n` 来查看下一个/上一个匹配的地方。

`/` 模式（或者说字符串）会向前搜索匹配行。你也可以使用 `?` 模式进行向后搜索。这当你在 man 页的末尾或中间位置时非常有用。

```
?bind
```

若想只显示匹配行，输入：

```
&bind
```

![][7]

使用这种方法，你无需使用 `n` 和 `SHIFT+n` 来滚动到下一个/上一个匹配的位置。`&` 模式只会显示那些包含搜索内容的行，其他的内容全都被省略掉。

#### 不打开 man 页而进行搜索

也可以在不打开 man 页的前提下搜索指定选项的信息。

比如，你想了解 `mkdir` 命令中的 `-m` 选项的相关信息。可以运行：

```
man mkdir | grep -e '-m'
```

或者，

```
man mkdir | grep -- '-m'
```

![][8]

这个命令会显示出 `mkdir` 命令 man 页中第一次出现 `-m` 时的内容。从上面命令中我们可以看到 `-m` 表示的是 “MODE”（`chmod`）。

如果你想阅读 `mkdir` 命令的完整 man 页，但是要跳过第一次出现 `-m` 之前的内容，可以使用下面命令：

```
man mkdir | less +/-m
```

![][9]

这是另一个例子：

```
man mount | less +/--bind
```

![][10]

按下 `n` 或 `SHIFT+n` 可以浏览下一个/上一个匹配的位置。

参考阅读：[每个 Linux 用户都应该知道的 3 个 man 页替代品][11]。

#### 将完整的 man 页导出到文本文件中

我们可以将指定命令的完整 man 页导出成文本文件。方法是运行下面命令：

```
man mount > mount.txt
```

该命令会将 `mount` 命令的 man 页导出到当前目录的 `mount.txt` 文件中。

也可以获取一个简化版的 man 页，没有退格和下划线，方法是使用下面命令。

```
man mount | col -b > mount.txt
```

要了解更多关于 man 页的详细信息，运行：

```
man man
```

该命令会显示出关于 man 的 man 页。这些技巧都很基础但很实用。它们会节省你很多的时间而且能免去很多的滚动操作。

今天的内容就到这了。希望对你有帮助。更多好文即将到来。准备好哦！

Cheers！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/learn-use-man-pages-efficiently/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/easily-recall-forgotten-linux-commands/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-4.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-3.png
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-5.png
[6]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-6.png
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-8.png
[8]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-1.png
[9]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-2-1.png
[10]:http://www.ostechnix.com/wp-content/uploads/2017/12/man-pages-7.png
[11]:https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
