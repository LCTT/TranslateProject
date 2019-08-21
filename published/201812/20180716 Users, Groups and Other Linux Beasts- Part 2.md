用户、组及其它 Linux 特性（二）
======
> 我们继续创建和管理用户和组的 Linux 教程之旅。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ducks-94911_1920.jpg?itok=7_ZPiph7)

在正在进行的 Linux 之旅中，我们了解了[如何操作文件夹或目录][1]，现在我们继续讨论 _权限_、_用户_ 和 _组_，这对于确定谁可以操作哪些文件和目录是必要的。[上次][2]，我们展示了如何创建新用户，现在我们将重新起航：

你可以使用 `groupadd` 命令创建新组，然后随意添加用户。例如，使用：

```
sudo groupadd photos
```

这将会创建 `photos` 组。

你需要在根目录下[创建一个目录][1]：

```
sudo mkdir /photos
```

如果你运行 `ls -l /`，结果中会有如下这一行：

```
drwxr-xr-x 1 root root 0 jun 26 21:14 photos
```

输出中的第一个 `root` 是所属的用户，第二个 `root` 是所属的组。

要将 `/photos` 目录的所有权转移到 `photos` 组，使用：

```
chgrp photos /photos
```

`chgrp` 命令通常采用两个参数，第一个参数是将要获得文件或目录所有权的组，第二个参数是希望交给组的文件或目录。

接着，运行 `ls -l /`，你会发现刚才那一行变了：

```
drwxr-xr-x 1 root photos 0 jun 26 21:14 photos
```

你已成功将新目录的所有权转移到了 `photos` 组。

然后，将你自己的用户和 `guest` 用户添加到 `photos` 组：

```
sudo usermod <你的用户名> -a -G photos
sudo usermod guest -a -G photos
```

你可能必须注销并重新登录才能看到更改，但是当你这样做时，运行 `groups` 会将 `photos` 显示为你所属的组之一。

关于上面提到的 `usermod` 命令，需要指明几点。第一：注意要使用 `-G` 选项而不是 `-g` 选项。`-g` 选项更改你的主要组，如果你意外地使用它，它可能会锁定你的一些东西。另一方面，`-G` 将你添加到列出的组中，并没有干扰主要组。如果要将用户添加到多个组中，在 `-G` 之后逐个列出它们，用逗号分隔，不要有空格：

```
sudo usermod <your username> -a -G photos,pizza,spaceforce
```

第二点：小心点不要忘记 `-a` 参数。`-a` 参数代表追加，将你传递给 `-G` 的组列表附加到你已经属于的组。这意味着，如果你不包含 `-a`，那么你之前所属的组列表将被覆盖，再次将你拒之门外。

这些都不是灾难性问题，但这意味着你必须手动将用户添加回你所属的所有组，这可能是个麻烦，特别是如果你失去了对 `sudo` 和 `wheel` 组的访问权限。

### 权限

在将图像复制到 `/photos` 目录之前，还要做一件事情。注意，当你执行上面的 `ls -l /` 时，该文件夹的权限将以 `drwxr-xr-x` 形式返回。

如果你阅读[我在本文开头推荐的文章][3]，你将知道第一个 `d` 表示文件系统中的条目是一个目录，接着你有三组三个字符（`rwx`、`r-x`、`r-x`），它们表示目录的所属用户（`rwx`）的权限，然后是所属组（`r-x`）的权限，最后是其他用户（`r-x`）的权限。这意味着到目前为止唯一具有写权限的人，即能够在 `/photos` 目录中复制或创建文件的唯一人员是 `root` 用户。

但是[我提到的那篇文章也告诉你如何更改目录或文件的权限][3]：

```
sudo chmod g+w /photos
```

运行 `ls -l /`，你会看到 `/photos` 权限变为了 `drwxrwxr-x`。这就是你希望的：组成员现在可以对目录进行写操作了。

现在你可以尝试将图像或任何其他文件复制到目录中，它应该没有问题：

```
cp image.jpg /photos
```

`guest` 用户也可以从目录中读取和写入。他们也可以读取和写入，甚至移动或删除共享目录中其他用户创建的文件。

### 总结

Linux 中的权限和特权系统已经磨练了几十年，它继承自昔日的旧 Unix 系统。就其本身而言，它工作的非常好，而且经过了深思熟虑。熟悉它对于任何 Linux 系统管理员都是必不可少的。事实上，除非你理解它，否则你根本就无法做很多事情。但是，这并不难。

下一次，我们将深入研究文件，并以一个创新的方式查看创建，操作和销毁文件的不同方法。最后一个总是很有趣。

回头见！

通过 Linux 基金会和 edX 的免费[“Linux 简介”][4]课程了解有关 Linux 的更多信息。


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts-part-2

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://linux.cn/article-10066-1.html
[2]:https://linux.cn/article-10370-1.html
[3]:https://www.linux.com/learn/understanding-linux-file-permissions
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
