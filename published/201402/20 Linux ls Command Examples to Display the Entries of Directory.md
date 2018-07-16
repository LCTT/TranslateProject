ls命令的20个实用范例
================================================================================
Linux中一个基本命令是ls。没有这个命令，我们会在浏览目录条目时会遇到困难。这个命令必须被每个学习Linux的人知道。

### ls是什么 ###

ls命令用于列出文件和目录。默认上，他会列出当前目录的内容。带上参数后，我们可以用ls做更多的事情。这里是一些在日常操作中使用到的ls用法的示例。

#### 1. 不带参数运行ls ####

不带参数运行ls会只列出文件或者目录。看不到其他信息输出（译注：有时候你发现无参数的ls命令和这里描述的不同，那有可能是你的ls命令实际上带参数的ls别名）。

    $ ls

![](http://linoxide.com/wp-content/uploads/2014/01/ls.png)

#### 2. 使用长清单模式 ####

使用-l字符(小写L字符),会显示当前目录内容的长列表。在接下来的例子中，我们会结合-l参数(这个参数经常使用)来得到更好的结果。

    $ ls -l

![](http://linoxide.com/wp-content/uploads/2014/01/ls_l.png)

这里是如何读取输出 :

- **第1列**
	- 第一个字母**d**意味着内容是目录或者文件。在上面的截图中，Desktop、 Documents、 Downloads 和 lynis-1.3.8是目录。如果是'-'(**减号**)，这意味着它的内容是文件。当它是l(**小写l字符**)，意味这内容是链接文件。

	- 下面的9个字符是关于文件权限。**前3个rwx**字符是文件的拥有者的权限，**第二组3rwx**是文件的所有组的权限，**最后的rwx**是对其他人访问文件的权限。

- **第2列**
这行告诉我们有多少链接指向这个文件。

- **第3列**
这行告诉我们谁是这个文件/文件夹的所有者。

- **第4列**
这行告诉我们谁是这个文件/文件夹的所有组。

- **第5列**
这行告诉我们这个文件/文件夹的以字节为单位的大小。 目录的大小总是4096字节。

- **第6列**
这告诉我们文件最后的修改时间。

- **第7列**
这告诉我们文件名或者目录名。

#### 3. 显示文件大小 ####

以字节为单位看大小可能会不方便。6.5M读起来比6727680字节更简单。要这么做，我们可以使用-h与**-l**结合的参数。**-h参数意味着便于人识别**。

    $ ls -lh

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lh1.png)

另外一个可以这么做的参数是**--si**。这个参数和-h参数类似，但是**-si以1000为单位，而-h以1024为单位**。

    $ ls -si

![](http://linoxide.com/wp-content/uploads/2014/01/ls_si.png)

#### 4. 排序文件大小 ####

在我们可以显示文件大小之后，我们希望以文件大小排序。我们可以使用-S参数来这么做。这列表会从大到校排序。

    $ ls -lhS

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lhS.png)

#### 5. 测量大小 ####

ls可以通过使用**-block-size=SIZE**改单位大小。这里的SIZE是：

    K = Kilobyte
    M = Megabyte
    G = Gigabyte
    T = Terabyte
    P = Petabyte
    E = Exabyte
    Z = Zettabyte
    Y = Yottabyte

比如，我们希望使用MB作为单位大小。所以语法就会像这样:

    $ ls -l --block-size=M

![](http://linoxide.com/wp-content/uploads/2014/01/ls_block_size.png)

#### 6. 显示隐藏文件 ####

在Linux中，以"."(**点号**)开头的文件是隐藏文件。为了在ls命令中显示它，我们可以使用**-a**选项。

    $ ls -a

![](http://linoxide.com/wp-content/uploads/2014/01/ls_a.png)

#### 7. 只列出目录条目 ####

如果我们希望只列出目录，我们可以使用**-d**选项。

    $ ls -d */

![](http://linoxide.com/wp-content/uploads/2014/01/ls_d.png)

#### 8. 不打印所有者信息 ####

要这么做，我们使用**-g**选项。

    $ ls -g

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lg.png)

#### 9. 不打印组信息 ####

-g隐藏了拥有者信息，**—G**会隐藏组信息。


    $ ls -lG

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lG2.png)

#### 10. 打印UID和GID ####

如果你想以数字方式列出项的所有者和所有组（即UID和GID），我们可以带**-n**选项使用ls命令。这里是个例子。

    $ ls -n

![](http://linoxide.com/wp-content/uploads/2014/01/ls_n.png)

从上面的例子中，我们知道**用户pungki的UID**是100，**GID是1000**，而**root组的GID是0**。

#### 11. 不带颜色打印 ####

一些Linux发行版已经对ls命令启用彩色。这会使ls以各种颜色打印列表。如果你不想要这样，你可以使用 **--color=never** 参数。

    $ ls --color=never

![](http://linoxide.com/wp-content/uploads/2014/01/ls_color_never.png)

#### 12. 打印每个文件的索引号 ####

为了打印索引或者大家俗称的inode号，我们可以使用-i选项。索引号会显示在第一列。

    $ ls -li

![](http://linoxide.com/wp-content/uploads/2014/01/ls_inode.png)

#### 13. 增加 / (斜线) 标记目录 ####

要这么做，使用**-p选项**。

    $ ls -p

![](http://linoxide.com/wp-content/uploads/2014/01/ls_p.png)

#### 14. 排序时反转顺序 ####

你或许需要在列出条目时反转顺序。要这么做，你可以使用**-r**选项。

    $ ls -r

![](http://linoxide.com/wp-content/uploads/2014/01/ls_r.png)

#### 15. 递归列出子目录 ####

带**-R**参数后，你可以列出包含它子目录的目录。

    $ ls -R

![](http://linoxide.com/wp-content/uploads/2014/01/ls_Recursive.png)

#### 16. 扩展名排序 ####

你可以使用-X参数或者--sort=extension来通过扩展名来排序（译注：这样对于筛选不同类型的文件很有用）。

    $ ls -lX

**或**

    $ ls --sort=extension

![](http://linoxide.com/wp-content/uploads/2014/01/ls_x.png)

#### 17. 通过修改时间列出 ####

使用-t选项会按修改时间排序，新的文件在前。

    $ ls -lt

![](http://linoxide.com/wp-content/uploads/2014/01/ls_lt.png)

#### 18. 列出你的主目录 ####

要列出你的主目录，你可以用"~"(**波浪号**)来代表它。这样你就不必输入完整的目录名。让我们假设家文件名为**/home/pungki**，那么**波浪号**就对/home/pungki有意义了。

    $ ls ~

![](http://linoxide.com/wp-content/uploads/2014/01/ls_tilde.png)

#### 19. 列出父目录 ####

无论你在那个目录，你可以列出父目录而不必输入完整路径。这是个例子。

    $ ls ../

这回列出**1**层之上的目录内容。

    $ ls ../../

这回列出**2**层之上的目录内容（译注：可不支持“...”来代表2层之上）。

![](http://linoxide.com/wp-content/uploads/2014/01/ls_parent.png)

#### 20. 打印ls命令版本 ####

使用--version参数打印它。

    $ ls --version

![](http://linoxide.com/wp-content/uploads/2014/01/ls_version.png)

### 总结 ###

这些是在日常操作中会使用到的参数。当然你总可以输入**man ls** 或者 **ls --help** 来查询ls的手册页

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-ls-command/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出