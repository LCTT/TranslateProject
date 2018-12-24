理解 Linux 链接（二）
======
> 我们继续这个系列，来看一些你所不知道的微妙之处。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/links-fikri-rasyid-7853.jpg?itok=0jBT_1M2)

在[本系列的第一篇文章中][1]，我们认识了硬链接、软链接，知道在很多时候链接是非常有用的。链接看起来比较简单，但是也有一些不易察觉的奇怪的地方需要注意。这就是我们这篇文章中要讲的。例如，像一下我们在前一篇文章中创建的指向 `libblah` 的链接。请注意，我们是如何从目标文件夹中创建链接的。

```
cd /usr/local/lib
ln -s /usr/lib/libblah
```

这样是可以工作的，但是下面的这个例子却是不行的。

```
cd /usr/lib
ln -s libblah /usr/local/lib
```

也就是说，从原始文件夹内到目标文件夹之间的链接将不起作用。

出现这种情况的原因是 `ln` 会把它当作是你在 `/usr/local/lib` 中创建一个到 `/usr/local/lib` 的链接，并在 `/usr/local/lib` 中创建了从 `libblah` 到 `libblah` 的一个链接。这是因为所有链接文件获取的是文件的名称（`libblah），而不是文件的路径，最终的结果将会产生一个坏的链接。

然而，请看下面的这种情况。

```
cd /usr/lib
ln -s /usr/lib/libblah /usr/local/lib
```

是可以工作的。奇怪的事情又来了，不管你在文件系统的任何位置执行这个指令，它都可以好好的工作。使用绝对路径，也就是说，指定整个完整的路径，从根目录（`/`）开始到需要的文件或者是文件夹，是最好的实现方式。

其它需要注意的事情是，只要 `/usr/lib` 和 `/usr/local/lib` 在一个分区上，做一个如下的硬链接：

```
cd /usr/lib
ln libblah /usr/local/lib
```

也是可以工作的，因为硬链接不依赖于指向文件系统内的文件来工作。

如果硬链接不起作用，那么可能是你想跨分区之间建立一个硬链接。就比如说，你有分区 A 上有文件 `fileA` ，并且把这个分区挂载到 `/path/to/partitionA/directory` 目录，而你又想从 `fileA` 链接到分区 B 上 `/path/to/partitionB/directory` 目录，这样是行不通的。

```
ln /path/to/partitionA/directory/file /path/to/partitionB/directory
```

正如我们之前说的一样，硬链接是分区表中指向的是同一个分区的数据的条目，你不能把一个分区表的条目指向另一个分区上的数据，这种情况下，你只能选择创建一个软链接：

```
ln -s /path/to/partitionA/directory/file /path/to/partitionB/directory
```

另一个软链接能做到，而硬链接不能的是链接到一个目录。

```
ln -s /path/to/some/directory /path/to/some/other/directory
```

这将在 `/path/to/some/other/directory` 中创建 `/path/to/some/directory` 的链接，没有任何问题。

当你使用硬链接做同样的事情的时候，会提示你一个错误，说不允许那么做。而不允许这么做的原因量会导致无休止的递归：如果你在目录 A 中有一个目录 B，然后你在目录 B 中链接 A，就会出现同样的情况，在目录 A 中，目录 A 包含了目录 B，而在目录 B 中又包含了 A，然后又包含了 B，等等无穷无尽。

当然你可以在递归中使用软链接，但你为什么要那样做呢？

### 我应该使用硬链接还是软链接呢？

通常，你可以在任何地方使用软链接做任何事情。实际上，在有些情况下你只能使用软链接。话说回来，硬链接的效率要稍高一些：它们占用的磁盘空间更少，访问速度更快。在大多数的机器上，你可以忽略这一点点的差异，因为：在磁盘空间越来越大，访问速度越来越快的今天，空间和速度的差异可以忽略不计。不过，如果你是在一个有小存储和低功耗的处理器上使用嵌入式系统上使用 Linux， 则可能需要考虑使用硬链接。

另一个使用硬链接的原因是硬链接不容易损坏。假设你有一个软链接，而你意外的移动或者删除了它指向的文件，那么你的软链接将会损坏，并指向了一个不存在的东西。这种情况是不会发生在硬链接中的，因为硬链接直接指向的是磁盘上的数据。实际上，磁盘上的空间不会被标记为空闲，除非最后一个指向它的硬链接把它从文件系统中擦除掉。

软链接，在另一方面比硬链接可以做更多的事情，而且可以指向任何东西，可以是文件或目录。它也可以指向不在同一个分区上的文件和目录。仅这两个不同，我们就可以做出唯一的选择了。

### 下期

现在我们已经介绍了文件和目录以及操作它们的工具，你是否已经准备好转到这些工具，可以浏览目录层次结构，可以查找文件中的数据，也可以检查目录。这就是我们下一期中要做的事情。下期见。

你可以通过 Linux 基金会和 edX “[Linux 简介][2]”了解更多关于 Linux 的免费课程。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/10/understanding-linux-links-part-2

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[Jamkr](https://github.com/Jamkr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10173-1.html
[2]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
