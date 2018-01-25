如何根据文件权限查找文件
======

![](https://www.ostechnix.com/wp-content/uploads/2017/12/Find-Files-Based-On-their-Permissions-720x340.png)

在 Linux 中查找文件并不是什么大问题。市面上也有很多可靠的自由开源的可视化查找工具。但对我而言，查找文件，用命令行的方式会更快更简单。我们已经知道 [如何根据访问和修改文件的时间寻找或整理文件][1]。今天，在基于 Unix 的操作系统中，我们将见识如何通过权限查找文件。

本段教程中，我将创建三个文件名为 `file1`，`file2` 和 `file3` 分别赋予 `777`，`766` 和 `655` 文件权限，并分别置于名为 `ostechnix` 的文件夹中。

```
mkdir ostechnix && cd ostechnix/
install -b -m 777 /dev/null file1
install -b -m 766 /dev/null file2
install -b -m 655 /dev/null file3
```

![][3]

现在，让我们通过权限来查找一下文件。

### 根据权限查找文件

根据权限查找文件最具代表性的语法：

```
find -perm mode
```

mode 可以是代表权限的八进制数字（777、666 …）也可以是权限符号（u=x，a=r+x）。

在深入之前，我们就以下三点详细说明 mode 参数。

1. 如果我们不指定任何参数前缀，它将会寻找**具体**权限的文件。
2. 如果我们使用 `-` 参数前缀， 寻找到的文件至少拥有 mode 所述的权限，而不是具体的权限（大于或等于此权限的文件都会被查找出来）。
3. 如果我们使用 `/` 参数前缀，那么所有者、组或者其他人任意一个应当享有此文件的权限。

为了让你更好的理解，让我举些例子。

首先，我们将要看到基于数字权限查找文件。

### 基于数字（八进制）权限查找文件

让我们运行下列命令：

```
find -perm 777
```

这条命令将会查找到当前目录权限为**确切为 777** 权限的文件。

![1][4]

如你看见的屏幕输出，file1 是唯一一个拥有**确切为 777 权限**的文件。

现在，让我们使用 `-` 参数前缀，看看会发生什么。

```
find -perm -766
```

![][5]

如你所见，命令行上显示两个文件。我们给 file2 设置了 766 权限，但是命令行显示两个文件，什么鬼？因为，我们设置了 `-` 参数前缀。它意味着这条命令将在所有文件中查找文件所有者的“读/写/执行”权限，文件用户组的“读/写”权限和其他用户的“读/写”权限。本例中，file1 和 file2 都符合要求。换句话说，文件并不一样要求时确切的 766 权限。它将会显示任何属于（高于）此权限的文件 。

然后，让我们使用 `/` 参数前置，看看会发生什么。

```
find -perm /222
```

![][6]

上述命令将会查找某些人（要么是所有者、用户组，要么是其他人）拥有写权限的文件。这里有另外一个例子：

```
find -perm /220
```

这条命令会查找所有者或用户组中拥有写权限的文件。这意味着匹配所有者和用户组任一可写的文件，而其他人的权限随意。

如果你使用 `-` 前缀运行相同的命令，你只会看到所有者和用户组都拥有写权限的文件。

```
find -perm -220
```

下面的截图会告诉你这两个参数前缀的不同。

![][7]

如我之前说过的一样，我们也可以使用符号表示文件权限。

请阅读：

- [如何在 Linux 中找到最大和最小的目录和文件][10]
- [如何在 Linux 的目录树中找到最老的文件][11]
- [如何在 Linux 中找到超过或小于某个大小的文件][12]

### 基于符号的文件权限查找文件

在下面的例子中，我们使用例如 `u`（所有者）、`g`（用户组） 和 `o`（其他） 的符号表示法。我们也可以使用字母 `a` 代表上述三种类型。我们可以通过特指的 `r` （读）、 `w` （写）、 `x` （执行）分别代表它们的权限。

例如，寻找用户组中拥有 `写` 权限的文件，执行：

```
find -perm -g=w
```

![][8]

上面的例子中，file1 和 file2 都拥有 `写` 权限。请注意，你可以等效使用 `=` 或 `+` 两种符号标识。例如，下列两行相同效果的代码。

```
find -perm -g=w
find -perm -g+w
```

查找文件所有者中拥有写权限的文件，执行：

```
find -perm -u=w
```

查找所有用户中拥有写权限的文件，执行：

```
find -perm -a=w
```

查找所有者和用户组中同时拥有写权限的文件，执行：

```
find -perm -g+w,u+w
```

上述命令等效与 `find -perm -220`。

查找所有者或用户组中拥有写权限的文件，执行：

```
find -perm /u+w,g+w
```

或者,

```
find -perm /u=w,g=w
```

上述命令等效于 `find -perm /220`。

更多详情，参照 man 手册。

```
man find
```

了解更多简化案例或其他 Linux 命令，查看[man 手册][9]。

然后，这就是所有的内容。希望这个教程有用。更多干货，敬请关注。

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-files-based-permissions/

作者：[SK][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/find-sort-files-based-access-modification-date-time-linux/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7/
[3]:https://www.ostechnix.com/wp-content/uploads/2017/12/find-files-1-1.png 
[4]:https://www.ostechnix.com/wp-content/uploads/2017/12/find-files-2.png
[5]:https://www.ostechnix.com/wp-content/uploads/2017/12/find-files-3.png
 
[6]:https://www.ostechnix.com/wp-content/uploads/2017/12/find-files-6.png
[7]:https://www.ostechnix.com/wp-content/uploads/2017/12/find-files-7.png 
[8]:https://www.ostechnix.com/wp-content/uploads/2017/12/find-files-8.png 
[9]:https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
[10]:https://www.ostechnix.com/how-to-find-largest-and-smallest-directories-and-files-in-linux/
[11]:https://www.ostechnix.com/find-oldest-file-directory-tree-linux/
[12]:https://www.ostechnix.com/find-files-bigger-smaller-x-size-linux/