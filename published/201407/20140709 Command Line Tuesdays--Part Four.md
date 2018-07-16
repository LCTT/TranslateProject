命令行星期二——第四部分
===================

大家好。新的一周，新的冒险！

今天，我们将会学习使用四个相当简单的命令去操作文件。好，废话少说，我们开始吧。

在开始学习这些命令之前，我们先稍微说些题外话，讲讲“通配符”的用处。

###通配符###

使用图形工具区复制、粘贴、新建目录等操作也许很容易，但是若想完成一些更复杂的任务，例如仅仅将一个目录下的所有.html文件复制到另一个目录中、或者只复制在某个目录中不存在的文件，这时命令行也许会比较方便。我们回到通配符的学习中，通配符是shell的基本功能，它是一个由一些特殊字符组成的集合，它让你可以用一些简单的规则来选择出某些文件。（通配符可以出现在文件名中，用于指定文件名的字符个数和字母的大/小写等规则）。

如下表 ：

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-125946.png)

下面是肖茨先生给出的一些实例，如下表： 

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-125959.png)

如果你使用一个包含文件名参数的命令，你就可以使用通配符。	

###cp###

cp是一个用于复制文件或者目录的命令，它的用法相当的简单。进入到你想复制的文件所在的目录，然后使用如下命令

`cp file1 file2` -复制一个文件

或者

`cp file1 file2 ... directory` -从当前工作目录复制多个文件到指定的目录。

下表是肖茨先生给出的cp命令的一些选项：

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-134248.png)

###mv###

mv是今天的第二个命令，我们可以使用mv来重命名一个文件或目录，或者移动一个文件或目录。我们可以这样使用mv命令。

`mv filename1  filename2` -若想将文件filename1重命名为filename2。

或者

`mv file directory` -若想将一个文件移动到某个目录。

下表是一些mv命令的实例

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-133515.png)

###rm###

rm命令是用于删除文件或目录，它的用法比较直接，如下：

`rm file`

或者

`rm -r driectory`

这里也有一个包含rm其他选项的表

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-133529.png)

但是，使用rm命令时要小心点。因为并没有撤销删除的选项，因此使用rm命令式要格外的小心，避免对你的系统造成不必要的破坏。

###mkdir###

mkdir是用于创建目录.它是今天最简单的一个命令：

`mkdir directory`

看，目录成功创建了！

这是本周的内容，下周二再见，致以最真诚的问候！

-------------------------------------------------------------------------
via: https://news.opensuse.org/2014/07/08/command-line-tuesdays-part-four/

译者：[cvsher](https://github.com/cvsher) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
