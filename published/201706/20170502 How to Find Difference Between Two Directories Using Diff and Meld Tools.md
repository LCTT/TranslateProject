怎么使用 Diff 和 Meld 工具发现两个目录间的不同之处
============================================================

在之前的一篇文章里，我们回顾了[ Linux 下 9 个最好的文件比较工具][1]，本篇文章中，我们将会描述在 Linux 下怎样找到两个目录之间的不同。

一般情况下，要在 Linux 下比较两个文件，我们会使用 `diff` （一个简单的源自 Unix 的命令行工具）来显示两个计算机文件的不同；它一行一行的去比较文件，而且很方便使用，在几乎全部的 Linux 发行版都预装了。

问题是在 Linux 下我们怎么才能比较两个目录？现在，我们想知道两个目录中哪些文件/子目录是共有的，哪些只存在一个于目录。

运行 diff 常规的语法如下：

```
$ diff [OPTION]… FILES
$ diff options dir1 dir2 
```

默认情况下，输出是按文件/子文件夹的文件名的字母排序的，如下面截图所示，在命令中， `-q` 开关是告诉 `diif` 只有在文件有差异时报告。

```
$ diff -q directory-1/ directory-2/
```
[
 ![Difference Between Two Directories](http://www.tecmint.com/wp-content/uploads/2017/05/Difference-Between-Two-Directories.png) 
][3]

*两个文件夹之间的差异*

再次运行 `diff` 并不能进入子文件夹，但是我们可以使用 `-r` 开关来读子文件夹，如下所示。

```
$ diff -qr directory-1/ directory-2/ 
```

### 使用 Meld 可视化比较和合并工具

`meld` 是一个很酷的图形化工具（一个 GNOME 桌面下的可视化的比较和合并工具），可供那些喜欢使用鼠标的人使用，可按如下来安装。

```
$ sudo apt install meld  [Debian/Ubuntu systems]
$ sudo yum install meld  [RHEL/CentOS systems]
$ sudo dnf install meld  [Fedora 22+]
```

一旦你安装了它之后，在 **Ubuntu Dash** 或者 **Linux Mint** 菜单搜索 “**meld**” ，或者 Fedora 或 CentOS 桌面的 Activities Overview，然后启动它。

你可以看到如下的 Meld 界面，可以选择文件或者文件夹来比较，此外还有版本控制视图。点击目录比较并移动到下个界面。
[
 ![Meld Comparison Tool](http://www.tecmint.com/wp-content/uploads/2017/05/Meld-Comparison-Tool.png) 
][4]

*Meld 比较工具*

选择你想要比较的文件夹，注意你可以勾选 “**3-way Comparison**” 选项，添加第三个文件夹。

[
 ![Select Comparison Directories](http://www.tecmint.com/wp-content/uploads/2017/05/Select-Comparison-Directories.png) 
][5]

*选择比较的文件夹*

选择好要比较的文件夹后，点击 “Compare”。
[
 ![Listing Difference Between +](http://www.tecmint.com/wp-content/uploads/2017/05/Listing-Difference-Between-Directories.png) 
][6]

*文件夹不同列表*

在这篇文章中，我们描述了怎么在 Linux 下找到两个文件夹的不同。如果你知道其他的命令或者图形界面工具，不要忘记在下方评论分享你们的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 爱好者，即将成为 Linux 系统管理员，Web 开发者，目前是 TecMint 的内容创建者，他喜欢使用电脑工作，并且非常相信分享知识。

-------------------

via: http://www.tecmint.com/compare-find-difference-between-two-directories-in-linux/

作者：[Aaron Kili][a]
译者：[hkurj](https://github.com/hkurj)
校对：[jasminepeng](https://github.com/jasminepeng)

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
