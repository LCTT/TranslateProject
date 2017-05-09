怎么使用Diff和Meld工具得到2个目录之间的不同之处呢
============================================================

在一个之前的一篇文章，我们回顾了[ Linux 下的 9 个最好的文件比较工具][1]在这片文章,我们将会描述在 Linux 下这么找到2个目录之间的不同。

一般,在Linux下比较2个文件,我们会使用diff (一个简单的原版的Unix命令行工具 )来显示2个计算机文件的不同;一行一行的去比较文件，而且很方便使用,几乎在全部的 Linux 发行版都预装了。

问题是在 Linux 下我们怎么才能比较2个目录的不同? 现在,我们想知道2个目录中那些文件/子目录是通用的,那些只存在一个目录。

运行diff常规的语法如下：

```
$ diff [OPTION]… FILES
$ diff options dir1 dir2 
```

默认情况下，输出是按文件/子文件夹的文件名的字母排序的，如下面截图所示，在这命令“-q”开关是告诉diif只有在文件有差异时报告。

```
$ diff -q directory-1/ directory-2/
```
[
 ![Difference Between Two Directories](http://www.tecmint.com/wp-content/uploads/2017/05/Difference-Between-Two-Directories.png) 
][3]

2个文件之间的差异

再次运行diff并不能进入子文件夹，但是我们可以使用'-r'开关和下面一样来读子文件夹。

```
$ diff -qr directory-1/ directory-2/ 
```

###使用Meld可视化的比较和合并工具

meld是一个很酷的图形化工具（一个GNOME桌面下的可视化的比较和合并工具）给那些喜欢使用鼠标的人，你们能根据下面来安装。

```
$ sudo apt install meld  [Debian/Ubuntu systems]
$ sudo yum install meld  [RHEL/CentOS systems]
$ sudo dnf install meld  [Fedora 22+]
```

一旦你安装了它之后，搜索“meld”在 Ubuntu Dash 或者 Linux Mint 菜单，也可以是Fedora或者CentOS桌面的Activities Overview，然后启动它。

你可以看到在下面看到Meld接口，你能和版本控制视图一样选择文件或者文件夹来比较。点击目录比较并移动到下个界面
[
 ![Meld Comparison Tool](http://www.tecmint.com/wp-content/uploads/2017/05/Meld-Comparison-Tool.png) 
][4]

Meld 比较工具

选择你想要比较的文件夹，注意你可以勾选“3-way Comparison”选项添加第3个文件夹。
[
 ![Select Comparison Directories](http://www.tecmint.com/wp-content/uploads/2017/05/Select-Comparison-Directories.png) 
][5]

选择比较的文件夹。

一旦你选择好了要比较的文件夹，点击 “Compare”。
[
 ![Listing Difference Between +](http://www.tecmint.com/wp-content/uploads/2017/05/Listing-Difference-Between-Directories.png) 
][6]

看结果出来了吧。

在这片文章我们描述了怎么在Linux下找到找出2个文件夹的不同。如果你知道其他的命令或者图形界面工具，不要忘记在下方评论分享你们的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个Linux和F.O.S.S爱好者，即将变成的Linux 系统管理员，Web开发者，目前是TecMint的内容创建者，他喜欢与电脑工作，并且非常相信分享知识。

-------------------

via: http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/best-linux-file-diff-tools-comparison/
[2]:http://www.tecmint.com/freefilesync-compare-synchronize-files-in-ubuntu/
[3]:http://www.tecmint.com/wp-content/uploads/2017/05/Difference-Between-Two-Directories.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/05/Meld-Comparison-Tool.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/05/Select-Comparison-Directories.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/05/Listing-Difference-Between-Directories.png
[7]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[8]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[9]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[10]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#
[11]:http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/#comments
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/
