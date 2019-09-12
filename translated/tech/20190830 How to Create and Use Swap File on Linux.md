[#]: collector: (lujun9972)
[#]: translator: (hello-wn)
[#]: reviewer: ( )
[#]: publisher: (heguangzhi)
[#]: url: ( )
[#]: subject: (How to Create and Use Swap File on Linux)
[#]: via: (https://itsfoss.com/create-swap-file-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Linux 上创建和使用交换文件
======

本教程讨论了 Linux 中交换文件的概念，为什么使用它以及它相对于传统交换分区的优势。您将学习如何创建交换文件和调整其大小。

### 什么是 Linux 的交换文件？

交换文件允许 Linux 将磁盘空间模拟为内存。当您的系统开始耗尽内存时，它会使用交换空间将内存的一些内容交换到磁盘空间上。这样释放了内存，为更重要的进程服务。当内存再次空闲时，它会从磁盘交换回数据。我建议[阅读这篇文章，了解更多关于交换在 Linux ][1]。

传统上，交换空间被用作磁盘上的一个独立分区。安装 Linux 时，只需创建一个单独的分区进行交换。但是这种趋势在最近几年发生了变化。

使用交换文件，您不再需要单独的分区。您在 root 下创建一个文件，并告诉您的系统将其用作交换空间就行了。

使用专用的交换分区，在许多情况下，调整交换空间的大小是一个噩梦，也是一项不可能完成的任务。但是有了交换文件，你可以随意调整它们的大小。

最新版本的 Ubuntu 和其他一些 Linux 发行版已经开始 [默认使用交换文件][2]。即使您没有创建交换分区，Ubuntu 也会自己创建一个 1GB 左右的交换文件。

让我们看看交换文件的更多信息。

![][3]

### 检查 Linux 的交换空间

在您开始添加交换空间之前，最好检查一下您的系统中是否已经有了交换空间。

你可以用[ free 命令在Linux][4]检查它。就我而言，我的[戴尔XPS][5]有 14GB 的交换容量。

```
free -h
              total        used        free      shared  buff/cache   available
Mem:           7.5G        4.1G        267M        971M        3.1G        2.2G
Swap:           14G          0B         14G
```
free 命令给出了交换空间的大小，但它并没有告诉你它是真正的交换分区还是交换文件。swapon 命令在这方面会更好。

```
swapon --show
NAME           TYPE       SIZE USED PRIO
/dev/nvme0n1p4 partition 14.9G   0B   -2
```

如您所见，我有 14.9GB 的交换空间，它在一个单独的分区上。如果是交换文件，类型应该是文件而不是分区。

```
swapon --show
NAME      TYPE SIZE USED PRIO
/swapfile file   2G   0B   -2
```

如果您的系统上没有交换空间，它应该显示如下内容:

```
free -h
              total        used        free      shared  buff/cache   available
Mem:           7.5G        4.1G        267M        971M        3.1G        2.2G
Swap:           0B          0B         0B
```

swapon 命令不会显示任何输出。


### 在 Linux 上创建交换文件

如果您的系统没有交换空间，或者您认为交换空间不足，您可以在 Linux 上创建交换文件。您也可以创建多个交换文件。

[][6]

建议阅读  Ubuntu 14.04 的修复缺失系统设置[快速提示]

让我们看看如何在 Linux 上创建交换文件。我在本教程中使用 Ubuntu 18.04，但它也应该适用于其他 Linux 发行版本。

#### 步骤1:创建一个新的交换文件

首先，创建一个具有所需交换空间大小的文件。假设我想给我的系统增加 1GB 的交换空间。使用fallocate 命令创建大小为 1GB 的文件。

```
sudo fallocate -l 1G /swapfile
```

建议只允许 root 用户读写交换文件。当您尝试将此文件用于交换区域时，您甚至会看到类似“建议的不安全权限0644，0600”的警告。

```
sudo chmod 600 /swapfile
```

请注意，交换文件的名称可以是任意的。如果您需要多个交换空间，您可以给它任何合适的名称，如swap_file_1、swap_file_2等。它只是一个预定义大小的文件。

#### 步骤2:将新文件标记为交换空间

您需要告诉 Linux 系统该文件将被用作交换空间。你可以用 [mkswap][7] 工具做到这一点。

```
sudo mkswap /swapfile
```

您应该会看到这样的输出:

```
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=7e1faacb-ea93-4c49-a53d-fb40f3ce016a
```

#### 步骤3:启用交换文件

现在，您的系统知道文件交换文件可以用作交换空间。但是还没有完成。您需要启用交换文件，以便系统可以开始使用该文件作为交换。

```
sudo swapon /swapfile
```

现在，如果您检查交换空间，您应该会看到您的Linux系统识别并使用它作为交换区域:

```
swapon --show
NAME       TYPE   SIZE USED PRIO
/swapfile  file 1024M   0B   -2
```

#### 第四步:让改变持久化

迄今为止您所做的一切都是暂时的。重新启动系统，所有更改都将消失。

您可以通过将新创建的交换文件添加到 /etc/fstab 文件来使更改持久化。

对 /etc/fstab 文件进行任何更改之前，最好先进行备份。

```
sudo cp /etc/fstab /etc/fstab.back
```

如何将以下行添加到 /etc/fstab 文件的末尾:

```
/swapfile none swap sw 0 0
```


您可以使用[命令行文本编辑器][8]手动执行，或者只使用以下命令:

```
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

现在一切都准备好了。即使在重新启动您的 Linux 系统后，您的交换文件也会被使用。

### 调整交换

交换参数决定了交换空间的使用频率。交换值的范围从0到100。较高的值意味着交换空间将被更频繁地使用。

Ubuntu 桌面的默认交 换度是 60，而服务器的默认交换度是 1。您可以使用以下命令检查swappiness:

```
cat /proc/sys/vm/swappiness
```

为什么服务器应该使用低交换率？因为交换比内存慢，为了获得更好的性能，应该尽可能多地使用内存。在服务器上，性能因素至关重要，因此交换性尽可能低。

[][9]

建议阅读如何在双引导区用另一个替换一个 Linux 发行版[保留主分区]


您可以使用以下系统命令动态更改变:

```
sudo sysctl vm.swappiness=25
```

这种改变只是暂时的。如果要使其永久化，可以编辑 /etc/sysctl.conf 文件，并在文件末尾添加swappiness 值:


```
vm.swappiness=25
```

### 在 Linux 上调整交换空间的大小

在 Linux 上有几种方法可以调整交换空间的大小。但是在您看到这一点之前，您应该了解一些关于它的事情。

当您要求系统停止将交换文件用于交换区域时，它会将所有数据(确切地说是页面)传输回内存。所以你应该有足够的空闲内存，然后再停止交换。

这就是为什么创建和启用另一个临时交换文件是一个好的做法原因。这样，当您交换原始交换区域时，您的系统将使用临时交换文件。现在您可以调整原始交换空间的大小。您可以手动删除临时交换文件或保持原样，下次启动时会自动删除。

如果您有足够的可用内存或者创建了临时交换空间，那就使您的原始交换文件下线。

```
sudo swapoff /swapfile
```

现在您可以使用 fallocate 命令来更改文件的大小。比方说，您将其大小更改为 2GB:

```
sudo fallocate -l 2G /swapfile
```

现在再次将文件标记为交换空间:

```
sudo mkswap /swapfile
```

并再次使交换文件上线:

```
sudo swapon /swapfile
```
您也可以选择同时拥有多个交换文件。

### 删除 Linux 中的交换文件

您可能有不在 Linux 上使用交换文件的原因。如果您想删除它，该过程类似于您刚才看到的调整交换大小的过程。

首先，确保你有足够的空闲内存。现在使交换文件离线:

```
sudo swapoff /swapfile
```

下一步是从 /etc/fstab 文件中删除相应的条目。

最后，您可以删除文件来释放空间:

```
sudo rm /swapfile
```

**你交换吗？**

我想您现在已经很好地理解了 Linux 中的交换文件概念。现在，您可以根据需要轻松创建交换文件或调整它们的大小。

如果你对这个话题有什么要补充的或者有任何疑问，请在下面留下评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-swap-file-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/swap-size/
[2]: https://help.ubuntu.com/community/SwapFaq
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/swap-file-linux.png?resize=800%2C450&ssl=1
[4]: https://linuxhandbook.com/free-command/
[5]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[6]: https://itsfoss.com/fix-missing-system-settings-ubuntu-1404-quick-tip/
[7]: http://man7.org/linux/man-pages/man8/mkswap.8.html
[8]: https://itsfoss.com/command-line-text-editors-linux/
[9]: https://itsfoss.com/replace-linux-from-dual-boot/
