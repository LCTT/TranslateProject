bd：快速返回某级父目录而不用冗余地输入 “cd ../../..”
============================================================

在 Linux 系统上通过命令行切换文件夹时，为了回到父目录（长路径），我们通常会重复输入 [cd 命令][1]（`cd ../../..`），直到进入感兴趣的目录。

对于经验丰富的 Linux 用户或需要进行各种不同任务的系统管理员而言，这可能非常乏味，因此希望在操作系统时有一个快捷方式来简化工作。

**建议阅读：** [Autojump - 一个快速浏览 Linux 文件系统的高级 “cd” 命令][2]

在本文中，我们将在 bd 工具的帮助下，用这个简单而有用的工具快速回到 Linux 中的父目录。

bd 是用于切换文件夹的便利工具，它可以使你快速返回到父目录，而不必重复键入 `cd ../../..` 。 你可以可靠地将其与其他 Linux 命令组合以执行几个日常操作。

### 如何在 Linux 中安装 bd

运行下面的命令，使用 [wget 命令][3]下载并安装 bd 到 `/usr/bin/` 中，添加执行权限，并在 `~/.bashrc` 中创建需要的别名：

```
$ wget --no-check-certificate -O /usr/bin/bd https://raw.github.com/vigneshwaranr/bd/master/bd
$ chmod +rx /usr/bin/bd
$ echo 'alias bd=". bd -si" >> ~/.bashrc
$ source ~/.bashrc
```

注意：如果要启用大小写敏感的目录名匹配，请在上面创建的别名中，设置  `-s` 标志而不是 `-si` 标志。

要启用自动补全支持，运行这些命令：

```
$ sudo wget -O /etc/bash_completion.d/bd https://raw.github.com/vigneshwaranr/bd/master/bash_completion.d/bd
$ sudo source /etc/bash_completion.d/bd
```

#### 如何在 Linux 中使用 bd

假设你目前在这个路径的顶层目录：

```
/media/aaronkilik/Data/Computer Science/Documents/Books/LEARN/Linux/Books/server $ 
```

你想要快速进入 “Documents” 目录，只要输入：

```
$ bd Documents
```

接着直接进入到 Data 目录，你可以输入：

```
$ bd Data
```
[
 ![Switch Between Directories Quickly](http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Between-Directories-Quickly.png) 
][4]

*目录间快速切换*

实际上，bd 让它变得更加直接，你要做的是输入 “bd <开头几个字母>”，比如：

```
$ bd Doc
$ bd Da
```
[
 ![Quickly Switch Directories](http://www.tecmint.com/wp-content/uploads/2017/03/Quickly-Switch-Directories.png) 
][5]

*快速切换目录*

重要：如果层次结构中有不止一个具有相同名称的目录，bd 将会移动到最接近的目录，而不考虑最近的父目录，如下面的例子那样。

例如，在上面的路径中，有两个名称相同的目录 Books，如果你想移动到：

```
/media/aaronkilik/Data/ComputerScience/Documents/Books/LEARN/Linux/Books
```

输入 `bd Books` 会进入：

```
/media/aaronkilik/Data/ComputerScience/Documents/Books
```
[
 ![Move to 'Books' Directory Quickly](http://www.tecmint.com/wp-content/uploads/2017/03/Move-to-Directory-Quickly.png) 
][6]

*快速进入 ‘Books’ 目录*

另外，在引号中使用 bd 如 ``bd <开头几个字母>`` 会打印出路径而不更改当前目录，所以你可以与其他常见的 Linux 命令，如 [ls][7]，[echo][8] 等一起使用 ``bd <开头几个字母>`` 。

在下面的例子中，当前在 `/var/www/html/internship/assets/filetree` 目录中，要打印出绝对路径、详细列出内容、统计目录 html 中所有文件的大小，你不必进入它，只需要键入：

```
$ echo `bd ht`
$ ls -l `bd ht`
$ du -cs `bd ht`
```
[
 ![Switch Directory with Listing](http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Directory-with-Listing.png) 
][9]

*列出切换的目录*

要在 Github 上了解更多关于 bd 的信息：[https://github.com/vigneshwaranr/bd][10]

就是这样了！在本文中，我们展示了使用 bd 程序[在 Linux 中快速切换文件夹][11]的便捷方法。

通过下面的反馈栏单发表你的看法。此外，你还知道其他类似的工具么，在评论中让我们知道。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili是一名 Linux 和 F.O.S.S 的爱好者，未来的 Linux 系统管理员、网站开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并乐于分享知识。

---------------

via: http://www.tecmint.com/bd-quickly-go-back-to-a-linux-parent-directory/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/cd-command-in-linux/
[2]:https://linux.cn/article-5983-1.html
[3]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Between-Directories-Quickly.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Quickly-Switch-Directories.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Move-to-Directory-Quickly.png
[7]:http://www.tecmint.com/tag/linux-ls-command/
[8]:http://www.tecmint.com/echo-command-in-linux/
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Switch-Directory-with-Listing.png
[10]:https://github.com/vigneshwaranr/bd
[11]:https://linux.cn/article-5983-1.html
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/
